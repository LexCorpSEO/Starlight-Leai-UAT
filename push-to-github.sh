#!/bin/bash
# ============================================================
# 🚀 Push Starlight-Leai to GitHub — One-command script
# ============================================================
#
# วิธีใช้:
#   1. สร้าง Personal Access Token (PAT) ที่:
#      https://github.com/settings/tokens/new?scopes=repo
#
#   2. รันสคริปต์นี้ พร้อมใส่ข้อมูล:
#      ./push-to-github.sh
#
#   3. ทำตาม prompt ที่ปรากฏ
#
# ============================================================

set -e

REPO_DIR="/home/z/my-project/download/Starlight-Leai"
DEFAULT_REPO="lexcorpseo/Starlight-Leai"

cd "$REPO_DIR"

echo "🚀 Push Starlight-Leai to GitHub"
echo "================================"
echo ""

# Ask for GitHub username
read -p "👤 GitHub username (default: lexcorpseo): " GH_USER
GH_USER=${GH_USER:-lexcorpseo}

# Ask for repo name
read -p "📦 Repo name (default: Starlight-Leai): " REPO_NAME
REPO_NAME=${REPO_NAME:-Starlight-Leai}

# Ask for PAT
echo ""
echo "🔐 ต้องการ Personal Access Token (PAT)"
echo "   สร้างได้ที่: https://github.com/settings/tokens/new?scopes=repo"
echo "   (เลือก scope: repo ครบทั้งหมด)"
echo ""
read -s -p "📋 วาง PAT ที่นี่ (จะไม่แสดง): " GH_PAT
echo ""

if [ -z "$GH_PAT" ]; then
  echo "❌ ไม่ได้ใส่ PAT ยกเลิกการ push"
  exit 1
fi

# Set remote
REMOTE_URL="https://${GH_USER}:${GH_PAT}@github.com/${GH_USER}/${REPO_NAME}.git"

# Check if remote exists
if git remote get-url origin > /dev/null 2>&1; then
  echo "🔄 อัปเดต remote origin..."
  git remote set-url origin "$REMOTE_URL"
else
  echo "➕ เพิ่ม remote origin..."
  git remote add origin "$REMOTE_URL"
fi

echo ""
echo "📦 กำลัง push ไป GitHub..."
echo "   URL: https://github.com/${GH_USER}/${REPO_NAME}"
echo ""

# Push
if git push -u origin main; then
  echo ""
  echo "✅ Push สำเร็จ!"
  echo ""
  echo "🌐 เว็บไซต์: https://${GH_USER}.github.io/${REPO_NAME}/"
  echo ""
  echo "⏳ GitHub Pages อาจใช้เวลา 1-2 นาทีในการ deploy ครั้งแรก"
  echo "   ตรวจสถานะได้ที่: https://github.com/${GH_USER}/${REPO_NAME}/actions"
  echo ""
  echo "📋 สิ่งที่ต้องทำหลัง push:"
  echo "   1. ไปที่ Settings → Pages → Source: GitHub Actions"
  echo "   2. รอ deploy workflow ทำงาน (ดูที่ tab Actions)"
  echo "   3. เปิดเว็บดูผลลัพธ์"
else
  echo ""
  echo "❌ Push ไม่สำเร็จ — ตรวจสอบ:"
  echo "   - PAT ถูกต้องหรือไม่ (ต้องมี scope: repo)"
  echo "   - Repo ${GH_USER}/${REPO_NAME} มีอยู่จริงหรือไม่"
  echo "   - ถ้า repo มี content อยู่แล้ว อาจต้อง git push -f origin main"
  exit 1
fi

# Clear PAT from memory
unset GH_PAT
