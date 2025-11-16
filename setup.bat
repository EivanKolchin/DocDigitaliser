@echo off
setlocal enabledelayedexpansion

set "ENV_FILE=.env"

echo This setup script creates or overwrites %%ENV_FILE%% with the MongoDB connection^&
echo strings required by DocDigitaliser.

echo.
set /p PRIMARY_URI=Enter the MongoDB connection string for the primary database: 
if "!PRIMARY_URI!"=="" (
    >&2 echo Error: primary connection string cannot be empty
    exit /b 1
)

echo.
set /p ARCHIVE_URI=Enter the MongoDB connection string for the archive database (leave blank to reuse the primary URI): 
if "!ARCHIVE_URI!"=="" (
    set "ARCHIVE_URI=!PRIMARY_URI!"
)

(
    echo MONGODB_PRIMARY_URI=!PRIMARY_URI!
    echo MONGODB_ARCHIVE_URI=!ARCHIVE_URI!
) > "!ENV_FILE!"

echo.
echo !ENV_FILE! created successfully. Update it anytime if your credentials change.
exit /b 0
