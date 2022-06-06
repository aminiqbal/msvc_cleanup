@echo off

echo Windows Registry Editor Version 5.00^

^

[-HKEY_CLASSES_ROOT\.c]^

[-HKEY_CLASSES_ROOT\.cc]^

[-HKEY_CLASSES_ROOT\.cpp]^

[-HKEY_CLASSES_ROOT\.cxx]^

[-HKEY_CLASSES_ROOT\.h]^

[-HKEY_CLASSES_ROOT\.hpp]^

[-HKEY_CLASSES_ROOT\Directory\shell\AnyCode]^

[-HKEY_CLASSES_ROOT\Directory\Background\shell\AnyCode]^

>file.reg

%WINDIR%\system32\reg.exe import file.reg

del /f file.reg

start ie4uinit.exe -show

echo.
echo.
echo.
echo.
echo ---- MSVC MESS CLEANED ----
echo.
echo.
echo.
echo.

pause
