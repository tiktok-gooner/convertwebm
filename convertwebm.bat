@echo off
setlocal

rem Check if FFmpeg is in the system PATH
where ffmpeg >nul 2>nul
if %errorlevel% neq 0 (
    echo FFmpeg is not found in the system PATH. Please install FFmpeg and make sure it's in the PATH.
    exit /b 1
)

rem Check if the user provided an input file as an argument
if "%~1"=="" (
    echo Usage: %0 input.mp4
    exit /b 1
)

rem Set the input file name
set input=%~1

rem Generate an output file name based on the input file name
set output=%~n1.webm

rem Run FFmpeg command
ffmpeg -i "%input%" -an -c:v libvpx -b:v 1M -c:a libvorbis "%output%"

endlocal
