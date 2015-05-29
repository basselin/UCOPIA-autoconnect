@echo off
REM Telechargez http://curl.haxx.se/download.html

REM Veuillez saisir votre identifiant et votre mot de passe ci-dessous
set login=mon_identifiant
set password=mon_mot_de_passe

REM Les API possible
set api=https://controller.access.network/portal_api.php
REM set api=https://controller.mobile.lan/portal_api.php

:ucopia
	for /f "delims=" %%i in ('CURL.EXE --header "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:37.0) Gecko/20100101 Firefox/37.0" --data "action=authenticate&login=%login%&password=%password%&policy_accept=false" %api%') do set curlOutput=%%i
	echo %curlOutput% > curl.log
	findstr "CONNECT" curl.log >NUL
	if %errorlevel% neq 0 goto :curlError

	del curl.log
	echo.
	echo Vous etes connecte!
	timeout /t 600 /nobreak
goto :ucopia

:curlError
	echo.
	echo %curlOutput%
	echo.
	echo La connexion a echoue...
	timeout /t 6
goto :ucopia
