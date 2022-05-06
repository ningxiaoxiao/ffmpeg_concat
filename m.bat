SetLocal EnableDelayedExpansion
echo.>0.txt
for /f "delims=" %%a in ('dir /b/a-d *.mp4') do (
 echo file '%cd%\%%a'>>0.txt
)
for /f "delims=" %%i in (0.txt) do (
   set str=%%i
   set "str=!str:E:=file 'E:!"
   set "str=!str:.ts=.ts'!"
   echo !str!>>1.txt
)
move 1.txt 0.txt
ffmpeg.exe -f concat -safe 0 -i 0.txt -c copy out.mp4
pause
rem -safe 0: 防止Operation not permitted
rem dir /s /b *.ts> 0.txt此命令会列举子文件夹ts
