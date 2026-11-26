#!/usr/bin/env bash
set -e
echo "🚀 Setting up Nishant's Google ADK Live Demo Kit..."

if [ ! -f ".env" ]; then
  cp .env.example .env
  echo "⚠️  Created .env from .env.example."
  echo "👉 Please open .env, paste your FREE Gemini API key from https://aistudio.google.com/apikey, and re-run ./setup_and_run.sh"
  exit 1
fi

if grep -q "PASTE_YOUR_FREE_GEMINI_API_KEY_HERE" .env; then
  echo "⚠️  You still need to paste your real GOOGLE_API_KEY into .env!"
  exit 1
fi

# Copy .env into each agent subfolder so adk web & adk eval both find it cleanly
for d in shark_tank_squad d2c_refund_concierge launch_studio_squad; do
  cp .env "$d/.env"
done

python3 -m venv .venv
source .venv/bin/activate
pip install --upgrade pip
pip install "google-adk[eval]"

echo ""
echo "✅ Ready! Opening Google ADK Web UI (includes Visual Builder + Trace X-Ray + Eval Tab)..."
echo "🌐 Open http://localhost:8000 in Chrome!"
adk web
