@BOM 2>nul
@echo off
:: CRAZY HAPPY JOY TIME ::
:: AI decompiler ::
setlocal EnableDelayedExpansion
chcp 65001 >nul

:: Defaults & presets ::
set Tabs=
set Condition=

if not "%~2" == ""  (
    for %%F in (%*) do for /F "tokens=1,2 eol=" %%G in (%%F) do call :decompCommand "%%~G" "%%~H"
) else (
    for /F "tokens=1,2 eol=" %%G in ('ai\split.bat "%~1"') do call :decompCommand "%%~G" "%%~H"
)
if not "%Condition%" == "" echo %Tabs%%Condition% {
exit /B 0

:: Helper methods ::
:condition
::condition "Text" [BooleanJoiner]
    if "%Condition%" == "" (
        if "%~2" == "" (
            set Condition=if 
        ) else (
            set Condition=if last
        )
    )

    if not "%~2" == "" set Condition=%Condition% %~2 
    if not "%~1" == "" set Condition=%Condition%%~1
exit /B

:recondition
::recondition ??-replacement ?-replacement BlankCase
    if "%Condition%" == "" (
        set Condition=if %~3
        exit /B
    )
    set Condition=!Condition:??=%~1!
    set Condition=!Condition:?=%~2!
exit /B

:newline
::newline "Text"
    if not "%Condition%" == "" (
        echo %Tabs%%Condition% {
        set Condition=
        if "%~2" == "" set Tabs=  %Tabs%
    )
    echo.%Tabs%%~1
exit /B

:: Main code ::
:decompCommand
::decompCommand Command Arg1 ...
    set Arg=%~2
    if "%~1" == "" (call :newline " "
    ) else if "%~1" == "0" (call :newline "noop"
    ) else if "%~1" == "1" (call :newline "move(forward)"
    ) else if "%~1" == "2" (call :newline "move(left)"
    ) else if "%~1" == "3" (call :newline "move(right)"
    ) else if "%~1" == "4" (call :newline "move(towardHero)"
    ) else if "%~1" == "5" (call :newline "move(awayHero)"
    ) else if "%~1" == "6" (call :newline "move(up)"
    ) else if "%~1" == "7" (call :newline "move(down)"
    ) else if "%~1" == "8" (call :newline "explode()"
    ) else if "%~1" == "9" (call :newline "squish()"
    ) else if "%~1" == "D" (call :newline "die()"
    ) else if "%~1" == "B" (call :newline "hero.jump()"
    ) else if "%~1" == "F" (call :newline "hero.drop()"
    ) else if "%~1" == "K" (call :newline "hero.kill()"
    ) else if "%~1" == "W" (call :newline "level.win()"
    ) else if "%~1" == "H" (call :newline "hide()"
    ) else if "%~1" == "U" (call :newline "unhide()"
    ) else if "%~1" == "C" (
        if "%Arg:(=)%" == ")" (set Arg=\!Arg!
        ) else if "%Arg%" == "\" (set Arg=\!Arg!
        ) else if "%Arg%" == "" (set Arg=\ 
        )
        call :newline "sprite(!Arg!)"
    ) else if "%~1" == "@" (call :newline "face(left)"
    ) else if "%~1" == "#" (call :newline "face(right)"
    ) else if "%~1" == "I" (call :newline "reset()"
    ) else if "%~1" == "." (call :newline "stop()"
    ) else if "%~1" == "," (call :newline "stop(pass)"
    ) else if "%~1" == "c" (call :condition "?visible"
    ) else if "%~1" == "l" (call :condition "?left.solid"
    ) else if "%~1" == "r" (call :condition "?right.solid"
    ) else if "%~1" == "d" (call :condition "?below.solid"
    ) else if "%~1" == "u" (call :condition "?above.solid"
    ) else if "%~1" == "g" (call :condition "?left.gap"
    ) else if "%~1" == "h" (call :condition "?right.gap"
    ) else if "%~1" == "L" (call :condition "?left.space"
    ) else if "%~1" == "R" (call :condition "?right.space"
    ) else if "%~1" == "x" (call :condition "hero ?collides above"
    ) else if "%~1" == "X" (call :condition "hero ?collides below"
    ) else if "%~1" == "_" (call :condition "hero ?collides side"
    ) else if "%~1" == "{" (call :condition "facing ?? left"
    ) else if "%~1" == "}" (call :condition "facing ?? right"
    ) else if "%~1" == "t" (call :recondition "==" "" last
    ) else if "%~1" == "f" (call :recondition "~=" ~ ~last
    ) else if "%~1" == ";" (
        if not "%Tabs%" == "" set Tabs=%Tabs:~2%
        call :newline "}" 1
    ) else if "%~1" == "O" (call :condition "" "or"
    ) else if "%~1" == "A" (call :condition "" "and"
    ) else if "%~1" == "s" (call :newline "var = %Arg%"
    ) else if "%~1" == "v" (call :condition "var ?? %Arg%"
    ) else if "%~1" == "+" (call :newline "var++"
    ) else if "%~1" == "-" (call :newline "var--"
    )
exit /B

