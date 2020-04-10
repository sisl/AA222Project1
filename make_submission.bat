@echo off
set project="project0"
set py_name="%project%_py"
set jl_name="%project%_jl"
set zip_name="%project%.zip"
set tmp_name="tempdir"
set /p lang=<language.txt
set correct=0

if "%lang%" == "julia" (
	mkdir %tmp_name%
	xcopy /q /y language.txt %tmp_name% > nul
	xcopy /q /y /s /i %jl_name%\*.jl %tmp_name%\%jl_name% > nul
	powershell Compress-Archive -Path %tmp_name%\* -Update %zip_name%
	rd /s /q %tmp_name%
) else if "%lang%" == "python" (
	mkdir %tmp_name%
	xcopy /q /y language.txt %tmp_name% > nul
	xcopy /q /y /s /i %py_name%\*.py %tmp_name%\%py_name% > nul
	powershell Compress-Archive -Path %tmp_name%\* -Update %zip_name%
	rd /s /q %tmp_name%
) else (
	echo language.txt does not contain a valid language. Make sure it says either julia or python, and nothing else.
)

