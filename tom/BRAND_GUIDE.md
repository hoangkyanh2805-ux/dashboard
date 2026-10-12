# TOM BENNETT — Brand Guide

> Extract từ tom/index.html (Oct 12, 2026). Codex PHẢI bám đúng spec này, không bịa màu/font.

---

## 1. Typography

### Primary Font
- **Font**: `'Wix Madefor Text'` (woff2, weight 400-800)
- **Source**: `https://learn.tom-edu.com/_next/static/media/c5a8279ca13fb658-s.p.18v9tocfshzyf.woff2`
- **Local copy**: `tom/tom-font.woff2` (20KB, verified wOF2)
- **Fallback**: `Arial, sans-serif`
- **Dùng cho**: Body text, metrics, buttons, labels

### Brand Title Font
- **Font**: `Georgia, 'Times New Roman', serif`
- **Dùng cho**: `.brand-title` (TOM BENNETT GOLD TRADING VIP)
- **Style**: uppercase, `font-size: 40px`, `line-height: .94`, `text-shadow: 0 2px 0 #5d3704, 0 0 18px rgba(255, 210, 80, .35)`

### Logo
- **File**: `tom/tom-logo.png` (200x200, 72KB)
- **Source**: YouTube channel avatar (https://www.youtube.com/channel/UCXZE1vTPGBUuh1R_lOh5W-Q)
- **Dùng cho**: Brand mark, favicon, export PNG

### Font Sizes (extract từ CSS)
| Element | Size | Weight |
|---------|------|--------|
| `.brand-title` | 40px | 400 (serif) |
| `.brand-subtitle` | 27px | 800 |
| `.metric-value` | 42px | 800 |
| `.metric-label` | 16px | 800 |
| `.metric-note` | 16px | 800 |
| `.metric-profit .metric-value` | 38px | 800 |
| `.panel-title` | 22px | 800 |
| `.breakdown-table td` | 19px | 800 |
| `.breakdown-table th` | 13px | 800 |
| `.legend-item` | 16px | 700 |
| `.legend b` | 18px | 800 |
| `.check-line` | 15px | 650 |
| `.check-line.gold` | 17px | 800 |
| `.contact-box p` | 14px | 650 |
| `.btn` | inherit | 800 |
| `body` | 14px (default) | 400 |

---

## 2. Color Palette

### CSS Variables (extract từ `:root`)

```css
:root {
  --black: #050403;          /* Nền tối nhất */
  --panel: #040302;          /* Panel background */
  --gold-metal: #c89122;     /* Viền, border */
  --gold-bright: #fff1b8;    /* Gold highlight */
  --gold: #ffc51f;           /* Gold chính */
  --gold-2: #d89b18;         /* Gold trung bình */
  --gold-3: #7a4a08;         /* Gold tối */
  --cream: #fff7d7;          /* Chữ trắng kem */
  --ivory: #fffaf0;          /* Chữ chính */
  --muted: #d5c7a7;          /* Chữ phụ, xám vàng */
  --win-color: #00cc7a;      /* Xanh lá win */
  --red: #ff2b43;            /* Đỏ loss */
  --yellow: #ffcf24;         /* Vàng cancel */
  --line: #d39a19;           /* Border gold */
}
```

### Metal Gradient (dùng cho buttons, panel-title, icons)

```css
linear-gradient(135deg, #fff6d8 0%, #e0aa32 32%, #8c5b0a 62%, #fff1b8 100%)
```

### Color Usage Map

| Element | Color | Variable |
|---------|-------|----------|
| Background | `#050403` | `--black` |
| Panel bg | `#040302` | `--panel` |
| Border | `#d39a19` | `--line` |
| Primary text | `#fffaf0` | `--ivory` |
| Secondary text | `#fff7d7` | `--cream` |
| Muted text | `#d5c7a7` | `--muted` |
| Win/Success | `#00cc7a` | `--win-color` |
| Loss/Error | `#ff2b43` | `--red` |
| Cancel/Warning | `#ffcf24` | `--yellow` |
| Gold accent | `#ffc51f` | `--gold` |
| Gold dark | `#7a4a08` | `--gold-3` |

---

## 3. Layout Spec

### Telegram Export Canvas
- **Width**: `1280px` (fixed)
- **Height**: `720px` (fixed)
- **Overflow**: `hidden`

### Grid Structure
```
.telegram-export {
  display: grid;
  grid-template-rows: 86px 112px 360px 94px;
  gap: 8px;
  padding: 22px 24px;
}
```

### Key Dimensions
| Element | Size |
|---------|------|
| Page max-width | `min(1328px, 100vw)` |
| Button min-height | `44px` |
| Input min-height | `44px` |
| Icon (metric) | `46×46px` |
| Pie chart | `200×200px` |
| VIP medal | `58×58px` |
| Mail icon | `52×42px` |
| Check circle | `30×30px` |
| Border radius | `7px` (panel), `8px` (input), `999px` (button) |
| Border width | `2px` (panel, brand), `1px` (input) |

---

## 4. Component Specs

### Brand Header
- **Title**: Georgia serif, 40px, uppercase, `text-shadow: 0 2px 0 #5d3704, 0 0 18px rgba(255, 210, 80, .35)`
- **Subtitle**: Wix Madefor Text, 27px, 800, uppercase
- **Date box**: border `2px solid var(--line)`, border-radius `8px`, background `rgba(0,0,0,.36)`

### Metric Card
- **Icon**: `46×46px`, metal gradient, border `2px solid var(--line)`, border-radius `7px`
- **Label**: 16px, 800, uppercase, color `var(--gold)`
- **Value**: 42px, 800, color `white`
- **Value (profit)**: 38px, color `var(--gold)`, white-space `nowrap`
- **Note**: 16px, 800, `.win` → `var(--win-color)`, `.loss` → `var(--red)`

### Panel
- **Border**: `2px solid var(--line)`, border-radius `7px`
- **Background**: `rgba(0,0,0,.64)`
- **Title**: metal gradient background, color `#070501`, 22px, 800, uppercase, text-align `center`

### Table
- **Border**: `1px solid rgba(211,154,25,.8)` (th), `1px solid rgba(211,154,25,.65)` (td)
- **Header**: `linear-gradient(180deg, #ffd95a, #d59a1d)`, color `#050403`, 13px, 800, uppercase
- **Cell**: 19px, 800, color `white`
- **Day cell**: text-align `left`, 15px
- **Profit cell**: color `var(--win-color)`
- **Footer**: `linear-gradient(180deg, #ffd95a, #d99d20)`, color `#080602`

### Pie Chart
- **Type**: CSS `conic-gradient`
- **Size**: `200×200px`
- **Border**: `1px solid rgba(255,255,255,.25)`
- **Box-shadow**: `0 0 24px rgba(0, 204, 122, .16)`

### Buttons
- **Primary (`.btn`)**: metal gradient, color `#120b02`, border-radius `7px`, font-weight `800`
- **Secondary (`.btn.secondary`)**: color `var(--ivory)`, background `rgba(255, 216, 80, .08)`

### Inputs
- **Border**: `1px solid rgba(211,154,25,.42)`, border-radius `7px`
- **Background**: `#070604`
- **Color**: `var(--ivory)`
- **Focus**: `outline: 3px solid rgba(255, 214, 116, .84)`, `outline-offset: 2px`

---

## 5. Background Effects

```css
body {
  background: radial-gradient(circle at 18% 8%, rgba(255, 202, 45, .12), transparent 28%), #070502;
}

.telegram-export {
  background:
    radial-gradient(circle at 14% 6%, rgba(255, 214, 72, .13), transparent 30%),
    linear-gradient(180deg, #0d0903 0%, #020201 100%);
  border: 2px solid var(--line);
  box-shadow: inset 0 0 0 1px rgba(255, 240, 190, .16), inset 0 0 80px rgba(255, 192, 35, .06);
}
```

---

## 6. Content Structure

### Brand
- TOM BENNETT GOLD TRADING VIP
- WEEK TRADING SUMMARY | {date_range}
- sr-only: Tom Bennett Channel | Trading Expert | XAUUSD ONLY | Gold Weekly Recap | TOTAL SIGNALS | WINNING SIGNALS | LOSING SIGNALS | CANCEL SIGNALS | NET PROFIT

### Metrics (5 cards)
1. TOTAL SIGNALS
2. WINNING SIGNALS (+ pips)
3. LOSING SIGNALS (- pips)
4. CANCEL SIGNALS
5. NET PROFIT (pips)

### Content Grid (58% / 42%)
- **Left**: Weekly Breakdown table (Day, Total, Winning, Losing, Cancel, Net Profit)
- **Right**: Result Summary (pie + legend + profit box)

### Footer Grid (58% / 42%)
- **Left**: Note box (VIP medal + checklist)
- **Right**: Contact box (@ icon + Telegram link)

### Editor
- Form: Date, Total, Wins, Losses, Cancel, Pips, Note, Save button
- Entries list (existing records)
- Buttons: Reset, Export PNG, Load week (seed data)

---

## 7. Storage

```javascript
const storageKey = 'tom-bennett-gold-vip-telegram-recap-v5';
```

---

## 8. Export

- **Library**: html2canvas (CDN)
- **Size**: `1280×720px`
- **Filename**: `tom-bennett-gold-vip-telegram-recap-v5-{YYYY-MM-DD}.png`
- **Fallback**: XMLSerializer + foreignObject

---

## 9. Verify Script

Chạy `verify-tom-dashboard.ps1` để check:
- 34 required text patterns
- 11 regex patterns (JS logic)
- 14 forbidden patterns (tránh copy style từ Alex)
