@BOM 2>nul
@echo off
:: CRAZY HAPPY JOY TIME ::
:: Level & AI editor ::
setlocal EnableDelayedExpansion
chcp 65001 >nul

:::: Set up window ::::
set title=CRAZY HAPPY JOY TIME - LEVEL EDITOR

:::: Declare defaults ::::
set ScreenTop=0
set ScreenLeft=0
set pane=Tile
set SuccessMessage=
set Cursor=◘
set CursorX=0
set CursorY=0
rem set CursorBlink=/D 9 /T 1
set CursorBlink=
set AITabStart=1

:::: Declare tilemap ::::
(set TileA0=☺) && (set CollA0=0)
(set TileA1=☻) && (set CollA1=0)
(set TileA2=♥) && (set CollA2=2)
(set TileA3=♦) && (set CollA3=2)
(set TileA4=♣) && (set CollA4=2)
(set TileA5=♠) && (set CollA5=2)
(set TileA6=•) && (set CollA6=0)
(set TileA7=◘) && (set CollA7=1)
(set TileA8=○) && (set CollA8=0)
(set TileA9=◙) && (set CollA9=1)
(set TileB0=♂) && (set CollB0=2)
(set TileB1=♀) && (set CollB1=2)
(set TileB2=♪) && (set CollB2=2)
(set TileB3=♫) && (set CollB3=2)
(set TileB4=☼) && (set CollB4=0)
(set TileB5=►) && (set CollB5=2)
(set TileB6=◄) && (set CollB6=2)
(set TileB7=↕) && (set CollB7=2)
(set TileB8=‼) && (set CollB8=2)
(set TileB9=¶) && (set CollB9=1)
(set TileC0=§) && (set CollC0=1)
(set TileC1=▬) && (set CollC1=1)
(set TileC2=↨) && (set CollC2=2)
(set TileC3=↑) && (set CollC3=2)
(set TileC4=↓) && (set CollC4=2)
(set TileC5=→) && (set CollC5=2)
(set TileC6=←) && (set CollC6=2)
(set TileC7=∟) && (set CollC7=0)
(set TileC8=↔) && (set CollC8=2)
(set TileC9=▲) && (set CollC9=2)
(set TileD0=▼) && (set CollD0=2)
(set TileD1=⌂) && (set CollD1=0)
(set TileD2=Ç) && (set CollD2=2)
(set TileD3=ü) && (set CollD3=2)
(set TileD4=é) && (set CollD4=2)
(set TileD5=â) && (set CollD5=2)
(set TileD6=ä) && (set CollD6=2)
(set TileD7=à) && (set CollD7=2)
(set TileD8=å) && (set CollD8=2)
(set TileD9=ç) && (set CollD9=2)
(set TileE0=ê) && (set CollE0=2)
(set TileE1=ë) && (set CollE1=2)
(set TileE2=è) && (set CollE2=2)
(set TileE3=ï) && (set CollE3=2)
(set TileE4=î) && (set CollE4=2)
(set TileE5=ì) && (set CollE5=2)
(set TileE6=Ä) && (set CollE6=2)
(set TileE7=Å) && (set CollE7=2)
(set TileE8=É) && (set CollE8=2)
(set TileE9=æ) && (set CollE9=2)
(set TileF0=Æ) && (set CollF0=2)
(set TileF1=ô) && (set CollF1=2)
(set TileF2=ö) && (set CollF2=2)
(set TileF3=ò) && (set CollF3=2)
(set TileF4=û) && (set CollF4=2)
(set TileF5=ù) && (set CollF5=2)
(set TileF6=ÿ) && (set CollF6=2)
(set TileF7=Ö) && (set CollF7=2)
(set TileF8=Ü) && (set CollF8=2)
(set TileF9=¢) && (set CollF9=2)
(set TileG0=£) && (set CollG0=2)
(set TileG1=¥) && (set CollG1=2)
(set TileG2=₧) && (set CollG2=2)
(set TileG3=ƒ) && (set CollG3=2)
(set TileG4=á) && (set CollG4=2)
(set TileG5=í) && (set CollG5=2)
(set TileG6=ó) && (set CollG6=2)
(set TileG7=ú) && (set CollG7=2)
(set TileG8=ñ) && (set CollG8=2)
(set TileG9=Ñ) && (set CollG9=2)
(set TileH0=ª) && (set CollH0=3)
(set TileH1=º) && (set CollH1=3)
(set TileH2=¿) && (set CollH2=0)
(set TileH3=⌐) && (set CollH3=1)
(set TileH4=¬) && (set CollH4=1)
(set TileH5=½) && (set CollH5=1)
(set TileH6=¼) && (set CollH6=1)
(set TileH7=¡) && (set CollH7=0)
(set TileH8=«) && (set CollH8=2)
(set TileH9=») && (set CollH9=2)
(set TileI0=░) && (set CollI0=1)
(set TileI1=▒) && (set CollI1=1)
(set TileI2=▓) && (set CollI2=1)
(set TileI3=│) && (set CollI3=1)
(set TileI4=┤) && (set CollI4=1)
(set TileI5=╡) && (set CollI5=1)
(set TileI6=╢) && (set CollI6=1)
(set TileI7=╖) && (set CollI7=1)
(set TileI8=╕) && (set CollI8=1)
(set TileI9=╣) && (set CollI9=1)
(set TileJ0=║) && (set CollJ0=1)
(set TileJ1=╗) && (set CollJ1=1)
(set TileJ2=╝) && (set CollJ2=1)
(set TileJ3=╜) && (set CollJ3=1)
(set TileJ4=╛) && (set CollJ4=1)
(set TileJ5=┐) && (set CollJ5=1)
(set TileJ6=└) && (set CollJ6=1)
(set TileJ7=┴) && (set CollJ7=1)
(set TileJ8=┬) && (set CollJ8=1)
(set TileJ9=├) && (set CollJ9=1)
(set TileK0=─) && (set CollK0=1)
(set TileK1=┼) && (set CollK1=1)
(set TileK2=╞) && (set CollK2=1)
(set TileK3=╟) && (set CollK3=1)
(set TileK4=╚) && (set CollK4=1)
(set TileK5=╔) && (set CollK5=1)
(set TileK6=╩) && (set CollK6=1)
(set TileK7=╦) && (set CollK7=1)
(set TileK8=╠) && (set CollK8=1)
(set TileK9=═) && (set CollK9=1)
(set TileL0=╬) && (set CollL0=1)
(set TileL1=╧) && (set CollL1=1)
(set TileL2=╨) && (set CollL2=1)
(set TileL3=╤) && (set CollL3=1)
(set TileL4=╥) && (set CollL4=1)
(set TileL5=╙) && (set CollL5=1)
(set TileL6=╘) && (set CollL6=1)
(set TileL7=╒) && (set CollL7=1)
(set TileL8=╓) && (set CollL8=1)
(set TileL9=╫) && (set CollL9=1)
(set TileM0=╪) && (set CollM0=1)
(set TileM1=┘) && (set CollM1=1)
(set TileM2=┌) && (set CollM2=1)
(set TileM3=█) && (set CollM3=1)
(set TileM4=▄) && (set CollM4=1)
(set TileM5=▌) && (set CollM5=1)
(set TileM6=▐) && (set CollM6=1)
(set TileM7=▀) && (set CollM7=1)
(set TileM8=α) && (set CollM8=2)
(set TileM9=ß) && (set CollM9=2)
(set TileN0=Γ) && (set CollN0=2)
(set TileN1=π) && (set CollN1=2)
(set TileN2=Σ) && (set CollN2=2)
(set TileN3=σ) && (set CollN3=2)
(set TileN4=µ) && (set CollN4=2)
(set TileN5=τ) && (set CollN5=2)
(set TileN6=Φ) && (set CollN6=2)
(set TileN7=Θ) && (set CollN7=2)
(set TileN8=Ω) && (set CollN8=2)
(set TileN9=δ) && (set CollN9=2)
(set TileO0=∞) && (set CollO0=2)
(set TileO1=φ) && (set CollO1=2)
(set TileO2=ε) && (set CollO2=2)
(set TileO3=∩) && (set CollO3=2)
(set TileO4=≡) && (set CollO4=3)
(set TileO5=±) && (set CollO5=3)
(set TileO6=≥) && (set CollO6=3)
(set TileO7=≤) && (set CollO7=3)
(set TileO8=⌠) && (set CollO8=1)
(set TileO9=⌡) && (set CollO9=1)
(set TileP0=÷) && (set CollP0=3)
(set TileP1=≈) && (set CollP1=3)
(set TileP2=°) && (set CollP2=3)
(set TileP3=∙) && (set CollP3=2)
(set TileP4=·) && (set CollP4=2)
(set TileP5=√) && (set CollP5=1)
(set TileP6=ⁿ) && (set CollP6=3)
(set TileP7=²) && (set CollP7=3)
(set TileP8=■) && (set CollP8=1)

:: DEBUG ::
REM set test_name=Test AI
REM set test_x=0
REM set test_y=0
REM set test_state=0
REM set test_var=0
REM set test_ai=ct0;f2;.
REM call :editAI test
:::::::::::

:title
:: Display menu, allowing users to select what to do ::
cls
title %title%
color 07

echo ╔═════════════════════════════════════════════════════════════════════════════╗
echo ║                                                                             ║
echo ║                                                                             ║
echo ║                                                                             ║
echo ║                                                                             ║
echo ║                                                                             ║
echo ║                                                                             ║
echo ║                                                                             ║
echo ║                                                                             ║
echo ║                                                                             ║
echo ║                                                                             ║
echo ║                                                                             ║
echo ║                                                                             ║
echo ║                                                                             ║
echo ║                                                                             ║
echo ║                                                        1) Make new level    ║
echo ║                                                                             ║
echo ║                                                        2) Load level        ║
echo ║                                                                             ║
echo ║                                                        3) Quit              ║
echo ║                                                                             ║
echo ║                                                                             ║
echo ╚═════════════════════════════════════════════════════════════════════════════╝
choice /C 123 /N
set in=%ErrorLevel%
if "%in%" == "1" goto makeNew
if "%in%" == "2" goto loadLevel
if "%in%" == "3" goto :eof
goto title

:makeNew
set LevelName=New Level
set ProjectFileName=
set ExportFileName=
set Authors=Anonymous
set NextLevel=
set width=90
set height=24
set color=07
set CharX=0
set CharY=0
set enemys=0
for /L %%i in (0,1,%height%) do (
    (set line%%i=                                                                               )
    (set coll%%i=0000000000000000000000000000000000000000000000000000000000000000000000000000000)
)
goto editLevel

:loadLevel
set /P FileName=Enter level filename: 
set FileName=%FileName:.bat=%.bat
if not exist "%FileName%" goto :loadLevel
set pane=
call "%FileName%"
if not "%pane%" == "" (
    set ProjectFileName=%FileName%
    set ExportFileName=
    goto editLevel
)
for /L %%i (1,1,%enemys%) do (
    call :parseAI enemy%%i
)
set ProjectFileName=
set ExportFileName=%FileName%
goto editLevel

:editLevel
    :: Level editor main loop ::
    call :drawLevel

    :: Reset vars for input ::
    set CollInLitCase=0

    :: Input ::
    if not "%SuccessMessage%" == "" echo %SuccessMessage%
    choice /C 9wasdhqrcnoxjtbp0123zWS /CS /N %CursorBlink% >nul
	set action=%ErrorLevel%
    :: q = Quit
    if %action% == 7 (
        set SuccessMessage=
        (set Labels=title afterEditLevelCases) && goto confirmQuit
    ) else call :editLevelCase%action%
    goto afterEditLevelCases

    :editLevelCase0
    :editLevelCase1
        exit /B

    :: wasd directional movement
    :editLevelCase2
        call :moveCursor 0 -1
        exit /B
    :editLevelCase3
        call :moveCursor -1 0
        exit /B
    :editLevelCase4
        call :moveCursor 0 1
        exit /B
    :editLevelCase5
        call :moveCursor 1 0
        exit /B
    
    :: h = Help
    :editLevelCase6
        cls
        echo.===================== Crazy Happy Joy Time - Level Editor =====================
        echo.   #   Command  Keys   #      1  #             p  Entry  Commands             #
        echo.   wasd - Control cursor      h  help                       Show this help file
        echo.   h - Help     q - Quit      q  quit                     Exit the level editor
        echo.   o - Write out project      o  save [File]           Save to the project file
        echo.   x - Export level file      x  export [File]         Export to the level file
        echo.   j - Jump to the coord      j  jump X Y          Jump to a given map position
        echo.   z - Select tile eg A0      z  tile @#/@ [C]   Set tile by address or literal
        echo.   n - New AI  at cursor      n  new "Name" [State] [Var]  Create a new AI here
        echo.   r - Replace this tile      e  edit "Name"           Open an AI in the editor
        echo.   c - Show/hide  charas      c  copy "Name" "Name"    Make a copy of AI 1 here
        echo.   t - Toggle pane's tab      .  start                     Set start point here
        echo.   b - Show collision #s      /  goal                             Set goal here
        echo.   WS - Scroll  AI  pane         name                            Name the level
        echo.   p - Enter command  ─►         next                    Specify the next level
        echo.                                 color ##            Change level colours to ##
        echo.   # Change  Collision #      +  widen #                   Widen the level by #
        echo.   0 - Below   1 - Solid      ^|  heighten #             Heighten the level by #
        echo.   2 - Above  3-Fallthru      l  line L/R/U/D Len   Draw len tiles in direction
        echo.                                 Shorthand: ll, lr, lu, ld
        echo.
        echo.                                 The 1 forms are faster but both work the same‼
        echo.                                 These 1s may combine: ne, ce, oq, xq, and oxq
        echo.===============================================================================
        pause
        set SuccessMessage=
        exit /B

    :: r = Replace
    :editLevelCase8
        call :writeCursor %CurrentTile%
        exit /B

    :: c = Characters
    :editLevelCase9
        call :toggle DrawAI SuccessMessage "Turned character drawing OFF" "Turned character drawing ON"
        exit /B

    :: n = New AI at position
    :editLevelCase10
        set /P TmpAIName=Enter new AI's name: 
        set /P TmpAIState=Enter new AI's initial state: 
        set /P TmpAIValue=Enter new AI's initial value: 
        call :aiAtCursor "%TmpAIName%" %TmpAIState% %TmpAIValue%
        exit /B

    :: o = write Out
    :editLevelCase11
        goto :save

    :: x = eXport level
    :editLevelCase12
        goto :export

    :: j = Jump to coordinates
    :editLevelCase13
        set /P coords=x y: 
        if "%coords%" == "" exit /B
        for /F "tokens=1*" %%i in ("%coords%") do (
            call :setCursor %%i %%j
        )
        exit /B

    :: t = switch Tabs
    :editLevelCase14
        if "%pane%" == "AI" (
            set pane=Tile
        ) else (
            set pane=AI
        )
        exit /B

    :: b = show collision Blocks instead
    :editLevelCase15
        set pane=Coll
        exit /B

    :: p = type text command
    :editLevelCase16
        set /P Command=:
        for /F "tokens=1,2,3,4" %%G in ("%Command%") do (
            set cmd=%%G
            set arg1=%%~H
            set arg2=%%~I
            set arg3=%%~J
        )
        call :upper cmd
        if "%cmd:HELP=H%" == "H" goto editLevelCase6
        if "%cmd:QUIT=Q%" == "Q" goto comfirmQuit
        if "%cmd:SAVE=O%" == "O" call :save "%arg1%"
        if "%cmd:EXPORT=X%" == "X" call :export "%arg1%"
        if "%cmd%" == "OQ" (
            call :save %arg1%
            goto comfirmQuit
        )
        if "%cmd%" == "XQ" (
            call :export %arg1%
            goto comfirmQuit
        )
        if "%cmd%" == "OXQ" (
            call :save %arg1:-=%
            call :export %arg2%
            goto comfirmQuit
        )
        if "%cmd:JUMP=J%" == "J" call :setCursor %arg1% %arg2%
        if "%cmd:TILE=Z%" == "Z" call :setCurrentTile %arg1% %arg2%
        if "%cmd:NEW=N%" == "N" call :aiAtCursor "%arg1%" %arg2% %arg3%
        if "%cmd:EDIT=E%" == "E" call :openAI "%arg1%" 
        if "%cmd%" == "NE" (
            call :aiAtCursor "%arg1%" %arg2% %arg3%
            call :openAI "%arg1%"
        )
        if "%cmd:COPY=C%" == "C" call :copyAI2Cursor "%arg1%" "%arg2%"
        if "%cmd%" == "CE" (
            call :copyAI2Cursor "%arg1%" "%arg2%"
            call :openAI "%arg2%"
        )
        if "%cmd:START=.%" == "." (
            call :getCursor
            set CharX=!TmpX!
            set CharY=!TmpY!
        )
        if "%cmd:GOAL=/%" == "/" (
            call :getVariableOf "Goalpost"
            if ErrorLevel 1 (
                :: Does not exist, create it ::
                call :aiAtCursor "Goalpost" 0 0
                set enemy!enemys!_avatar=▐
                set enemy!enemys!_ai=_tW;,
            ) else (
                :: Exists, move it ::
                call :getCursor
                set !enemy!_x=!TmpX!
                set !enemy!_y=!TmpY!
            )
        )
        if "%cmd%" == "NAME" (
            set LevelName=%arg1%
            set SuccessMessage=Set level name to "%arg1%"
        )
        if "%cmd%" == "NEXT" (
            set NextLevel=%arg1%
            set SuccessMessage=Set next level to %arg1%
        )
        if "%cmd:WIDEN=+%" == "+" (
            set /A width+=arg1
            set SuccessMessage=Increased level width to !width!
        )
        if "%cmd:HEIGHTEN=|%" == "|" (
            set /A height+=arg1
            set SuccessMessage=Increased level height to !height!
        )
        if "%cmd:LINE=L%" == "L" call :writeLine %arg1:~0,1% %arg2%
        if "%cmd:LINER=LR%" == "LR" call :writeLine R %arg1%
        if "%cmd:LINEL=LL%" == "LL" call :writeLine L %arg1%
        if "%cmd:LINEU=LU%" == "LU" call :writeLine U %arg1%
        if "%cmd:LINED=LD%" == "LD" call :writeLine D %arg1%
        exit /B
        
    :: 0123 = set collision value to
    :editLevelCase17
        call :collCursor 0
        exit /B
    :editLevelCase18
        call :collCursor 1
        exit /B
    :editLevelCase19
        call :collCursor 2
        exit /B
    :editLevelCase20
        call :collCursor 3
        exit /B

    :: z = select a new tile
    :setCurrentTile
        set TileCommand=%~1
        set CollInLitCase=%~2
        goto parseAndSetCurrentTile
    :editLevelCase21
        set /P TileCommand=Tile: 
        :parseAndSetCurrentTile
        set TC2=%TileCommand:~1,1%

        :: Literal character case ::
        if "%TC2%" == "" (
            set CurrentTile=%TileCommand%
            set CurrentColl=%CollInLitCase%
            exit /B
        )

        :: Normalize A0 and 0A ::
        set /A Test=TC2
        if not %TC2% == %Test% set TileCommand=%TC2%%TileCommand:~0,1%
        call :upper TileCommand

        :: Finally, set the character ::
        set CurrentTile=!Tile%TileCommand%!
        set CurrentColl=!Coll%TileCommand%!

        exit /B

    :: WS - scroll tab (AI) pane
    :editLevelCase22
        if %AITabStart% GTR 1 set /A AITabStart-=1
        set SuccessMessage=
        exit /B

    :editLevelCase23
        set /A Tmp=enemys - 19
        if %AITabStart% LSS %Tmp% set /A AITabStart+=1
        set SuccessMessage=
        exit /B

    :afterEditLevelCases
    if "%Cursor%" == "◘" (
        set Cursor=•
    ) else (
        set Cursor=◘
    )
goto editLevel

:editAI
::editAI Variable
    :: Load AI into editor ::
    set EditorI=%~1
    set EditorName=!%~1_name!
    set EditorAvatar=!%~1_avatar!
    set EditorX=!%~1_x!
    set EditorY=!%~1_y!
    set EditorState=!%~1_state!
    set EditorVar=!%~1_var!

    set EditorTop=1
    set EditorCursor=1

    set LastLine=1
    for /F "tokens=* delims=" %%x in ('ai\decompile.bat "!%~1_ai!"') do (
        set EditorLine!LastLine!=%%x
        set /A LastLine+=1
    )

    :editAILoop
    :: AI editor main loop ::
    call :drawAI

    :: Input ::
    if not "%SuccessMessage%" == "" echo %SuccessMessage%
    choice /C 9qhwsWSpjneradADktTo /CS /N %CursorBlink% >nul
	set action=%ErrorLevel%
    :: q = Quit
    call :editAICase%action%
    if %action% == 2 (
        set SuccessMessage=
        (set Labels=endEditAI afterEditAICases) && goto confirmQuit
    )
    goto afterEditAICases

    :editAICase0
    :editAICase1
    :editAICase2
        exit /B

    :: h - Help
    :editAICase3
        cls
        echo.====================== Crazy Happy Joy Time - AI  Editor ======================
        echo.   #   Command  Keys   #      1  #             p  Entry  Commands             #
        echo.   ws - Move the  cursor      h  help                       Show this help file
        echo.   WS - Scroll  viewport      q  quit                        Exit the AI editor
        echo.   h - Help     q - Quit         center   Center the viewport around the cursor
        echo.   a - Jump to view  top      a  top            Jump to the top of the viewport
        echo.   d - Go to view bottom      d  bottom      Jump to the bottom of the viewport
        echo.   A - Jump  to  line  1         home        Jump to the first line in the file
        echo.   D - Jump to last line         end          Jump to the last line in the file
        echo.   j - Jump to this line      j  jump LINE        Jump to the given line number
        echo.   n - Insert  new  line      n  new [TEXT]    Insert a new line above this one
        echo.   k - Delete this  line      k  delete #lines    Delete this + the next #lines
        echo.   e - Copy + edit  line      e  copy        Copy the current line to clipboard
        echo.   r - Replace this line      r  replace TEXT       Replace this line with text
        echo.   t - Tab this line  in      t  tab #lines       Tab in this + the next #lines
        echo.   T - Tab back 1  depth      ^<  untab #lines   Tab back this + the next #lines
        echo.   o - Save  AI  changes      i  import FILE     Read AI from file, overwriting
        echo.   p - Enter command  ─►      x  export FILE               Write out AI to file
        echo.                              v  decompile CODE  Decompile code to current line
        echo.                                 di, do  Pure insert and overwrite decomp modes
        echo.                              c  compile                   Compile current line
        echo.                                 name NAME             Set the name for this AI
        echo.                                 sprite SPRITE           Set its initial sprite
        echo.                                 state STATE              Set its initial state
        echo.                                 var VALUE          Set its var's initial value
        echo.                                 pos X Y               Set its initial position
        echo.   
        echo.                                 The 1 forms are faster but both work the same‼
        echo.-------------------------------------------------------------------------------
        pause
        echo. In terms of the "Initital state" entry in the side bar, the values can be:
        echo.   0 - Facing left and not hidden               8 - Exploding
        echo.   1 - Facing right and not hidden              9 - Squished
        echo.   2 - Facing left and hidden
        echo.   3 - Facing right and hidden
        echo.
        echo.   The code you write here is run on every game step. Like normal code, it runs
        echo. each command in order and can have conditionals that branch execution. It runs
        echo. until reaching a stop command or the end of the "file".
        echo.   There are three constructs in this language: commands, conditionals, and the
        echo. variable assignment. 
        echo.
        echo.   ------------------------------- Commands --------------------------------
        echo.   Some commands require arguments, some don't, but only one at most. Commands
        echo. only need to be whitespace separated (that is, spaces or newlines) and 
        echo. parenthesis around arguments are optional (you may use spaces). Thus, options
        echo. include these, where #3 is the default:
        echo.    1)   move(forward) move(forward) var++
        echo.
        echo.    2)   move forward move forward var++
        echo.
        echo.    3)   move(forward)                         4)   move forward
        echo.         move(forward)                              move forward
        echo.         var++                                      var++
        echo. 
        pause
        echo.   ------------------------------ Conditionals -----------------------------
        echo. Conditionals start with an "if" and are followed by a boolean condition then
        echo. a code block. A code block can either of the following forms:
        echo.        1)   if condition {                   2)   if condition
        echo.               commands...                           commands..
        echo.             }                                     end
        echo. There is a special condition called "last" which refers to the value of the
        echo. previous condition checked. This is only available as the first entry in a
        echo. boolean condition set. These sets are any amount of conditionals joined by and
        echo. or or. For instance:
        echo.                      if facing == left and left.solid or ...
        echo. Every entry in this sequence must be either positive or negative, you may not
        echo. mix negative and positive. Negatives are expressed by using a ~, for example:
        echo.                     if facing ~= left and ~left.solid or ...
        echo. Additionally, you may use a word instead of == if it makes more sense to you:
        echo.              if hero collides above    OR    if hero ~collides above
        echo.
        echo. Spaces around the ==, ~=, word or ~word is required, and there may not be any
        echo. space between the two equal signs or the ~ and its = or word.
        echo. 
        pause
        echo.   ------------------------------- Variables -------------------------------
        echo.   There is only one variable per AI that you address with the term "var". You
        echo. can check it as a conditional, set the variable, or increase/decrease the var
        echo. directly. Variables can initially be set to 0~9 but can be set to 0~99.
        echo.      Check the var:              Set the var:              Step the var:
        echo.       if var == 0                  var = 0                Increase: var++
        echo.       if var ~= 0            Spaces are optional          Decrease: var--
        echo.
        pause
        echo.  General Commands                      Hero's commands
        echo.   noop - No operation, do nothing       hero.jump() - Cause the player to jump
        echo.   level.win() - Beat the level          hero.drop() - Make the hero fall-thru
        echo.                                         hero.kill() - Kill the hero, end level
        pause
        echo.  AI's commands
        echo.   move(Direction) - Make AI move one space in the given direction, tile
        echo.                     solidity does not matter at all.
        echo.     Direction can be any of the following:
        echo.      left, right - Move in a specific direction and adjust the facing.
        echo.      up, down - Move in a specific direction without altering the state.
        echo.      forward - Move left or right, depending on the current facing.
        echo.      towardHero - Move left or right toward the hero, adjusting the facing.
        echo.      awayHero - Move left or right away from the hero, adjusting the facing.
        echo.
        echo.   face(Direction) - Make the AI face in the given direction.
        echo.     Direction can be either of the following:
        echo.      left, right - Face in this specific direction.
        echo.
        echo.   explode() - Kill the AI by making it explode. Changes sprite to ☼
        echo.   squish()  - Kill the AI by making it squish. Changes sprite to ▬
        echo.   die()     - Kill the AI outright.
        echo.
        echo.   hide()   - Hide the AI so the sprite is not drawn. hide(true) is an alias.
        echo.   unhide() - Unhide the AI if it was hidden. hide(false) is an alias.
        echo.
        echo.   stop()     - Stop processing the AI.
        echo.   stop(pass) - Stop processing the AI, but if the hero collided with it, let
        echo.                the hero occupy the same space as the AI.
        pause
        echo.  Conditionals
        echo.   visible - Whether or not the AI is currently visible. Control with un/hide
        echo.
        echo.   left.X, right.X - Whether or not the tile to the left or right is X.
        echo.     X can be any of the following:
        echo.      solid - If this tile is solid (solidity 1).
        echo.      gap   - If the tile below this tile is not solid (solidity 0).
        echo.      space - If this tile is solid or gap.
        echo.   above.X, below.X - Whether or not the tile above or below the AI is X.
        echo.     X can only be solid, currently, with the same meaning as above.
        echo.
        echo.   facing == Direction - Check the direction the AI is facing.
        echo.     Direction can either be left or right.
        echo.
        echo.   hero collides X - Check if the AI collided with the hero. When negating this
        echo.                     it can mean either that there was no collisions or it was
        echo.                     simply one of the other types of collisions.
        echo.     X can be any of the following:
        echo.      above - Hero landed on top of the AI, such as by jumping.
        echo.      below - AI landed on top of the hero.
        echo.      side  - Hero and AI collided horizontally.
        echo.
        echo.   last - Whether or not the previous condition was true.
        echo.===============================================================================
        pause
        exit /B

    :: ws - Scroll cursor ::
    :editAICase4
        if %EditorCursor% GTR 1 set /A EditorCursor-=1
        set /A EditorCursorRelative=EditorCursor - EditorTop
        if %EditorCursorRelative% LEQ 0 set EditorTop=%EditorCursor%
        exit /B
    :editAICase5
        if %EditorCursor% LSS 999 set /A EditorCursor+=1
        set /A EditorCursorRelative=EditorCursor - EditorTop
        if %EditorCursorRelative% GEQ 23 set /A EditorTop=%EditorCursor% - 17
        exit /B
        
    :: WS - Scroll screen but not cursor ::
    :editAICase6
        if %EditorTop% GTR 1 set /A EditorTop-=1
        exit /B
    :editAICase7
        if %EditorTop% LSS 978 set /A EditorTop+=1
        exit /B

    :: p - Enter command ::
    :editAICase8
        set /P Command=:
        for /F "tokens=1,2,3,4" %%G in ("%Command%") do (
            set cmd=%%G
            set arg1=%%~H
            set arg2=%%~I
            set arg3=%%~J
        )
        call :upper cmd
        if "%cmd:HELP=H%" == "H" goto editAICase3
        if "%cmd:QUIT=Q%" == "Q" set action=2
        if "%cmd%" == "CENTER" (
            set /A EditorTop=EditorCursor - 11
            if !EditorTop! LSS 1 set EditorTop=1
        )
        if "%cmd:TOP=A%" == "A" goto editAICase13
        if "%cmd:BOTTOM=D%" == "D" goto editAICase14
        if "%cmd%" == "HOME" goto editAICase15
        if "%cmd%" == "END" goto editAICase16
        if "%cmd:JUMP=J%" == "J" (
            set EditorCursor=%arg1%
            goto jumpToLine
        )
        if "%cmd:NEW=N%" == "N" (
            set NewLine=%arg1%
            goto insertNewLine
        )
        if "%cmd:COPY=E%" == "E" echo !EditorLine%EditorCursor%!| clip
        if "%cmd:REPLACE=R%" == "R" set EditorLine%EditorCursor%=%arg1%
        if "%cmd:IMPORT=I%" == "I" (
            set LineNumber=1
            choice /M "Are you sure you want to overwrite this"
            if ErrorLevel 1 (
                for /F "tokens=* delims=" %%i in (%arg1%) do (
                    set EditorLine!LineNumber!=%%i
                    set /a LineNumber+=1
                )
                for /L %%i in (!LineNumber!,1,%LastLine%) do set EditorLine%%i=
                set /A LastLine=LineNumber - 1
            )
            set SuccessMessage=Imported from file "%arg1%"
        )
        if "%cmd:EXPORT=X%" == "X" (
            set LineNumber=1
            choice /M "Are you sure you want to overwrite %arg1%"
            if ErrorLevel 1 (
                (echo.!EditorLine1!)>!arg1!
                for /L %%i in (2,1,%LastLine%) do (echo.!EditorLine%%i!)>>!arg1!
            )
            set SuccessMessage=Exported to file "%arg1%"
        )
        if "%cmd:DECOMPILE=V%" == "V" (
            call :decomp
            if !NumLines! == 1 (
                set EditorLine%EditorCursor%=!NewLine1!
            ) else if !NumLines! GTR 1 (
                set NewLine=!NewLine1!
                set /A NumLines-=1
                call :insertNumLines
                set /A NumLines+=1

                set /A LineNumber=EditorCursor + 1
                for /L %%i in (2,1,!NumLines!) do (
                    set EditorLine!LineNumber!=!NewLine%%i!
                    set /A LineNumber+=1
                )
                set SuccessMessage=Decompiled "%arg1%" into !NumLines! lines starting at line %EditorCursor%
            ) else (
                set SuccessMessage=Didn't decompile anything
            )
        )
        if "%cmd:DI=VI%" == "VI" (
            call :decomp
            call :insertNumLines
            set LineNumber=%EditorCursor%
            for /L %%i in (1,1,!NumLines!) do (
                set EditorLine!LineNumber!=!NewLine%%i!
                set /A LineNumber+=1
            )
            set SuccessMessage=Decompiled "%arg1%" inserting !NumLines! lines before line %EditorCursor%            
        )
        if "%cmd:DO=VO%" == "VO" (
            call :decomp
            set LineNumber=%EditorCursor%
            for /L %%i in (1,1,!NumLines!) do (
                set EditorLine!LineNumber!=!NewLine%%i!
                set /A LineNumber+=1
            )
            set SuccessMessage=Decompiled "%arg1%" overwriting !NumLines! lines starting at line %EditorCursor%            
        )
        if "%cmd:COMPILE=C%" == "C" (
            for /F "tokens=1* eol=" %%i in ('ai\compile.bat "!EditorLine%EditorCursor%!"') do (
                set SuccessMessage=Compilation: %%~j
            )
        )
        if "%cmd:DELETE=K%" == "K" (
            set NumLines=%arg1%
            goto :deleteLines
        )
        if "%cmd:TAB=T%" == "T" (
            set NumLines=%arg1%
            goto :tabLines
        )
        if "%cmd:UNTAB=<%" == "<" (
            set NumLines=%arg1%
            goto :untabLines
        )
        if "%cmd%" == "NAME" (
            set /P EditorName=New name: 
            set SuccessMessage=Changed AI name
        )
        if "%cmd%" == "SPRITE" (
            set /P EditorAvatar=New sprite: 
            set SuccessMessage=Changed initial AI sprite
        )
        if "%cmd%" == "STATE" (
            choice /C 0123456789 /N /M "New state: "
            if not ErrorLevel 1 exit /B
            set /A EditorState=ErrorLevel - 1
            set SuccessMessage=Changed initial AI state
        )
        if "%cmd%" == "VAR" (
            choice /C 0123456789 /N /M "New var: "
            if not ErrorLevel 1 exit /B
            set /A EditorState=ErrorLevel - 1
            set SuccessMessage=Changed initial AI var
        )
        if "%cmd%" == "POS" (
            set /P XY=X Y: 
            for /F "tokens=1,2" %%i in ("!XY!") do (
                set EditorX=%%i
                set EditorY=%%j
            )
            set SuccessMessage=Changed initial AI position
        )
        exit /B

    :: j - Jump to line ::
    :editAICase9
        set /P EditorCursor=Line: 
        :jumpToLine
        if %EditorCursor% LSS 1 set EditorCursor=1
        if %EditorCursor% GTR %LastLine% set EditorCursor=%LastLine%
        if %EditorCursor% LSS %EditorTop% set EditorTop=%EditorCursor%
        set /A EditorBottom=EditorTop + 22
        if %EditorCursor% GTR %EditorBottom% set /A EditorTop=EditorCursor - 17
        set SuccessMessage=
        exit /B

    :: n - insert New line ::
    :editAICase10
        set NewLine= 
        :insertNewLine
        :: Move all lines ahead ::
        set NumLines=1
        :insertNumLines
        set /A j=LastLine + NumLines
        for /L %%i in (%LastLine%,-1,%EditorCursor%) do (
            set EditorLine!j!=!EditorLine%%i!
            set /A j-=1
        )
        set /A LastLine+=NumLines
        :: Insert a blank line ::
        set EditorLine%j%=!NewLine!
        set SuccessMessage=Inserted %NumLines% new line(s) starting at %EditorCursor%.
        exit /B
    
    :: er - Edit or Replace ::
    :editAICase11
        echo !EditorLine%EditorCursor%!| clip
    :editAICase12
        set /P EditorLine%EditorCursor%=::
        set SuccessMessage=
        exit /B
    
    :: ad - view top and bottom ::
    :editAICase13
        set EditorCursor=%EditorTop%
        exit /B
    :editAICase14
        set /A EditorCursor=EditorTop + 22
        exit /B
    
    :: AD - file top and bottom ::
    :editAICase15
        set EditorTop=1
        set EditorCursor=1
        exit /B
    :editAICase16
        set /A EditorTop=LastLine - 22
        set EditorCursor=%LastLine%
        exit /B
    
    :: k - Delete this line ::
    :editAICase17
        set NumLines=1
        :deleteLines
        set j=%EditorCursor%
        set /A StartLine=EditorCursor + NumLines
        for /L %%i in (%StartLine%,1,%LastLine%) do (
            set EditorLine!j!=!EditorLine%%i!
            set /A j+=1
        )
        set /A LastLine-=NumLines
        set SuccessMessage=Deleted %NumLines% lines
        exit /B

    :: t - Tab this line in ::
    :editAICase18
        set NumLines=1
        :tabLines
        set /A EndLine=EditorCursor + NumLines - 1
        for /L %%i in (%EditorCursor%,1,%EndLine%) do (
            set EditorLine%%i=  !EditorLine%%i!
        )
        set SuccessMessage=
        exit /B

    :: T - Tab this line back ::
    :editAICase19
        set NumLines=1
        :untabLines
        set /A EndLine=EditorCursor + NumLines - 1
        for /L %%i in (%EditorCursor%,1,%EndLine%) do (
            if "!EditorLine%%i:~0,2!" == "  " set EditorLine%%i=!EditorLine%%i:~2!
        )
        set SuccessMessage=
        exit /B

    :: o - Save AI ::
    :editAICase20
        set EditorAI=
        for /L %%i in (1,1,%LastLine%) do (
            set Tmp= !EditorLine%%i!
            if not "!Tmp: =!" == "" (
                for /F "tokens=1* eol=" %%j in ('ai\compile.bat "!Tmp!" ^|^| echo error error') do (
                    if "%%j" == "error" (
                        pause
                        set SuccessMessage=Error compiling AI on line %%i
                        exit /B
                    )
                    set EditorAI=!EditorAI!%%~k
                )
            )
        )
        set %EditorI%_ai=%EditorAI%
        set SuccessMessage=Saved AI "%EditorName%"
        exit /B

    :decomp
        set NumLines=0
        for /F "tokens=* delims=" %%i in ('ai\decompile.bat "%arg1%"') do (
            set /A NumLines+=1
            set NewLine!NumLines!=%%i
        )
    exit /B
    
    :afterEditAICases
goto editAILoop
:endEditAI
exit /B

:drawHiddenPane
    set LeftOffset=0
    set  eline0=
    set  eline1=
    set  eline2=
    set  eline3=
    set  eline4=
    set  eline5=
    set  eline6=
    set  eline7=
    set  eline8=
    set  eline9=
    set eline10=
    set eline11=
    set eline12=
    set eline13=
    set eline14=
    set eline15=
    set eline16=
    set eline17=
    set eline18=
    set eline19=
    set eline20=
    set eline21=
    set eline22=
exit /B

:drawTilePane
    set LeftOffset=16
    set  eline0=╔══════════════╦
    set  eline1=║ ►Tiles◄  AI  ║
    set  eline2=║              ║
    set  eline3=║   0123456789 ║
    set  eline4=║ A ☺☻♥♦♣♠•◘○◙ ║
    set  eline5=║ B ♂♀♪♫☼►◄↕‼¶ ║
    set  eline6=║ C §▬↨↑↓→←∟↔▲ ║
    set  eline7=║ D ▼⌂Çüéâäàåç ║
    set  eline8=║ E êëèïîìÄÅÉæ ║
    set  eline9=║ F ÆôöòûùÿÖÜ¢ ║
    set eline10=║ G £¥₧ƒáíóúñÑ ║
    set eline11=║ H ªº¿⌐¬½¼¡«» ║
    set eline12=║ I ░▒▓│┤╡╢╖╕╣ ║
    set eline13=║ J ║╗╝╜╛┐└┴┬├ ║
    set eline14=║ K ─┼╞╟╚╔╩╦╠═ ║
    set eline15=║ L ╬╧╨╤╥╙╘╒╓╫ ║
    set eline16=║ M ╪┘┌█▄▌▐▀αß ║
    set eline17=║ N ΓπΣσµτΦΘΩδ ║
    set eline18=║ O ∞φε∩≡±≥≤⌠⌡ ║
    set eline19=║ P ÷≈°∙·√ⁿ²■  ║
    set eline20=║  Use zA0 to  ║
    set eline21=║  select ☺    ║
    set eline22=╚══════════════╩
exit /B

:drawCollPane
    set LeftOffset=16
    set  eline0=╔══════════════╦
    set  eline1=║ ►Tiles◄  AI  ║
    set  eline2=║              ║
    set  eline3=║   0123456789 ║
    set  eline4=║ A 0022220101 ║
    set  eline5=║ B 2222022221 ║
    set  eline6=║ C 1122222022 ║
    set  eline7=║ D 2022222222 ║
    set  eline8=║ E 2222222222 ║
    set  eline9=║ F 2222222222 ║
    set eline10=║ G 2222222222 ║
    set eline11=║ H 3301111022 ║
    set eline12=║ I 1111111111 ║
    set eline13=║ J 1111111111 ║
    set eline14=║ K 1111111111 ║
    set eline15=║ L 1111111111 ║
    set eline16=║ M 1111111122 ║
    set eline17=║ N 2222222222 ║
    set eline18=║ O 2222333311 ║
    set eline19=║ P 333221331  ║
    set eline20=║  Use zA0 to  ║
    set eline21=║  select ☺    ║
    set eline22=╚══════════════╩
exit /B

:drawAIPane
    set LeftOffset=16
    set  eline0=╔══════════════╦
    set  eline1=║  Tiles  ►AI◄ ║
    set  eline2=║              ║
    set sline=2
    set /A senemies=19 + %AITabStart%
    if %enemys% LSS %senemies% set senemies=%enemys%
    for /L %%i in (%AITabStart%,1,%senemies%) do (
        set /A sline+=1
        set eline!sline!=║ !enemy%%i_name:~0,12!            
    )
    for /L %%i in (3,1,%sline%) do (
        set eline%%i=!eline%%i:~0,14! ║
    )
    set /A sline+=1
    for /L %%i in (%sline%,1,21) do set eline%%i=║              ║
    set eline22=╚══════════════╩
exit /B

:drawLevel
    :: Draw left pane ::
    call :draw%pane%Pane

    if "%pane%" == "Coll" (
        set sourceVar=coll
    ) else (
        set sourceVar=line
    )

    :: Draw level ::
	set /A ScreenBottom=%ScreenTop% + 22
	set ZeroBased=0
	for /L %%i in (%ScreenTop%,1,%ScreenBottom%) do (
		set tline!ZeroBased!=!%sourceVar%%%i:~%ScreenLeft%,79!
		set /A ZeroBased+=1
	)

    for /L %%i in (0,1,22) do (
        set eline%%i=!eline%%i!!tline%%i!
        set eline%%i=!eline%%i:~0,79!
    )
    
    if "%DrawAI%" == "0" goto :finishDrawLevel

    :: Add in characters ::
	call :draw "☺" %CharX% %CharY% abs

	for /L %%i in (1,1,%enemys%) do (
        call :draw "!enemy%%i_avatar!" !enemy%%i_x! !enemy%%i_y! abs
    )

    :finishDrawLevel
    cls
	call :draw "%Cursor%" %CursorX% %CursorY% rel
    for /L %%i in (0,1,22) do @echo.!eline%%i!
exit /B

:draw
:: draw char x y abs/rel
	:: Calc screen position ::
    if "%3" == "abs" (
        set /A TmpX=%2 - ScreenLeft
        set /A TmpY=%3 - ScreenTop
    ) else (
        set TmpX=%2
        set TmpY=%3
    )

    :: Adjust for left pane ::
    set /A TmpX=TmpX + LeftOffset

	:: Check if it's within bounds ::
	if %TmpX% LSS %LeftOffset% exit /B
	if %TmpX% GTR 79 exit /B
	if %TmpY% LSS 0 exit /B
	if %TmpY% GTR 22 exit /B

	:: Draw ::
	set /A TmpX1=TmpX + 1
	set eline%TmpY%=!eline%TmpY%:~0,%TmpX%!%~1!eline%TmpY%:~%TmpX1%!
exit /B

:drawAI
    set /A EditorBottom=EditorTop + 22
    if %EditorBottom% GEQ 100 (set Pad=pad3
    ) else set Pad=pad2

    call :drawAIInfo
    set OneBased=1
    for /L %%i in (%EditorTop%,1,%EditorBottom%) do (
        :: Pad the number appropriately ::
        call :%Pad% LineNumber %%i

        :: If the cursor is on this line, display it ::
        if "%%i" == "%EditorCursor%" (set Cursor=»
        ) else set Cursor= 

        :: If this line isn't defined we should set a blank one ::
        if %%i GEQ %LastLine% (
            set EditorLine%%i= 
            set /A LastLine+=1
        )

        set tline!OneBased!=!Cursor!!LineNumber!│ !EditorLine%%i!
        set /A OneBased+=1
    )

    :: Draw the lines ::
    cls
    for /L %%i in (1,1,23) do @echo.!eline%%i!!tline%%i!
exit /B

:drawAIInfo
    set  eline1=AI name:       ║
    set  eline2= %EditorName:~0,14%              
    set  eline2=%eline2:~0,15%║
    set  eline3= %EditorName:~14,14%              
    set  eline3=%eline3:~0,15%║
    set  eline4=Initial...     ║
    set  eline5= Sprite: %EditorAvatar%     ║
    set  eline6= State:  %EditorState%     ║
    :: TODO: If initial variable width is increased this needs to use pad2
    set  eline7= Var:    %EditorVar%     ║
    set  eline8= Pos: [%EditorX%,%EditorY%]              
    set  eline8=%eline8:~0,15%║
    set  eline9=               ║
    set eline10=               ║
    set eline11= Commands:     ║
    set eline12=  0123456789D  ║
    set eline13=  BFKWHUC@#,.  ║
    set eline14=               ║
    set eline15= Conditionals: ║
    set eline16=  clrdughLRxX  ║
    set eline17=  _{} tf; OA   ║
    set eline18=               ║
    set eline19= Variable:     ║
    set eline20=  s v + -      ║
    set eline21=               ║
    set eline22= Press h       ║
    set eline23=      for help ║
exit /B

:moveCursor
:: moveCursor X-offset Y-offset
    set /A CursorX=CursorX + %1
    set /A CursorY=CursorY + %2
    set /A RightBound=79 - LeftOffset

    if %CursorX% LSS 0 set CursorX=0
	if %CursorX% GTR %RightBound% set CursorX=%RightBound%
	if %CursorY% LSS 0 set CursorY=0
	if %CursorY% GTR 22 set CursorY=22
exit /B

:setCursor
:: moveCursorAbs X Y
    :: Move the screen so the new position is showing and the cursor is in the same spot.
    set /A ScreenLeft=%~1 - CursorX
    set /A ScreenTop=%~2 - CursorY

    :: Keep screen in bounds ::
    set /A MaxScreenLeft=width - 79 + LeftOffset
    set /A MaxScreenTop=height - 22

    if %ScreenLeft% GTR %MaxScreenLeft% set ScreenLeft=%MaxScreenLeft%
    if %ScreenLeft% LSS 0 set ScreenLeft=0
    if %ScreenTop% GTR %MaxScreenTop% set ScreenTop=%MaxScreenTop%
    if %ScreenTop% LSS 0 set ScreenTop=0

    :: If the screen was out of bounds, update the cursor ::
    set /A TmpX=ScreenLeft + CursorX
    set /A TmpY=ScreenTop + CursorY

    if %TmpX% NEQ %~1 set CursorX=%~1 - ScreenLeft
    if %TmpY% NEQ %~2 set CursorY=%~2 - ScreenTop

    set /A TmpX=ScreenLeft + CursorX
    set /A TmpY=ScreenTop + CursorY
    set SuccessMessage=Moved cursor to [%TmpX%,%TmpY%]
exit /B

:getCursor
    set /A TmpX=ScreenLeft + CursorX
    set /A TmpY=ScreenTop + CursorY
    set /A TmpX1=TmpX + 1
exit /B

:writeTile
:: writeTile x y
    set /A TmpX1=%~1 + 1
    if not "%CurrentTile%" == "" set line%~2=!line%~2:~0,%~1!%CurrentTile%!line%~2:~%TmpX1%!
    if not "%CurrentColl%" == "" set coll%~2=!coll%~2:~0,%~1!%CurrentColl%!coll%~2:~%TmpX1%!
exit /B

:writeCursor
    call :getCursor
    call :writeTile %TmpX% %TmpY%
    set SuccessMessage=Wrote %CurrentTile%%CurrentColl% to [%TmpX%,%TmpY%]
exit /B

:writeLine
::writeLine Direction Length
:: Draw a line of tiles in the given direction of the given length
    set Tmp=%~1
    call :getCursor
    if "%Tmp:r=R%" == "R" (
        set /A TmpXR=TmpX + %~2
        set LineTo=[!TmpXR!,%TmpY%]
        for /L %%i in (%TmpX%,1,!TmpXR!) do call :writeTile %%i %TmpY%
    ) else if "%Tmp:l=L%" == "L" (
        set /A TmpXR=TmpX - %~2
        set LineTo=[!TmpXR!,%TmpY%]
        for /L %%i in (%TmpX%,-1,!TmpXR!) do call :writeTile %%i %TmpY%
    ) else if "%Tmp:u=U%" == "U" (
        set /A TmpXR=TmpY - %~2
        set LineTo=[%TmpX%,!TmpXR!]
        for /L %%i in (%TmpY%,-1,!TmpXR!) do call :writeTile %TmpX% %%i
    ) else if "%Tmp:d=D%" == "D" (
        set /A TmpXR=TmpY + %~2
        set LineTo=[%TmpX%,!TmpXR!]
        for /L %%i in (%TmpY%,1,!TmpXR!) do call :writeTile %TmpX% %%i
    )
    set SuccessMessage=Wrote %CurrentTile%%CurrentColl% from [%TmpX%,%TmpY%] to %LineTo%
exit /B

:collCursor
::collCursor CollisionMode 
    call :getCursor
    set coll%TmpY%=!coll%TmpY%:~0,%TmpX%!%~1!coll%TmpY%:~%TmpX1%!
    set SuccessMessage=Change collision of [%TmpX%,%TmpY%] to %~1
exit /B

:aiAtCursor
::aiAtCursor "Name" [State] [Value]
    call :getCursor
    call :getVariableOf %1

    if not ErrorLevel 1 (
        set SuccessMessage=An AI with that name already exists
        exit /B 1
    )
    
    :: Add a new entry then ::
    set /A enemys+=1
    set /A enemy%enemys%_name=%~1

    set enemy%enemys%_name=%~1
    set enemy%enemys%_avatar=@
    set enemy%enemys%_x=%TmpX%
    set enemy%enemys%_y=%TmpY%
    set enemy%enemys%_state=%~2
    set enemy%enemys%_var=%~3
    set enemy%enemys%_ai=

    set SuccessMessage=Created new AI "%~1" at [%TmpX%,%TmpY%]
exit /B

:copyAI2Cursor
::copyAI2Cursor "FromName" "ToName"
    call :getVariableOf %1
    if not ErrorLevel 0 (
        set SuccessMessage=No AI named "%~1"
        exit /B 1
    )

    set from=%enemy%
    call :aiAtCursor %2 !%from%_state! !%from%_var!
    set %enemy%_avatar=!%from%_avatar!
    set %enemy%_ai=!%from%_ai!
exit /B 0

:openAI
::openAI "Name"
    call :getVariableOf %1
    if not ErrorLevel 0 (
        set SuccessMessage=No AI named "%~1"
        exit /B 1
    )

    call :editAI %enemy%
exit /B 0

:getVariableOf
::getVariableOf "Name" [new] -> enemy
    set enemy=
    for /L %%i in (1,1,%enemys%) do (
        if "!enemy%%i_name!" == "%~1" (
            set enemy=enemy%%i
            exit /B 0
        )
    )
exit /B 1

:parseAI
    set %1_avatar=!%1:~0,1!
    :: Octal avoidance ::
    set /A %1_x=1!%1:~1,3! - 1000
    set /A %1_y=1!%1:~4,2! - 100
    set %1_state=!%1:~6,1!
    set %1_var=!%1:~7,1!
    set %1_ai=!%1:~8!
exit /B

:batname
::batname Variable Filename
    set Tmp=%~2
    set %1="%Tmp:.bat=%.bat"
exit /B

:save
    :: Ensure there is a project filename ::
    if not "%1" == "" set ProjectFileName=%~1
    if "%ProjectFileName%" == "" set /P ProjectFileName=Enter a filename to save to: 
    if "%ProjectFileName%" == "" goto save
    call :batname ProjectFileName "%ProjectFileName%"

    :: Editor settings ::
    (echo set pane=%pane%)>%ProjectFileName%
	(echo set ScreenLeft=%ScreenLeft%)>>%ProjectFileName%
	(echo set ScreenTop=%ScreenTop%)>>%ProjectFileName%

    :: Level data ::
	(echo set LevelName=%LevelName%)>>%ProjectFileName%
	(echo set Authors=%Authors%)>>%ProjectFileName%
	(echo set NextLevel=%NextLevel%)>>%ProjectFileName%
	(echo set width=%width%)>>%ProjectFileName%
	(echo set height=%height%)>>%ProjectFileName%
	(echo set color=%color%)>>%ProjectFileName%
	(echo set CharX=%CharX%)>>%ProjectFileName%
	(echo set CharY=%CharY%)>>%ProjectFileName%
	(echo set enemys=%enemys%)>>%ProjectFileName%
	for /L %%i in (1,1,%enemys%) do (
		(echo set enemy%%i_name=!%%i_name!)>>%ProjectFileName%
		(echo set enemy%%i_avatar=!%%i_avatar!)>>%ProjectFileName%
		(echo set enemy%%i_x=!%%i_x!)>>%ProjectFileName%
		(echo set enemy%%i_y=!%%i_y!)>>%ProjectFileName%
		(echo set enemy%%i_state=!%%i_state!)>>%ProjectFileName%
		(echo set enemy%%i_var=!%%i_var!)>>%ProjectFileName%
		(echo set enemy%%i_ai=!%%i_ai!)>>%ProjectFileName%
	)
    set /A hm1=height - 1
    for /L %%i in (0,1,%hm1%) do (
        (echo set line%%i=!line%%i!)>>%ProjectFileName%
    )
    for /L %%i in (0,1,%hm1%) do (
        (echo set coll%%i=!coll%%i!)>>%ProjectFileName%
    )

    set SuccessMessage=Saved project to "%ProjectFileName%"
exit /B

:export
:: This is different in that it compiles the AI information and creates the conditional.
    :: Ensure there is an export filename ::
    if not "%1" == "" set ExportFileName=%~1
    if "%ExportFileName%" == "" set /P ExportFileName=Enter a filename to export to: 
    if "%ExportFileName%" == "" goto export
    call :batname ExportFileName "%ExportFileName%"

    :: Compile enemies ::
    for /L %%i in (1,1,%enemys%) do (
        call :pad3 TmpX !enemy%%i_x!
        call :pad2 TmpY !enemy%%i_y!
        set enemy!enemys!=!enemy%%i_avatar!!TmpX!!TmpY!!enemy%%i_state!!enemy%%i_var!!enemy%%i_ai!
    )

    :: Export data ::
 	(echo set LevelName=%LevelName%)>%ExportFileName%
	(echo set Authors=%Authors%)>>%ExportFileName%
	(echo set NextLevel=%NextLevel%)>>%ExportFileName%
	(echo set width=%width%)>>%ExportFileName%
	(echo set height=%height%)>>%ExportFileName%
	(echo set color=%color%)>>%ExportFileName%
    (echo if not "%%1" == "load" ^()>>%ExportFileName%
	(echo     set CharX=%CharX%)>>%ExportFileName%
	(echo     set CharY=%CharY%)>>%ExportFileName%
	(echo     set enemys=%enemys%)>>%ExportFileName%
	for /L %%i in (1,1,%enemys%) do (
		(echo     set enemy%%i=!enemy%%i!)>>%ExportFileName%
	)
    (echo.^))>>%FileName%
    set /A hm1=height - 1
    for /L %%i in (0,1,%hm1%) do (
        (echo set line%%i=!line%%i!)>>%ExportFileName%
    )
    for /L %%i in (0,1,%hm1%) do (
        (echo set coll%%i=!coll%%i!)>>%ExportFileName%
    )

    set SuccessMessage=Exported level to "%ExportFileName%"
exit /B

:upper
:: upper Variable
:: Uppercase a string
    set %1=!%1:a=A!
    set %1=!%1:b=B!
    set %1=!%1:c=C!
    set %1=!%1:d=D!
    set %1=!%1:e=E!
    set %1=!%1:f=F!
    set %1=!%1:g=G!
    set %1=!%1:h=H!
    set %1=!%1:i=I!
    set %1=!%1:j=J!
    set %1=!%1:k=K!
    set %1=!%1:l=L!
    set %1=!%1:m=M!
    set %1=!%1:n=N!
    set %1=!%1:o=O!
    set %1=!%1:p=P!
    set %1=!%1:q=Q!
    set %1=!%1:r=R!
    set %1=!%1:s=S!
    set %1=!%1:t=T!
    set %1=!%1:u=U!
    set %1=!%1:v=V!
    set %1=!%1:w=W!
    set %1=!%1:x=X!
    set %1=!%1:y=Y!
    set %1=!%1:z=Z!
exit /B

:toggle
:: toggle ToToggle [ToSet TrueValue FalseValue]
:: Toggle given variable
    if "!%~1!" == "0" (
        set %~1=1
        if not "%2" == "" set %2=%3
    ) else (
        set %~1=0
        if not "%2" == "" set %2=%4
    )
exit /B

:pad2
::pad2 Variable Number
    if %2 LSS 10 (
        set %1=0%2
    ) else set %1=%2
exit /B

:pad3
::pad3 Variable Number
    if %2 LSS 10 (
        set %1=00%2
    ) else if %2 LSS 100 (
        set %1=0%2
    ) else set %1=%2
exit /B

:confirmQuit
	:: Called function ::
    for /F "tokens=1,2" %%i in ("%Labels%") do (
        set YesLabel=%%i
        set NoLabel=%%j
    )
	choice /N /M "Are you sure you want to quit (Y/N)? "
	if "%ErrorLevel%" == "1" goto %YesLabel%
    goto %NoLabel%

:quit
