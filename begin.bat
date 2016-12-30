@echo off
:: CRAZY HAPPY JOY TIME ::
:: Platform game in BATCH by Sapphire Becker (logicplace.com) ::
:: Because I can ::
setlocal EnableDelayedExpansion
chcp 65001 >nul

:::: Set up window ::::
set title=CRAZY HAPPY JOY TIME

:::: Declare defaults ::::
set Keys=nwasdqop
:: Level stuff ::
set PrevLevels=
set CurrentLevel=
set ScreenLeft=0
set ScreenTop=0
set KillPlayer=0
:: Movementated ::
(set Jumping=0) &&rem "0: Not jumping; 1: Fall through; 2: Falling; 3+ Jumping states"
(set JumpMax=4) &&rem "Note that 4 is only two spaces high [3 and 4]"
(set WantHorz=0) &&rem "0: Neither; 1: Left; 2: Right"

:title
:: Display title screen, allowing users to select what to do ::
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
echo ║                                                        1) Start New Game    ║
echo ║                                                                             ║
if exist "save.bat" (
echo ║                                                        2^) Continue          ║
) else (
echo ║                                                                             ║
)
echo ║                                                                             ║
echo ║                                                        3) Level Editor      ║
echo ║                                                                             ║
echo ║                                                        4) Quit              ║
echo ║                                                                             ║
echo ║                                                                             ║
echo ╚═════════════════════════════════════════════════════════════════════════════╝
choice /C 1234 /N
set in=%ErrorLevel%
if "%in%" == "1" goto startNew
if "%in%" == "2" goto continueGame
if "%in%" == "3" goto levelEditor
if "%in%" == "4" goto quit

:startNew
:: First select your character ::
cls
echo CHOOSE A CHARACTER
echo.
echo 1) ☺     2) ☻
echo 3) ¡     4) ⌂
choice /C 1234 /N /M ? 
set Avatar=%ErrorLevel%
if "%Avatar%" == "1" set Avatar=☺
if "%Avatar%" == "2" set Avatar=☻
if "%Avatar%" == "3" set Avatar=¡
if "%Avatar%" == "4" set Avatar=⌂
:: Now we load level 0 ::
call :loadLevel level0
goto start

:continueGame
cls
if exist "save.bat" (
	call "save.bat"
	call :loadLevel !CurrentLevel! load
	goto mainLoop
) else (
	echo Save file does not exist.
	pause
	goto title
)

:levelEditor
cls
call editor.bat 1
goto title

:start
:: TODO: Intro ::
goto mainLoop

::::::::: Game functions :::::::::
:mainLoop
:: Game's main loop. Basically display, grab input, update AI ::
	call :display
	
	:: Grab input and handle it ::
	set WantHorz=0
	choice /C %Keys% /N /D n /T 1 >nul
	set action=%ErrorLevel%
	if "%action%" == "2" call :playerJump
	if "%action%" == "3" set WantHorz=1
	if "%action%" == "4" call :playerDown
	if "%action%" == "5" set WantHorz=2
	if "%action%" == "6" goto :confirmQuit
	if "%action%" == "7" call :save
	if "%action%" == "8" pause
	
	call :step
	:: Reload if player has died ::
	if "%KillPlayer%" == "1" call :loadLevel "%CurrentLevel%"
	if "%WinLevel%" == "1" (
		set PrevLevels=%PrevLevels% "%CurrentLevel%"
		call :loadLevel "%NextLevel%"
		if "!ErrorLevel!" == "0" goto winGame
	)
goto mainLoop

:winGame
	title %title% - You win^!
	color 07
	::::Measure::::  4321zyxwvutsrqponmlkjihgfedcba9876543210123456789abcdefghijklmnopqrstuvwxyz1234|
	set time=300
	cls
	for /L %%i in (0,1,24) do echo.
	call :slowFlood "                   You beat the last level‼ Congratulations‼" %time%
	for /L %%i in (0,1,2) do call :slowFlood "" %time%
	call :slowFlood "              Game programming by Sapphire Becker (logicplace.com)" %time%
	call :slowFlood "" %time%
	call :slowFlood " Level name                            Designers"
	for %%i in (%PrevLevels%) do (
		call :loadLevel %%i win
		(set LevelName=%LevelName%                                     )
		(set Authors=%Authors%                                        )
		call :slowFlood " !LevelName:~0,37! !Authors:~0,40!" %time%
	)
	for /L %%i in (0,1,10) do call :slowFlood "" %time%
	call :slowFlood "                             Thank you for playing‼" %time%
	call :slowFlood "                Make your own levels and share them with friends." %time%
	for /L %%i in (0,1,10) do call :slowFlood "" %time%
	pause
goto title

:display
	:: Draw the base ::
	set /A ScreenBottom=%ScreenTop% + 23
	set ZeroBased=0
	for /L %%i in (%ScreenTop%,1,%ScreenBottom%) do (
		set eline!ZeroBased!=!line%%i:~%ScreenLeft%,79!
		set /A ZeroBased+=1
	)

	:: Draw character to the screen ::
	call :draw "%Avatar%" %CharX% %CharY% col

	:: Draw enemies to the screen ::
	for /L %%i in (1,1,%enemys%) do (
		:: Only draw if not hidden ::
		if not "!enemy%%i_state:3=2!" == "2" (
			if "!enemy%%i_state!" == "8" (
				:: Exploding ::
				call :draw "☼" !enemy%%i_x! !enemy%%i_y! col
			) else if "!enemy%%i_state!" == "9" (
				:: Squished ::
				call :draw "▬" !enemy%%i_x! !enemy%%i_y! col
			) else if not "!enemy%%i_state!" == "D" (
				:: Regular ::
				call :draw "!enemy%%i_avatar!" !enemy%%i_x! !enemy%%i_y! col
			)
		)
	)

	:: Print the screen ::
	cls
	for /L %%i in (0,1,23) do echo.!eline%%i!
exit /B

:draw
:: draw char x y top/col
:: Draw character to the screen at (x,y) concering collisions (above-hero) if desired ::
	call :collision %2 %3

	:: Do not draw if it's on an above-hero tile and mode is col ::
	if "%ErrorLevel%,%4" == "2,col" exit /B

	:: Calc screen position ::
	set /A TmpX=%2 - ScreenLeft
	set /A TmpY=%3 - ScreenTop

	:: Check if it's within bounds ::
	if %TmpX% LSS 0 exit /B
	if %TmpX% GTR 79 exit /B
	if %TmpY% LSS 0 exit /B
	if %TmpY% GTR 23 exit /B

	:: Draw ::
	set /A TmpX1=TmpX + 1
	set eline%TmpY%=!eline%TmpY%:~0,%TmpX%!%~1!eline%TmpY%:~%TmpX1%!
exit /B

:step
	:: Move character ::
	if /I %Jumping% GEQ 3 goto step_jumping
	goto step_jumpState%Jumping%
	:step_jumpState0
		:: Not jumping ::
		set CheckY=%CharY%
		goto step_move
	
	:step_jumpState1
		:: Fall-through, check below if not solid ::
		set /A TmpY=CharY + 1
		call :collision %CharX% %TmpY%
		if "%ErrorLevel%" == "0" (
			set CheckY=%CharY%
			set Jumping=0
		) else (
			set CheckY=%TmpY%
			set Jumping=2
		)
		goto step_move

	:step_jumpState2
		:: Falling, check below if empty or above hero ::
		set /A TmpY=CharY + 1
		call :collision %CharX% %TmpY%
		if "%ErrorLevel:2=0%" == "0" (
			set CheckY=%TmpY%
		) else (
			set CheckY=%CharY%
			set Jumping=0
		)
		goto step_move

	:step_jumping
		set /A CheckY=CharY - 1
	
	:step_move
	set CheckX=%CharX%
	if "%WantHorz%" == "1" set /A CheckX=CharX - 1
	if "%WantHorz%" == "2" set /A CheckX=CharX + 1

	:: First check if the target position is solid ::
	call :collision %CheckX% %CheckY%
	if not "%ErrorLevel%" == "1" goto step_moveOkay
	:: If not, let's check the horizontal position only ::
	call :collision %CheckX% %CharY%
	if not "%ErrorLevel%" == "1" (
		set CheckY=%CharY%
		goto step_moveOkay
	)
	:: If nothing else, let's check just the vertical position ::
	call :collision %CharX% %CheckY%
	if not "%ErrorLevel%" == "1" (
		set CheckX=%CharX%
		goto step_moveOkay
	)
	:: No where to move, then ::
	goto step_ai
	
	:step_moveOkay
	:: Now we check if there's an enemy in that position ::
	set CollidesWith=
	for /L %%i in (1,1,%enemys%) do (
		if "!enemy%%i_x!,!enemy%%i_y!" == "%CheckX%,%CheckY%" set CollidesWith=%%i
	)
	if not "%CollidesWith%" == "" goto step_ai

	:: No enemy collisions, so handle default checks ::
	set CharX=%CheckX%
	set CharY=%CheckY%
	if /I %Jumping% GEQ %JumpMax% set Jumping=2
	if /I %Jumping% GEQ 3 set /A Jumping+=1

	:: Check if char needs to die or fall ::
	if not "%Jumping%" == "0" goto step_ai
	set /A TmpY=CharY + 1
	if "%TmpY%" == "%height%" (
		set KillPlayer=1
		exit /B
	)
	call :collision %CharX% %TmpY%
	if "%ErrorLevel:2=0%" == "0" set Jumping=2
	
	:step_ai
	set RemoveEnemies=
	for /L %%i in (1,1,%enemys%) do (
		if "!enemy%%i_state:8=9!" == "9" (
			set RemoveEnemies=%RemoveEnemies% %%i
		) else if "!enemy%%i_state!" == "D" (
			set RemoveEnemies=%RemoveEnemies% %%i
		) else call :runAI %%i
	)
	
	:: Remove enemies that need to be removed ::
	:: TODO: This could probably be more efficient ::
	for %%i in (%RemoveEnemies%) do (
		set /A TmpI=%%i + 1
		for /L %%j in (!TmpI!,1,!enemys!) do (
			set /A TmpIdx=%%j - 1
			set enemy!TmpIdx!_avatar=!enemy%%j_avatar!
			set enemy!TmpIdx!_x=!enemy%%j_x!
			set enemy!TmpIdx!_y=!enemy%%j_y!
			set enemy!TmpIdx!_state=!enemy%%j_state!
			set enemy!TmpIdx!_var=!enemy%%j_var!
			set enemy!TmpIdx!_ai=!enemy%%j_ai!
		)
		set /A enemys-=1
	)
	
	:update_screen
	:: Update horizontal portion of viewport ::
	set /A HorzDiff=CharX - ScreenLeft
	if /I %HorzDiff% LSS 20 (
		set /A ScreenLeft-=20 - HorzDiff
		if /I !ScreenLeft! LSS 0 set ScreenLeft=0
	) else if /I %HorzDiff% GTR 60 (
		set /A ScreenLeft+=HorzDiff - 60
		set /A ScreenRight=ScreenLeft + 79
		if /I !ScreenRight! GEQ %width% set /A ScreenLeft=width - 79
	)

	:: Update vertical position of viewport ::
	set /A VertDiff=CharY - ScreenTop
	if /I %VertDiff% LSS 8 (
		set /A ScreenTop-=8 - VertDiff
		if /I !ScreenTop! LSS 0 set ScreenTop=0
	) else if /I %VertDiff% GTR 16 (
		set /A ScreenTop+=VertDiff - 16
		set /A ScreenBottom=ScreenTop + 24
		if /I !ScreenBottom! GEQ %height% set /A ScreenTop=height - 24
	)
exit /B

:collision
:: collision X Y
:: Returns solidity state of tile
setlocal
	:: The edges are always solid ::
	set TmpX=%~1
	set TmpY=%~2
	if /I %TmpX% LSS 0 exit /B 1
	if /I %TmpY% LSS 0 exit /B 1
	if /I %TmpX% GEQ %width% exit /B 1
	if /I %TmpY% GEQ %height% exit /B 1
endlocal
exit /B !coll%2:~%1,1!

:playerJump
	if "%Jumping%" == "0" (
		set Jumping=3
	) else (
		:: There's a bit of lag after you land, so this is a hack around it.. ::
		set /A TmpY=CharY + 1
		call :collision %CharX% !TmpY!
		if "%Jumping%,!ErrorLevel!" == "1,1" set Jumping=3
		if "%Jumping%,!ErrorLevel:3=1!" == "2,1" set Jumping=3
	)
exit /B

:playerDown
	:: Allow for both falling and non-jumping states, so one can fall-through without lag ::
	if "%Jumping:2=0%" == "0" set Jumping=1
exit /B

:runAI
:: runAI index
	set DoExec=1
	set Depth=0
	set PrevCond=0
	set LastCond=0
	set Bool=
	set NextBool=
	set /A ScreenRight=ScreenLeft + 79
	set /A ScreenBottom=ScreenTop + 24
	for %%i in (!enemy%1_ai!) do (
		:: Handled conditional bits ::
		rem echo %1^) %%i ^(exe:!DoExec! d:!Depth! lc:!LastCond! v:!enemy%1_var! s:!enemy%1_state!^)
		if "!DoExec!" == "0" (
			if "%%~i" == "t" set /A Depth+=1
			if "%%~i" == "f" set /A Depth+=1
			if "%%~i" == ";" (
				if "!Depth!" == "0" (
					set DoExec=1
				) else set /A Depth-=1
			)
		)

		:: The following for is just for tokenizing ::
		if "!DoExec!" == "1" for /F "tokens=1*" %%G in (%%i) do (
			set com=%%G
			set Bool=!NextBool!
			set PrevCond=!LastCond!
			:: Command that branch off to other commands ::
			if "!com!" == "1" (
				:: Move in current direction ::
				if "!enemy%1_state:2=0!" == "0" (
					set com=2
				) else if "!enemy%1_state:3=1!" == "1" set com=3
			) else if "!com!" == "4" (
				:: Move toward hero (horizontally) ::
				if !enemy%1_x! LSS %CharX% (
					set com=3
				) else if !enemy%1_x! GTR %CharX% set com=2
			) else if "!com!" == "5" (
				:: Move away from hero (horizontally) ::
				if !enemy%1_x! LSS %CharX% (
					set com=2
				) else if !enemy%1_x! GTR %CharX% set com=3
			)

			rem if not "%%G" == "!com!" echo Adjusted com: !com!
			:: Commands that don't change com ::
			if "!com!" == "2" (
				:: Move left ::
				set /A enemy%1_x-=1
				if "!enemy%1_state:3=1!" == "1" set /A enemy%1_state-=1
			) else if "!com!" == "3" (
				:: Move right ::
				set /A enemy%1_x+=1
				if "!enemy%1_state:2=0!" == "0" set /A enemy%1_state+=1
			) else if "!com!" == "6" (
				:: Move up ::
				set /A enemy%1_y-=1
			) else if "!com!" == "7" (
				:: Move down ::
				set /A enemy%1_y+=1
			) else if "!com!" == "8" (
				:: Explode ::
				set enemy%1_state=8
				exit /B
			) else if "!com!" == "9" (
				:: Squish ::
				set enemy%1_state=9
				exit /B
			) else if "!com!" == "D" (
				:: Die ::
				set enemy%1_state=D
				exit /B
			) else if "!com!" == "B" (
				:: Bound player ::
				set Jumping=3
			) else if "!com!" == "F" (
				:: Make player fall-through ::
				set Jumping=1
			) else if "!com!" == "K" (
				:: Kill player ::
				set KillPlayer=1
			) else if "!com!" == "W" (
				:: Win level ::
				set WinLevel=1
			) else if "!com!" == "H" (
				:: Hide self ::
				if "!enemy%1_state:1=0!" == "0" set /A enemy%1_state+=2
			) else if "!com!" == "U" (
				:: Unhide self ::
				if "!enemy%1_state:3=2!" == "2" set /A enemy%1_state-=2
			) else if "!com!" == "C" (
				:: Change sprite ::
				set enemy%1_avatar=%%H
			) else if "!com!" == "@" (
				:: Face left ::
				if "!enemy%1_state:3=1!" == "1" set /A enemy%1_state-=1
			) else if "!com!" == "#" (
				:: Face right ::
				if "!enemy%1_state:2=0!" == "0" set /A enemy%1_state+=1
			) else if "!com!" == "c" (
				:: Is in viewport ::
				if /I !enemy%1_x! GEQ %ScreenLeft% (
				if /I !enemy%1_y! GEQ %ScreenTop% (
				if /I !enemy%1_x! LSS %ScreenRight% (
				if /I !enemy%1_y! LSS %ScreenBottom% (
					set LastCond=1
				)))) else set LastCond=0
			) else if "!com!" == "l" (
				:: Is left space solid ::
				set /A TmpX=enemy%1_x - 1
				call :collision !TmpX! !enemy%1_y!
				call :bool "!ErrorLevel!" -- "1" LastCond
			) else if "!com!" == "r" (
				:: Is right space solid ::
				set /A TmpX=enemy%1_x + 1
				call :collision !TmpX! !enemy%1_y!
				call :bool "!ErrorLevel!" -- "1" LastCond
			) else if "!com!" == "d" (
				:: Is space below solid ::
				set /A TmpY=enemy%1_y + 1
				call :collision !enemy%1_x! !TmpY!
				call :bool "!ErrorLevel:3=1!" -- "1" LastCond
			) else if "!com!" == "u" (
				:: Is space above solid ::
				set /A TmpY=enemy%1_y - 1
				call :collision !enemy%1_x! !TmpY!
				call :bool "!ErrorLevel!" -- "1" LastCond
			) else if "!com!" == "g" (
				:: Is there a gap to the left ::
				set /A TmpX=enemy%1_x - 1
				set /A TmpY=enemy%1_y + 1
				call :collision !TmpX! !TmpY!
				call :bool "!ErrorLevel:2=0!" -- "0" LastCond
			) else if "!com!" == "h" (
				:: Is there a gap to the right ::
				set /A TmpX=enemy%1_x + 1
				set /A TmpY=enemy%1_y + 1
				call :collision !TmpX! !TmpY!
				call :bool "!ErrorLevel:2=0!" -- "0" LastCond
			) else if "!com!" == "L" (
				:: Is the left space solid or a gap ::
				set /A TmpX=enemy%1_x - 1
				call :collision !TmpX! !enemy%1_y!
				call :bool "!ErrorLevel!" == "1" LastCond
				if "!LastCond!" == "0" (
					set /A TmpY=enemy%1_y + 1
					call :collision !TmpX! !TmpY!
					call :bool "!ErrorLevel:2=0!" -- "0" LastCond
				)
			) else if "!com!" == "R" (
				:: Is the right space solid or a gap ::
				set /A TmpX=enemy%1_x + 1
				call :collision !TmpX! !enemy%1_y!
				call :bool "!ErrorLevel!" == "1" LastCond
				if "!LastCond!" == "0" (
					set /A TmpY=enemy%1_y + 1
					call :collision !TmpX! !TmpY!
					call :bool "!ErrorLevel:2=0!" -- "0" LastCond
				)
			) else if "!com!" == "x" (
				:: If player jumped on ::
				if "%CollidesWith%" == "%1" (
					call :bool %CharY% LSS !enemy%1_y! LastCond
				) else set LastCond=0
			) else if "!com!" == "X" (
				:: If jumped on player ::
				if "%CollidesWith%" == "%1" (
					call :bool %CharY% GTR !enemy%1_y! LastCond
				) else set LastCond=0
			) else if "!com!" == "_" (
				:: If collided with player horizontally ::
				if "%CollidesWith%" == "%1" (
					call :bool %CharY% EQU !enemy%1_y! LastCond
				) else set LastCond=0
			) else if "!com!" == "{" (
				:: Is facing left ::
				call :bool "!enemy%1_state:2=0!" -- "0" LastCond
			) else if "!com!" == "}" (
				:: Is facing right ::
				call :bool "!enemy%1_state:3=1!" -- "1" LastCond
			) else if "!com!" == "t" (
				:: True case for LastCond ::
				call :bool "!LastCond!" -- "1" DoExec
			) else if "!com!" == "f" (
				:: False case for LastCond ::
				call :bool "!LastCond!" -- "0" DoExec
			) else if "!com!" == "O" (
				:: Boolean or ::
				set NextBool=O
			) else if "!com!" == "A" (
				:: Boolean and ::
				set NextBool=A
			) else if "!com!" == "s" (
				:: Set variable to value ::
				set enemy%1_var=%%H
			) else if "!com!" == "v" (
				:: Is variable equal to value ::
				call :bool "!enemy%1_var!" -- "%%H" LastCond
			) else if "!com!" == "+" (
				:: Increase variable ::
				if !enemy%1_var! GEQ 99 (
					set enemy%1_var=0
				) else set /A enemy%1_var+=1
			) else if "!com!" == "-" (
				:: Decrease variable ::
				if !enemy%1_var! LEQ 0 (
					set enemy%1_var=99
				) else set /A enemy%1_var-=1
			) else if "!com!" == "." (
				:: Quit processing thoughts ::
				rem pause
				exit /B
			) else if "!com!" == "," (
				:: Quit processing thoughts and let char pass through ::
				rem pause
				call :bool "!CheckX!,!CheckY!" -- "!enemy%1_x!,!enemy%1_y!"
				if "!ErrorLevel!" == "1" (
					set CharX=!CheckX!
					set CharY=!CheckY!
				)
				exit /B
			)
			
			if not "!Bool!" == "" (
				set check=!Bool!,!PrevCond!,!LastCond!
				set check2=!check:,0=!
				if "!check!" == "A,1,1" (
					set LastCond=1
				) else if "!check2:~0,3!" == "O,1" (
					set LastCond=1
				) else set LastCond=0
				set Bool=
				set NextBool=
			)
		)
	)
exit /B

:save
	(echo set PrevLevels=%PrevLevels%)>save.bat
	(echo set CurrentLevel=%CurrentLevel%)>>save.bat
	(echo set ScreenLeft=%ScreenLeft%)>>save.bat
	(echo set ScreenTop=%ScreenTop%)>>save.bat
	(echo set Avatar=%Avatar%)>>save.bat
	(echo set CharX=%CharX%)>>save.bat
	(echo set CharY=%CharY%)>>save.bat
	(echo set Jumping=%Jumping%)>>save.bat
	(echo set WantHorz=%WantHorz%)>>save.bat
	(echo set enemys=%enemys%)>>save.bat
	for /L %%i in (1,1,%enemys%) do (
		(echo set enemy%%i_avatar=!enemy%%i_avatar!)>>save.bat
		(echo set enemy%%i_x=!enemy%%i_x!)>>save.bat
		(echo set enemy%%i_y=!enemy%%i_y!)>>save.bat
		(echo set enemy%%i_state=!enemy%%i_state!)>>save.bat
		(echo set enemy%%i_var=!enemy%%i_var!)>>save.bat
		(echo set enemy%%i_ai=!enemy%%i_ai!)>>save.bat
	)
exit /B

:loadLevel
:: loadLevel name [mode]
:: Mode is just to change minor functionalities based on what's using this function
:: Returns 0 if level does not exist and 1 otherwise
	if not exist "%~1.bat" exit /B 0
	:: Set defaults ::
	set color=07
	:: Level stuff ::
	set LevelName=
	set KillPlayer=0
	set WinLevel=0
	if not "%2" == "load" (
		set CurrentLevel=%~1
		set ScreenLeft=0
		set ScreenTop=0
		:: Movement related ::
		set Jumping=0
		set WantHorz=0
	)

	call "%~1.bat" %2
	if not "%2" == "win" (
		if not "%LevelName%" == "" (
			title %title% - %LevelName%
		) else title %title%
		color %color%
	)
	:: Adjust width and height to minimum values (79x24)
	if /I %width% LSS 79 (
		for /L %%i in (0,1,%height%) do (
			(set line%%i=!line%%i!                                                                               )
			(set coll%%i=!coll%%i!1111111111111111111111111111111111111111111111111111111111111111111111111111111)
			set line%%i=!line%%1:~0,79!
			set coll%%i=!coll%%1:~0,79!
		)
		set width=79
	)
	if /I %height% LSS 24 (
		set /A base24=23
		for /L %%i in (%height%,-1,0) do (
			set line!base24!=!line%%i!
			set coll!base24!=!coll%%i!
			set /A base24-=1
		)
		for /L %%i in (!base24!,-1,0) do (
			(set line%%i=!line%%i!                                                                               )
			(set coll%%i=!coll%%i!1111111111111111111111111111111111111111111111111111111111111111111111111111111)
		)
		set height=24
	)

	:: Parse enemies
	if not "%2" == "load" (
		set /A enemys-=1
		for /L %%i in (1,1,!enemys!) do (
			set enemy%%i_avatar=!enemy%%i:~0,1!
			:: Octal avoidance ::
			set /A enemy%%i_x=1!enemy%%i:~1,3! - 1000
			set /A enemy%%i_y=1!enemy%%i:~4,2! - 100
			set enemy%%i_state=!enemy%%i:~6,1!
			set enemy%%i_var=!enemy%%i:~7,1!
			call :parseAI "!enemy%%i:~8!"
			set enemy%%i_ai=!ResultAI!
		)
	)
exit /B 1

:parseAI
:: parseAI ai
	set TmpAI=%~1
	set TmpStart=0
	set ResultAI=
	set NoArg=0123456789BFKWHU@#clrdughLRxX_{}tf;OA+-.,
	:: TypeArgs:                                                                   ::
	::   Type: Arg = String, Num = Number                                          ::
	::   Args: Sequences of numbers, each digit is the amount of bytes that arg is ::
	set Arg1=C
	set Num2=sv
	:parseAI_loop
		set TmpCommand=!TmpAI:~%TmpStart%,1!
		if "%TmpCommand%" == "" goto parseAI_endLoop
		set /A TmpStart+=1
		if not "!Arg1:%TmpCommand%=!" == "%Arg1%" (
			set TmpCommand=%TmpCommand% !TmpAI:~%TmpStart%,1!
			set /A TmpStart+=1
		) else if not "!Num2:%TmpCommand%=!" == "%Num2%" (
			set TmpCommand=%TmpCommand% !TmpAI:~%TmpStart%,2!
			if "!TmpCommand:~2,1!" == "0" set TmpCommand=!TmpCommand:~0,1! !TmpCommand:~3,1!
			set /A TmpStart+=2
		) else if "!NoArg:%TmpCommand%=!" == "%NoArg%" (
			echo Error parsing AI, unknown command %TmpCommand%
			exit /B 1
		)
		set ResultAI=%ResultAI% "%TmpCommand%"
	goto parseAI_loop
	:parseAI_endLoop
	set ResultAI=%ResultAI:~1%
exit /B

::::::::: Convenience functions :::::::::
:bool
:: bool x comp y [var]
:: Comp can be -- for == or ~~ for not ... == or any of the compare-ops for /I
:: The reasoning is because = in call statments is a delimiter and ! is for delayed variables
:: Returns 1 if true and 0 if false
	if "%~2" == "--" (
		set comp=%1 == %3
	) else if "%~2" == "~~" (
		set comp=not %1 == %3
	) else set comp=/I %1 %2 %3
	if %comp% (
		if not "%4" == "" set %4=1
		exit /B 1
	)
	if not "%4" == "" set %4=0
exit /B 0

:slowFlood
:: slowFlood text ms
	ping 1.1.1.1 -n 1 -w %2 >nul
	if "%~1" == "" (
		echo.
	) else echo %~1
exit /B

:confirmQuit
	:: Called function ::
	choice /N /M "Are you sure you want to quit (Y/N)? "
	if "%ErrorLevel%" == "1" goto title
exit /B

:quit
