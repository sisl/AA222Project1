@echo off
setlocal

set zip_path="C:\Program Files\7-Zip\7z.exe"

:: Check if 7-Zip is installed in the expected location
if exist %zip_path% (
    echo 7-Zip is installed in the correct location.
) else (
    echo ERROR: 7-Zip is not installed in the expected location: %zip_path%
    echo Please install 7-Zip in the default directory or update this script with the correct path.
    goto end
)

set project=project1
set py_name=%project%_py
set jl_name=%project%_jl
set zip_name=%project%.zip

:: Read the language from language.txt
set /p lang=<language.txt

:: Determine the directory and file extension based on the language
if "%lang%" == "julia" (
    set dir_name=%jl_name%
    set ext=jl
) else if "%lang%" == "python" (
    set dir_name=%py_name%
    set ext=py
) else (
    echo language.txt does not contain a valid language. Make sure it says either julia or python, and nothing else.
    goto end
)

:: Use 7-Zip to zip the files 
"C:\Program Files\7-Zip\7z.exe" a -tzip "%zip_name%" "%dir_name%" "language.txt" -mx=0

:end
endlocal