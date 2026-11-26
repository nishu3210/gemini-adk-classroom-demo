@echo off
setlocal enabledelayedexpansion
chcp 65001 >nul
echo 🚀 Setting up Google ADK Classroom Demo Kit (Windows)...
echo.

REM ---- Step 1: make sure .env exists ----
if not exist ".env" (
  copy .env.example .env >nul
  echo ⚠️ Created .env from the template.
  echo 👉 Open .env, paste your free Gemini API key, then re-run this file.
  exit /b 1
)

REM ---- Step 2: make sure a real key was pasted ----
findstr /C:"PASTE_YOUR_FREE_GEMINI_API_KEY_HERE" .env >nul
if %errorlevel%==0 (
  echo ⚠️ You still need to paste your real GOOGLE_API_KEY into .env!
  echo    (Open .env, replace the placeholder with the key from https://aistudio.google.com/apikey)
  exit /b 1
)

REM ---- Step 3: copy .env into each agent subfolder ----
for %%d in (shark_tank_squad d2c_refund_concierge launch_studio_squad) do (
  copy /Y .env "%%d\.env" >nul
)

REM ---- Step 4: make sure Python is installed ----
where python >nul 2>nul
if %errorlevel% neq 0 (
  echo ❌ Python not found.
  echo    Download and install it from https://www.python.org/downloads/
  echo    IMPORTANT: tick "Add Python to PATH" during installation.
  exit /b 1
)

REM ---- Step 5: create virtualenv and install requirements ----
python -m venv .venv
call .venv\Scripts\activate.bat
python -m pip install --upgrade pip
python -m pip install -r requirements.txt

echo.
echo ✅ Ready! Starting Google ADK Web UI...
echo 🌐 Open http://localhost:8000 in Chrome.
adk web

endlocal
