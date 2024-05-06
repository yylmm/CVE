@echo off
REM 获取当前日期
for /f "tokens=2 delims==" %%i in ('wmic OS Get localdatetime /value') do set datetime=%%i
set date=%datetime:~0,4%%datetime:~4,2%%datetime:~6,2%

REM 使用当前日期作为提交信息
git add .
git commit -m "%date%"
git push --set-upstream origin main