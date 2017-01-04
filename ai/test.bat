@BOM 2>nul
@echo off
:: CRAZY HAPPY JOY TIME ::
:: AI library test suite ::
setlocal EnableDelayedExpansion
chcp 65001 >nul

if "%1" == "" goto comp
set Tests=%1
set ExistingTests=comp compBasic compComplex decomp decompBasic decompComplex
if not "!ExistingTests:%Tests%=!" == "%ExistingTests%" goto %Tests%

:comp
:: Basic Compile Tests ::
:compBasic
call :testFullComp NoOp         "0" "noop"
call :testFullComp MoveForward  "1" "move(forward)"
call :testFullComp MoveLeft     "2" "move(left)"
call :testFullComp MoveRight    "3" "move(right)"
call :testFullComp MoveToward   "4" "move(towardHero)"
call :testFullComp MoveAway     "5" "move(awayHero)"
call :testFullComp MoveDown     "6" "move(up)"
call :testFullComp MoveUp       "7" "move(down)"
call :testFullComp Explode      "8" "explode()"
call :testFullComp Squish       "9" "squish()"
call :testFullComp Die          "D" "die()"
call :testFullComp HeroJump     "B" "hero.jump()"
call :testFullComp HeroDrop     "F" "hero.drop()"
call :testFullComp HeroKill     "K" "hero.kill()"
call :testFullComp LevelWin     "W" "level.win()"
call :testFullComp Hide1        "H" "hide()"
call :testFullComp Hide2        "H" "hide(true)"
call :testFullComp Unhide1      "U" "unhide()"
call :testFullComp Unhide2      "U" "hide(false)"
call :testFullComp ChangeSprite "CΘ" "sprite(Θ)"
call :testFullComp SpriteSpace  "C " "sprite(\ )"
call :testFullComp SpriteRParen "C)" "sprite(\))"
:: TODO: SpritVar tests
call :testFullComp FaceLeft     "@" "face(left)"
call :testFullComp FaceRight    "#" "face(right)"

call :testPartComp IsVisible        "ct" "if visible"
call :testPartComp IsVisibleOpen    "ct" "if visible {"
call :testPartComp IsNotVisible     "cf" "if ~visible"
call :testPartComp IsNotVisibleOpen "cf" "if ~visible {"
call :testPartComp LeftIsSolid      "lt" "if left.solid"
call :testPartComp LeftIsNotSolid   "lf" "if ~left.solid"
call :testPartComp RightIsSolid     "rt" "if right.solid"
call :testPartComp RightIsNotSolid  "rf" "if ~right.solid"
call :testPartComp AboveIsSolid     "ut" "if above.solid"
call :testPartComp AboveIsNotSolid  "uf" "if ~above.solid"
call :testPartComp BelowIsSolid     "dt" "if below.solid"
call :testPartComp BelowIsNotSolid  "df" "if ~below.solid"
call :testPartComp LeftIsGap        "gt" "if left.gap"
call :testPartComp LeftIsNotGap     "gf" "if ~left.gap"
call :testPartComp RightIsGap       "ht" "if right.gap"
call :testPartComp RightIsNotGap    "hf" "if ~right.gap"
call :testPartComp LeftIsEither     "Lt" "if left.space"
call :testPartComp LeftIsNotEither  "Lf" "if ~left.space"
call :testPartComp RightIsEither    "Rt" "if right.space"
call :testPartComp RightIsNotEither "Rf" "if ~right.space"
call :testPartComp PlayerSeme       "xt" "if hero collides above"
call :testPartComp NotPlayerSeme    "xf" "if hero ~collides above"
call :testPartComp EnemySeme        "Xt" "if hero collides below"
call :testPartComp NotEnemySeme     "Xf" "if hero ~collides below"
call :testPartComp HorzCollide      "_t" "if hero collides side"
call :testPartComp NotHorzCollide   "_f" "if hero ~collides side"
call :testPartComp FacingLeft       "{t" "if facing == left"
call :testPartComp NotFacingLeft    "{f" "if facing ~= left"
call :testPartComp FacingRight      "}t" "if facing == right"
call :testPartComp NotFacingRight   "}f" "if facing ~= right"
call :testPartComp LastTrue         "t"  "if last"
call :testPartComp LastFalse        "f"  "if ~last"
call :testPartComp End1             ";"  "}"
call :testPartComp End2             ";"  "end"
call :testPartComp LastOr           "Ot"  "if last or"
call :testPartComp LastAnd          "At"  "if last and"

call :testFullComp SetVar1    "s00"  "var = 0"
call :testFullComp SetVar2    "s10"  "var = 10"
call :testPartComp IsVar1     "v00t" "if var == 0"
call :testPartComp IsNotVar1  "v00f" "if var ~= 0"
call :testPartComp IsVar2     "v10t" "if var == 10"
call :testPartComp IsNotVar2  "v10f" "if var ~= 10"
call :testFullComp IncVar     "+"    "var++"
call :testFullComp DecVar     "-"    "var--"

call :testFullComp Stop     "." "stop()"
call :testFullComp StopPass "," "stop(pass)"

:: Spacing Tests ::
call :testFullComp MoveForwardS100 "1"   "move (forward)"
call :testFullComp MoveForwardS010 "1"   "move( forward)"
call :testFullComp MoveForwardS001 "1"   "move(forward )"
call :testFullComp MoveForwardS110 "1"   "move ( forward)"
call :testFullComp MoveForwardS101 "1"   "move (forward )"
call :testFullComp MoveForwardS011 "1"   "move( forward )"
call :testFullComp MoveForwardS111 "1"   "move ( forward )"
call :testFullComp MoveForwardTabs "1"   "  move(forward)"
call :testFullComp CommandsX3      "010" "noop move(forward) noop"
call :testFullComp CommandsX3S111  "010" "noop move ( forward ) noop"
call :testFullComp SetVarS00       "s00" "var=0"
call :testFullComp SetVarS10       "s00" "var= 0"
call :testFullComp SetVarS01       "s00" "var =0"

:: Complex Compile Tests ::
:compComplex

if "%Tests:~0,4%" == "comp" goto end

:decomp
:: Basic Decompile Tests ::
:decompBasic
call :testDecomp NoOp         "0" "noop"
call :testDecomp MoveForward  "1" "move(forward)"
call :testDecomp MoveLeft     "2" "move(left)"
call :testDecomp MoveRight    "3" "move(right)"
call :testDecomp MoveToward   "4" "move(towardHero)"
call :testDecomp MoveAway     "5" "move(awayHero)"
call :testDecomp MoveUp       "6" "move(up)"
call :testDecomp MoveDown     "7" "move(down)"
call :testDecomp Explode      "8" "explode()"
call :testDecomp Squish       "9" "squish()"
call :testDecomp Die          "D" "die()"
call :testDecomp HeroJump     "B" "hero.jump()"
call :testDecomp HeroDrop     "F" "hero.drop()"
call :testDecomp HeroKill     "K" "hero.kill()"
call :testDecomp LevelWin     "W" "level.win()"
call :testDecomp Hide         "H" "hide()"
call :testDecomp Unhide       "U" "unhide()"
call :testDecomp ChangeSprite "C@" "sprite(@)"
call :testDecomp SpriteSpace  "C " "sprite(\ )"
call :testDecomp SpriteRParen "C)" "sprite(\))"
:: TODO: SpritVar tests
call :testDecomp FaceLeft     "@" "face(left)"
call :testDecomp FaceRight    "#" "face(right)"

call :testDecomp IsVisible        "ct" "if visible {" "}"
call :testDecomp IsNotVisible     "cf" "if ~visible {" "}"
call :testDecomp LeftIsSolid      "lt" "if left.solid {" "}"
call :testDecomp LeftIsNotSolid   "lf" "if ~left.solid {" "}"
call :testDecomp RightIsSolid     "rt" "if right.solid {" "}"
call :testDecomp RightIsNotSolid  "rf" "if ~right.solid {" "}"
call :testDecomp AboveIsSolid     "ut" "if above.solid {" "}"
call :testDecomp AboveIsNotSolid  "uf" "if ~above.solid {" "}"
call :testDecomp BelowIsSolid     "dt" "if below.solid {" "}"
call :testDecomp BelowIsNotSolid  "df" "if ~below.solid {" "}"
call :testDecomp LeftIsGap        "gt" "if left.gap {" "}"
call :testDecomp LeftIsNotGap     "gf" "if ~left.gap {" "}"
call :testDecomp RightIsGap       "ht" "if right.gap {" "}"
call :testDecomp RightIsNotGap    "hf" "if ~right.gap {" "}"
call :testDecomp LeftIsEither     "Lt" "if left.space {" "}"
call :testDecomp LeftIsNotEither  "Lf" "if ~left.space {" "}"
call :testDecomp RightIsEither    "Rt" "if right.space {" "}"
call :testDecomp RightIsNotEither "Rf" "if ~right.space {" "}"
call :testDecomp PlayerSeme       "xt" "if hero collides above {" "}"
call :testDecomp NotPlayerSeme    "xf" "if hero ~collides above {" "}"
call :testDecomp EnemySeme        "Xt" "if hero collides below {" "}"
call :testDecomp NotEnemySeme     "Xf" "if hero ~collides below {" "}"
call :testDecomp HorzCollide      "_t" "if hero collides side {" "}"
call :testDecomp NotHorzCollide   "_f" "if hero ~collides side {" "}"
call :testDecomp FacingLeft       "{t" "if facing == left {" "}"
call :testDecomp NotFacingLeft    "{f" "if facing ~= left {" "}"
call :testDecomp FacingRight      "}t" "if facing == right {" "}"
call :testDecomp NotFacingRight   "}f" "if facing ~= right {" "}"
call :testDecomp LastTrue         "t"  "if last {" "}"
call :testDecomp LastFalse        "f"  "if ~last {" "}"
call :testDecomp End              ";"  "}"
call :testDecomp LastOr           "O"  "if last or  {" "}"
call :testDecomp LastAnd          "A"  "if last and  {" "}"

:: Complex Decompile Tests ::
:decompComplex

:end
exit /B

:doShift
    set shifted= 
    set /A skip=%1 + 1
    for %%i in (%*) do (
        if !skip! == 0 (set shifted=!shifted! %%i
        ) else set /A skip-=1
    )
    set shifted=%shifted:~2%
exit /B

:testComp
::testComp Name "Compiled" "Line1" ...
    set Res=
    set Opens=0
    call :doShift 2 %*
    for %%i in (%shifted%) do for /F "tokens=1* eol=" %%j in ('ai\compile.bat %%i') do (
        set /A Opens+=%%j
        set Res=!Res!%%~k
    )
    if not "%~2" == "%Res%" (
        echo NG: Compilation of %1 failed. Expected "%~2" got "%Res%" >&2
        exit /B 1
    )
exit /B 0

:testPartComp
    call :testComp %*
    if ErrorLevel 1 exit /B 1
    echo OK: Compilation of %1 succeeded
exit /B 0

:testFullComp
    call :testComp %*
    if ErrorLevel 1 exit /B 1
    if not "%Opens%" == "0" (
        echo Compilation of %1 has leftover openings. >&2
        exit /B 1
    )
    echo OK: Compilation of %1 succeeded
exit /B 0

:testCompError
    call ai\compile.bat "%~2" >nul 2>nul
    if "%ErrorLevel%" == "0" (
        echo NG: Expected compilation of %1, "%~2", to fail.
        exit /B 1
    )
    :: TODO Real error codes?
    echo OK: Compilation of %1 produced expected error
exit /B 0

:testDecomp
::testComp Name "Compiled" "Line1" ...
    set LineNumber=1
    call :doShift 2 %*
    for %%i in (%shifted%) do (
        set LineC!LineNumber!=%%~i
        set /A LineNumber+=1
    )
    set LineNumber=1
    set LineR1=
    for /F "tokens=* eol=" %%l in ('ai\decompile.bat %2') do (
        set LineR!LineNumber!=%%l
        set /A LineNumber+=1
    )
    for /L %%i in (1,1,%LineNumber%) do (
        if not "!LineC%%i!" == "!LineR%%i!" (
            echo Decompilation of %1 failed on line %%i. Expected "!LineC%%i!" got "!LineR%%i!" >&2
            exit /B 1
        )
    )
    echo OK: Decompilation of %1 succeeded
exit /B 0
