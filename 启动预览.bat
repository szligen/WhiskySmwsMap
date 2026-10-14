@echo off
chcp 65001 >nul
title 威士忌酒厂地图 - 本地预览服务器
cd /d "%~dp0"

echo ============================================
echo   威士忌酒厂地图 · 本地预览
echo   数据文件: SmwsMapGps.json
echo   改完 JSON 保存后，浏览器按 F5 刷新即可生效
echo   关闭本窗口即停止服务器
echo ============================================
echo.

rem 优先用系统 python
where python >nul 2>nul
if %errorlevel%==0 (
    start "" http://127.0.0.1:8899/WhiskySmwsMap.html
    python -m http.server 8899 --bind 127.0.0.1
    goto :eof
)

rem 备用 py launcher
where py >nul 2>nul
if %errorlevel%==0 (
    start "" http://127.0.0.1:8899/WhiskySmwsMap.html
    py -m http.server 8899 --bind 127.0.0.1
    goto :eof
)

echo [错误] 未检测到 Python。
echo.
echo 你有两个选择：
echo   1) 安装 Python 后重新运行本脚本
echo   2) 直接双击 WhiskySmwsMap.html 打开
echo      ^(能用，但处于"快照模式"：改 JSON 不会即时生效^)
echo.
pause