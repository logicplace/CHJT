@BOM 2>nul
@echo off
:: CRAZY HAPPY JOY TIME ::
:: AI compiler ::
setlocal EnableDelayedExpansion
chcp 65001 >nul

:: Lower-case the input string ::
set Input=%~1
set Input=%Input:A=a%
set Input=%Input:B=b%
set Input=%Input:C=c%
set Input=%Input:D=d%
set Input=%Input:E=e%
set Input=%Input:F=f%
set Input=%Input:G=g%
set Input=%Input:H=h%
set Input=%Input:I=i%
set Input=%Input:J=j%
set Input=%Input:K=k%
set Input=%Input:L=l%
set Input=%Input:M=m%
set Input=%Input:N=n%
set Input=%Input:O=o%
set Input=%Input:P=p%
set Input=%Input:Q=q%
set Input=%Input:R=r%
set Input=%Input:S=s%
set Input=%Input:T=t%
set Input=%Input:U=u%
set Input=%Input:V=v%
set Input=%Input:W=w%
set Input=%Input:X=x%
set Input=%Input:Y=y%
set Input=%Input:Z=z%

set Compiled=
set Open=0
set ValidCommand= if noop move explode squish die hero.jump hero.drop hero.kill level.win hide unhide sprite face stop var++ var-- var } end 

call :crunchSpace
if not "%Input:~0,3%" == "if " goto :command
set Open=1
set Input=%Input:~3%
call :crunchSpace

set Mode=
:condition
set Cond=
if "%Input:~0,1%" == "~" (
    set Mode=f
    set Input=%Input:~1%
)

if "%Input%" == "" goto finalizeEnd
if "%Input:~0,7%" == "visible" (call :cond 7 c
) else if "%Input:~0,6%" == "facing" (call :comp 6 "left={" "right=}"
) else if "%Input:~0,5%" == "above" (call :subscript 5 "solid=u"
) else if "%Input:~0,5%" == "below" (call :subscript 5 "solid=d"
) else if "%Input:~0,5%" == "right" (call :subscript 5 "solid=r" "gap=h" "space=R"
) else if "%Input:~0,4%" == "left" (call :subscript 4 "solid=l" "gap=g" "space=L"
) else if "%Input:~0,4%" == "last" (call :cond 4 ""
) else if "%Input:~0,4%" == "hero" (call :comp 4 "above=x" "below=X" "side=_"
) else if "%Input:~0,3%" == "var" (call :compArg 3 v Num2
) else if "%Input:~0,3%" == "var" (call :compArg 3 v Num2
) else (
    call :crunchWord
    echo Unknown condional "%Word%" >&2
    exit /B 1
)
if ErrorLevel 1 exit /B 1

if not "%Compiled%" == "" if not "%Agreement%" == "%Mode%" (
    echo Conditionals must have negative agreement. >&2
    exit /B 1
)

set Compiled=%Compiled%%Cond%
call :crunchSpace

if "%Input%" == "" goto finalizeEnd
if "%Input:~0,3%" == "and" (call :append 3 A
) else if "%Input:~0,2%" == "or" (call :append 2 O
) else if "%Input:~0,1%" == "{" (
    set Input=%Input:~1%
    call :crunchSpace
    call :finalize
    goto command
) else goto finalizeEnd
call :crunchSpace
set Agreement=%Mode%
goto condition

:finalize
    if "%Mode%" == "" (set Compiled=%Compiled%t
    ) else set Compiled=%Compiled%%Mode%
exit /B

:finalizeEnd
call :finalize
goto end

:: Compile commands ::
:command
set Command=
call :crunchWord
if "%Word%" == "noop" (set Command=0
) else if "%Word%" == "move" (call :argument "forward=1" "left=2" "right=3" "towardhero=4" "awayhero=5" "up=6" "down=7"
) else if "%Word%" == "explode" (call :argument "=8"
) else if "%Word%" == "squish" (call :argument "=9"
) else if "%Word%" == "die" (call :argument "=D"
) else if "%Word%" == "hero.jump" (call :argument "=B"
) else if "%Word%" == "hero.drop" (call :argument "=F"
) else if "%Word%" == "hero.kill" (call :argument "=K"
) else if "%Word%" == "level.win" (call :argument "=W"
) else if "%Word%" == "hide" (call :argument "=H" "true=H" "false=U"
) else if "%Word%" == "unhide" (call :argument "=U"
) else if "%Word%" == "sprite" (
    if "!Input:~0,1!" == "\" (call :append 2 "C!Input:~1,1!"
    ) else call :append 1 "C!Input:~0,1!"
    call :crunchSpace
    call :append 1 ""
) else if "%Word%" == "face" (call :argument "left=@" "right=#"
) else if "%Word%" == "reset" (call :argument "=I"
) else if "%Word%" == "reprogram" (call :argWord a Num2
) else if "%Word%" == "reprogramwithvar" (call :argWord b Num2
) else if "%Word%" == "stop" (call :argument "=." "pass=,"
) else if "%Word%" == "var++" (set Command=+
) else if "%Word%" == "var--" (set Command=-
) else if "!Word:~0,4!" == "var=" (
    if "!Word:~4!" == "" (call :crunchWord
    ) else set Word=!Word:~4!
    call :Num2 Word "!Word!"
    set Command=s!Word!
) else if "%Word%" == "var" (
    call :crunchWord
    if "!Word!" == "=" (call :crunchWord
    ) else if "!Word:~0,1!" == "=" (set Word=!Word:~1!
    ) else if "!Word!" == "++" (set Command=+
    ) else if "!Word!" == "--" (set Command=-
    ) else (
        echo Unknown action for var "!Word!" >&2
        exit /B 1
    )
    if "!Command!" == "" (
        call :Num2 Word "!Word!"
        set Command=s!Word!
    )
) else if "!Word:end=}!" == "}" (
    set /A Open-=1
    set Command=;
) else if "%Word%" == "if" (
    call :crunchSpace
    set /A Open+=1
    set Mode=
    goto condition
) else if "%Word%" == "" (goto end
) else (
    echo Unknown command %Word%. >&2
    exit /B 1
)

set Compiled=%Compiled%%Command%
call :crunchSpace
goto command

:end
if "%~2" == "compressed" (
    echo %Open% "%Compiled%"
) else (
    set res= 
    for /F "tokens=* eol=" %%i in ('ai\split.bat "%Compiled%"') do set res=!res! "%%i"
    echo %Open% !res:~2!
)
exit /B 0

:doShift
    set shifted= 
    set /A skip=%1 + 1
    for %%i in (%*) do (
        if !skip! == 0 (set shifted=!shifted! %%i
        ) else set /A skip-=1
    )
    set shifted=%shifted:~2%
exit /B

:cond
    set Input=!Input:~%~1!
    set Cond=%~2
exit /B 0

:append
    set Input=!Input:~%~1!
    set Compiled=%Compiled%%~2
exit /B 0

:compCommon
    set Input=!Input:~%~1!
    call :crunchSpace

    if "%Input:~0,1%" == "~" (
        set Mode=f
    ) else set Mode=t

    call :crunchWord
    call :crunchWord
exit /B

:comp
    set Parent=!Input:~0,%~1!
    call :compCommon %~1
    call :doShift 1 %*
    for %%i in (%shifted%) do for /F "tokens=1,2 delims==" %%j in (%%i) do (
        if "%%j" == "%Word%" (
            set Cond=%%k
            exit /B 0
        )
    )
    echo No possible value for %Parent% called %Word%. >&2
exit /B 1

:compArg
    call :compCommon %~1
    if not "%Word:~0,1%" == "$" call :%~3 Word "%Word%"
    set Cond=%~2%Word%
exit /B 0

:subscript
    set Parent=!Input:~0,%~1!
    set Input=!Input:~%~1!
    if not "%Input:~0,1%" == "." (
        echo Subscript required for %Parent%. >&2
        exit /B 1
    )
    set Input=%Input:~1%
    call :crunchWord
    call :doShift 1 %*
    for %%i in (%shifted%) do for /F "tokens=1,2 delims==" %%j in (%%i) do (
        if "%%j" == "%Word%" (
            set Cond=%%k
            exit /B 0
        )
    )
    echo No subscript for %Parent% called %Word%. >&2
exit /B 1

:argCommon
    set Parent=%Word%
    call :crunchWord
    if not "!ValidCommand: %Word% =!" == "%ValidCommand%" (
        set Input=%Word% !Input!
        set Word=
    )
exit /B

:argument
    call :argCommon

    for %%i in (%*) do for /F "tokens=1,2 delims==" %%j in (%%i) do (
        if "%Word%%%k" == "" (
            set Command=%%j
            exit /B 0
        )
        if "%%j" == "%Word%" (
            set Command=%%k
            exit /B 0
        )
    )
    echo No argument "%Word%" for %Parent%. >&2
exit /B 1

:argWord
    call :argCommon

    if "%Word%" == "" (
        echo %Parent% requires an argument. >&2
        exit /B
    )
    if not "%Word:~0,1%" == "$" call :%~2 Word "%Word%"
    set Command=%~1%Word%
exit /B

:crunchSpace
    for /F "tokens=* eol=" %%i in ("%Input%") do set Input=%%i
exit /B

:crunchWord
    for /F "tokens=1* eol= delims=(,) " %%i in ("x%Input%") do (
        set Word=%%i
        set Input=%%j
    )
    set Word=%Word:~1%
exit /B

:Num2
    if %~2 LSS 10 (
        set %1=0%~2
    ) else set %1=%~2
exit /B
