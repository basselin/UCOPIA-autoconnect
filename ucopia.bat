REM http://curl.haxx.se/download.html
:ucopia
CURL.EXE --header "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:37.0) Gecko/20100101 Firefox/37.0" --data "action=authenticate&login=LOGIN&password=PASSWORD&policy_accept=false" https://controller.access.network/portal_api.php
timeout /t 600 /nobreak
goto :ucopia
