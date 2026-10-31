@echo off
setlocal EnableDelayedExpansion

if "%1" == "" GOTO help
if "%VIM_EXE%" == "" GOTO missing

REM Get absolute name
set "NAME=%~f1"
REM 单引号会破坏 Vim 表达式里的字符串，转义成两个单引号
set "NAME=%NAME:'=''%"
REM echo fullpath: %NAME%

if "%NVIM_LISTEN_ADDRESS%" == "" GOTO vim
goto neovim

:vim
call "%VIM_EXE%" --servername "%VIM_SERVERNAME%" --remote-expr "Tapi_TerminalEdit(0, '%NAME%')"
goto end

:neovim
where nvr >nul 2>nul
if errorlevel 1 goto nonvr
call "nvr" --servername "%VIM_SERVERNAME%" --remote-expr "Tapi_TerminalEdit(0, '%NAME%')"
goto end

:nonvr
echo missing nvr, you need install neovim-remote
goto end

:help
echo usage: drop {filename}
goto end

:missing
echo Must be called inside vim/neovim
goto end


:end


