@echo off
setlocal

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

:: Use PowerShell to zip the files
powershell -command "Get-ChildItem -Path '.\%dir_name%\' -Filter *.%ext% | Compress-Archive -DestinationPath '.\%zip_name%' -Force"

:end
endlocal