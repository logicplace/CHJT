@BOM 2>nul
@echo off
:: CRAZY HAPPY JOY TIME ::
:: AI assembly -> split form like "cmd1 arg" "cmd2" ::
setlocal EnableDelayedExpansion

set TmpAI=%~1
set TmpStart=0
set NoArg=0123456789DBFKWHU@#IclrdughLRxX_{}tf;OA+-.,
:: Variable name form: TypeArgs                                                                   ::
::   Type: Arg = String, Num = Number                                          ::
::   Args: Sequences of numbers, each digit is the amount of bytes that arg is ::
set Arg1=C
set Num2=sv
:parseAI_loop
    set TmpCommand=!TmpAI:~%TmpStart%,1!
    if "%TmpCommand%" == "" goto parseAI_endLoop
    set /A TmpStart+=1
    echo %Arg1%|findstr /C:"%TmpCommand%" >nul && (
        set TmpCommand=%TmpCommand% !TmpAI:~%TmpStart%,1!
        set /A TmpStart+=1
    ) || (echo %Num2%|findstr /C:"%TmpCommand%" >nul && (
        set TmpCommand=%TmpCommand% !TmpAI:~%TmpStart%,2!
        if "!TmpCommand:~2,1!" == "0" set TmpCommand=!TmpCommand:~0,1! !TmpCommand:~3,1!
        set /A TmpStart+=2
    ) || (echo %NoArg%|findstr /C:"%TmpCommand%" >nul || (
        echo Error parsing AI, unknown command %TmpCommand% >&2
        exit /B 1
    )))
    echo %TmpCommand%
goto parseAI_loop
:parseAI_endLoop
exit /B 0
