set ENVNAME=devenv

@echo off
echo Starting Python setup...

REM Download the Python installer
curl -o C:\Selenium\python-installer.exe https://www.python.org/ftp/python/3.12.3/python-3.12.3-amd64.exe > C:\Selenium\wsb\logs\setup_log.txt 2>&1
if errorlevel 1 (
    echo Python installer download failed. Check C:\Selenium\wsb\logs\setup_log.txt for details.
    exit /b 1
) else (
    echo Python installer downloaded successfully.
)

REM Install Python silently
C:\Selenium\python-installer.exe /quiet InstallAllUsers=1 PrependPath=1 > C:\Selenium\wsb\logs\setup_log.txt 2>&1
if errorlevel 1 (
    echo Virtual environment activation failed. Check C:\Selenium\wsb\logs\setup_log.txt for details.
    exit /b 1
)

REM Verify that Python was installed successfully
"C:\Program Files\Python312\python.exe" --version
if errorlevel 1 (
    echo Python installation failed. Exiting...
    exit /b 1
) else (
    echo Python installation completed.
    echo %PATH%
    echo Cleaning up directory...
    del C:\Selenium\python-installer.exe
)


REM Set up a virtual environment
echo Creating Python virtual environment...
if not exist C:\Selenium\%ENVNAME% (
    echo Directory does not exist. Creating virtual environment...
    "C:\Program Files\Python312\python.exe" -m venv C:\Selenium\%ENVNAME%
    if errorlevel 1 (
        echo Virtual environment creation failed. Exiting...
        exit /b 1
    )
)

REM Activate the virtual environment
echo Activating virtual environment...
C:\Selenium\%ENVNAME%\Scripts\activate
if errorlevel 1 (
    echo Virtual environment activation failed. Check C:\Selenium\wsb\logs\setup_log.txt for details.
    exit /b 1
)
echo Virtual environment activated successfully.

REM Installing Selenium
echo Installing Selenium...

REM Ensure necessary directories exist
if not exist C:\Selenium\%ENVNAME%\Scripts\activate (
    echo Virtual environment not found. Exiting...
    exit /b 1
)
if not exist C:\Selenium\wsb\logs (
    mkdir C:\Selenium\wsb\logs
)

REM Activate the virtual environment
call C:\Selenium\%ENVNAME%\Scripts\activate
if errorlevel 1 (
    echo Failed to activate virtual environment. Exiting...
    exit /b 1
)

REM Install Selenium
pip install selenium >> C:\Selenium\wsb\logs\setup_log.txt 2>&1
if errorlevel 1 (
    echo Failed to install Selenium. Check C:\Selenium\wsb\logs\setup_log.txt for details.
    exit /b 1
)

REM Success message
echo Selenium installed successfully. >> C:\Selenium\wsb\logs\setup_log.txt
echo Selenium installed successfully.


REM Verify that Python was installed successfully
pip show selenium
if errorlevel 1 (
    echo Selenium installation failed. Exiting...
    exit /b 1
)

REM Virtual environment deactivation
echo Deactivating virtual environment...
deactivate

REM Install Visual Studio Code


REM Ready for Testing
echo Ready for Testing...

REM Log the installation process
echo Setup complete. Log created at C:\Selenium\wsb\logs\setup_log.txt