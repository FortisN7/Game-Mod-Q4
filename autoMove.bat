@echo off
setlocal

rem Define the paths to the source file and PK4 archive
set "source_file=C:\Users\Nicholas\Desktop\School\Game-Mod-Q4\Win32\Release\MPGamex86.dll"
set "pk4_archive=C:\Program Files (x86)\Steam\steamapps\common\Quake 4\my-mod\game000.pk4"

rem Check if the source file exists
if not exist "%source_file%" (
    echo Source file does not exist.
    exit /b
)

rem Check if the PK4 archive exists
if not exist "%pk4_archive%" (
    echo PK4 archive does not exist.
    exit /b
)

rem Use zip.exe to copy the file into the PK4 archive
"C:\Program Files\7-Zip\7z.exe" a "%pk4_archive%" "%source_file%"

rem Delete old gamex86.dll
del "C:\Program Files (x86)\Steam\steamapps\common\Quake 4\my-mod\gamex86.dll"

rem Check the exit code to determine if the operation was successful
if %errorlevel% neq 0 (
    echo Error: Failed to copy the file into the PK4 archive.
) else (
    echo File copied successfully into the PK4 archive.
)

endlocal