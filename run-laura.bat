
@echo off

if "%HOP_LOCATION%"=="" (
    set HOP_LOCATION=%1
) 

if "%HOP_LOCATION%"=="" (
  echo.
  echo "Please specify the folder where Hop is located."
  echo "You can do this by setting variable HOP_LOCATION"
  echo "Or by giving it to this script as the first argument:"
  echo.
  echo "  run-laura.bat D:\path\to\hop"
  echo.
  echo "You can download a recent Hop snapshot here:  "
  echo.
  echo "  hop.apache.org/download"
  echo.
  echo "You can download the Neo4j plugins for Hop here: "
  echo.
  echo "  https://github.com/mattcasters/hop-neo4j/releases/latest"
  echo.
  exit /b 1
) 

if not exist "laura-conf.json" (
  echo.
  echo "You can copy the file laura-conf.json.sample file to:"
  echo.
  echo "  laura-conf.json"
  echo.
  echo "In that file you can change the settings for Aura and folder location"mo
  echo.
  exit /b 2;
)

set HOP_OPTIONS=-Xmx512m
set HOP_CONFIG_FOLDER="%CD%\config"
set HOP_AUDIT_FOLDER="%CD%\audit"

if not exist "%CD%\tmp\" (
  mkdir "%CD%\tmp"
)

echo LAURA_DIR="%LAURA_DIR%"

CD /D "%HOP_LOCATION%"

START /B hop-run.bat -e laura -f hop\laura.hwf -r local -l Minimal

CD /D "%LAURA_DIR%"

