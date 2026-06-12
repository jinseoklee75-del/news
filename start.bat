@echo off
chcp 65001 >nul
cd /d "%~dp0"

if not exist venv (
    echo 가상환경 생성 중...
    py -m venv venv 2>nul
    if errorlevel 1 python -m venv venv
    if errorlevel 1 (
        echo Python이 설치되어 있지 않습니다. https://www.python.org/downloads/ 에서 설치해 주세요.
        pause
        exit /b 1
    )
)

call venv\Scripts\activate
pip install -r requirements.txt -q
echo.
echo 서버 시작: http://localhost:8000
echo 종료: Ctrl+C
py run.py 2>nul
if errorlevel 1 python run.py
