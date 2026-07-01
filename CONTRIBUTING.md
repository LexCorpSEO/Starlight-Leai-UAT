# 🤝 Contributing Guide

ขอบคุณที่สนใจร่วมพัฒนา **สะสมดาว — ดาวของหนู** 💛

ก่อนเริ่ม อ่าน [README.md](README.md) และ [docs/FREE_FOREVER_PLEDGE.md](docs/FREE_FOREVER_PLEDGE.md) ก่อนครับ

---

## 🎯 หลักการสำคัญ (จำเป็น)

ทุก contribution ต้องยึดหลักเหล่านี้:

1. **💯 Free Forever** — ห้ามเพิ่มฟีเจอร์ที่ต้องจ่ายเงิน, subscription, หรือ in-app purchase
2. **🚫 No Ads** — ห้ามเพิ่มโฆษณาใดๆ ทั้ง AdSense, affiliate, sponsored content
3. **🔒 Privacy First** — ห้ามเพิ่ม analytics ที่ track ผู้ใช้ (ห้าม Google Analytics, Facebook Pixel)
   - ถ้าจำเป็นต้องวัด ใช้ Plausible หรือ Umami แบบ privacy-first เท่านั้น
4. **👶 Child-Safe** — ทุกฟีเจอร์ต้องปลอดภัยสำหรับเด็กอายุ 3-10 ปี
5. **🇹🇭 Thai-First** — ภาษาหลักคือไทย ภาษาอังกฤษเป็น secondary
6. **♿ Accessible** — รองรับ screen reader (ARIA labels), มี keyboard navigation

---

## 🛠️ การตั้งค่าสำหรับนักพัฒนา

### ความต้องการ
- เบราว์เซอร์ล่าสุด (Chrome แนะนำ)
- Git
- (ไม่จำเป็น) Python 3 หรือ Node.js สำหรับรัน local server

### ขั้นตอนเริ่มต้น

```bash
# 1. Fork repo บน GitHub ก่อน
# 2. Clone fork ของคุณ
git clone https://github.com/<YOUR_USERNAME>/Starlight-Leai.git
cd Starlight-Leai

# 3. เพิ่ม upstream remote
git remote add upstream https://github.com/lexcorpseo/Starlight-Leai.git

# 4. รัน local server
python3 -m http.server 8000
# หรือ: npx serve .

# 5. เปิด http://localhost:8000
```

### การใช้ Firebase ของตัวเอง (ถ้าจำเป็น)

แอปใช้ Firebase ของเจ้าของ repo อยู่แล้ว แต่ถ้าคุณต้องการทดสอบฟีเจอร์ที่ต้องใช้ Firebase:

1. สร้าง project ที่ <https://console.firebase.google.com/>
2. เปิด Authentication (Google + Email/Password)
3. สร้าง Firestore database
4. คัดลอก config จาก Project Settings → Web App
5. แก้ `firebaseConfig` ใน `index.html` (ห้าม commit การเปลี่ยนแปลงนี้!)

---

## 🌿 Git Workflow

### Branch naming
```
feature/<short-description>     เช่น feature/voice-star-giving
bugfix/<short-description>      เช่น bugfix/wheel-spin-angle
docs/<short-description>        เช่น docs/privacy-policy
chore/<short-description>       เช่น chore/update-readme
```

### Commit convention (Conventional Commits)

```
<type>(<scope>): <description>

feat(mascot): add Lottie IDLE state animation
fix(wheel): correct spin angle calculation
docs: add Free Forever Pledge section
refactor(firestore): optimize query
chore: update dependencies
```

| Type | ใช้เมื่อ |
|---|---|
| `feat` | เพิ่มฟีเจอร์ใหม่ |
| `fix` | แก้บั๊ก |
| `docs` | แก้ documentation |
| `refactor` | ปรับโครงสร้างโค้ด (ไม่เปลี่ยนพฤติกรรม) |
| `perf` | ปรับประสิทธิภาพ |
| `chore` | งานบำรุงรักษา |
| `test` | เพิ่ม/แก้ test |
| `style` | ปรับ format ไม่กระทบ logic |

### ขั้นตอนส่ง PR

```bash
# 1. อัปเดตจาก upstream
git checkout main
git pull upstream main

# 2. สร้าง branch ใหม่
git checkout -b feature/<your-feature>

# 3. ทำงาน + commit
git add .
git commit -m "feat(scope): description"

# 4. Push ไป fork ของคุณ
git push origin feature/<your-feature>

# 5. เปิด PR บน GitHub จาก fork → upstream/main
```

---

## ✅ Checklist ก่อนส่ง PR

- [ ] โค้ดไม่ทำลายฟีเจอร์เดิม
- [ ] ทดสอบบน Chrome (Desktop) แล้ว
- [ ] ทดสอบบนมือถือ (Chrome Android หรือ Safari iOS) แล้ว
- [ ] ไม่เพิ่ม dependencies ที่ไม่จำเป็น
- [ ] ไม่เพิ่ม analytics/ads/tracking
- [ ] ไม่เพิ่มฟีเจอร์ที่ต้องจ่ายเงิน
- [ ] มี ARIA labels ถ้าเพิ่ม UI ใหม่
- [ ] ภาษาไทยใช้ถูกต้อง (เช็ค spelling)
- [ ] ผ่าน Lighthouse audit (Accessibility > 90)
- [ ] อัปเดต README/docs ถ้าจำเป็น

---

## 🎨 Style Guide

### HTML
- ใช้ semantic HTML5 (`<section>`, `<article>`, `<nav>`, `<header>`, `<main>`)
- ทุก interactive element ต้องมี `aria-label`
- ใช้ `lang="th"` สำหรับเนื้อหาไทย

### CSS
- ใช้ CSS variables ที่มีอยู่แล้ว (`--star`, `--toy`, `--sea`, ฯลฯ)
- Mobile-first responsive
- รองรับ `prefers-reduced-motion` สำหรับ animation
- หลีกเลี่ยง `!important` ใช้ specificity แทน

### JavaScript
- Vanilla JS (ไม่มี framework — ตอนนี้)
- ใช้ `const`/`let` ไม่ใช้ `var`
- ใช้ template literals สำหรับ string concat
- ทุก function ควรมี comment ภาษาไทยอธิบายสั้นๆ
- หลีกเลี่ยง global variables ใหม่ — ใช้ IIFE หรือ attach ไปที่ `window` เท่าที่จำเป็น

### ภาษาไทย
- ใช้ "ครับ/ค่ะ" สำหรับทุกคน (neutral)
- ใช้ "หนู" สำหรับเด็ก (เช่น "หนูเก่งมาก!")
- หลีกเลี่ยงคาถาทางการเกินไป — ใช้ภาษาเข้าใจง่าย

---

## 🐛 รายงานบั๊ก

ใช้ template [Bug Report](.github/ISSUE_TEMPLATE/bug-report.yml) และใส่ข้อมูล:

- เบราว์เซอร์ + version
- OS + device (มือถือรุ่นไหน / desktop)
- ขั้นตอนที่ทำก่อนเกิดบั๊ก
- ภาพหน้าจอ (ถ้ามี)
- ข้อความ error ใน console (F12 → Console)

---

## 💡 เสนอฟีเจอร์

ใช้ template [Feature Request](.github/ISSUE_TEMPLATE/feature-request.yml):

- อธิบายปัญหาที่ฟีเจอร์นี้แก้
- อธิบายวิธีที่คุณคิดว่าฟีเจอร์ควรทำงาน
- ถ้ามี แนบภาพ mockup หรือ wireframe

---

## 💌 ผู้ปกครอก Feedback

ถ้าคุณเป็นผู้ปกครอกที่ใช้แอปและอยากเล่าประสบการณ์:
- ใช้ template [Parent Feedback](.github/ISSUE_TEMPLATE/parent-feedback.yml)
- ไม่ต้องมีความรู้ด้านเทคนิคก็ได้
- เล่าได้ว่าลูกชอบ/ไม่ชอบอะไร ฟีเจอร์ไหนอยากให้มีเพิ่ม

---

## 🏆 Contributors

ขอบคุณทุกคนที่ช่วยพัฒนาแอปนี้ (จะเพิ่มชื่อเมื่อมี contributor ใหม่)

---

## ❓ คำถามอื่นๆ

ถ้ามีคำถามที่ไม่ใช่ bug หรือ feature request:
- เปิด [GitHub Discussion](https://github.com/lexcorpseo/Starlight-Leai/discussions) (ถ้าเปิดไว้)
- หรือเปิด issue แล้วติดป้าย `question`

ขอบคุณที่ร่วมทำให้แอปนี้ดีขึ้นสำหรับครอบครัวไทย 💛
