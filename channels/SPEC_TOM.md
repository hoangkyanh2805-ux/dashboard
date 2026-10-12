# SPEC — TOM BENNETT Gold Trading VIP Dashboard

> Build theo format THẬT từ bài viết tổng kết hàng tuần trên Telegram của Tom. Codex PHẢI bám đúng spec này, không bịa màu/font/size.

---

## 1. Kiến trúc

```
tom.html (single file)
├── <style>     — toàn bộ CSS
├── <body>
│   ├── main.page
│   │   ├── div.toolbar
│   │   ├── section.stage
│   │   │   └── article#telegramExport.telegram-export (1280x720)
│   │   │       ├── header.brand
│   │   │       ├── section.metrics (5 cards)
│   │   │       ├── section.content-grid (58% / 42%)
│   │   │       │   ├── left: Daily Breakdown table
│   │   │       │   └── right: Result Summary (pie + legend)
│   │   │       ├── section.offer-strip (CTA banner)
│   │   │       └── section.footer-grid (notes + contact)
│   │   └── section.editor
└── <script>     — engine + store + export
```

**Storage key**: `tom-bennett-gold-vip-telegram-recap-v6`

---

## 2. Design System

### CSS Variables

```css
:root {
  --black: #050403;
  --panel: #040302;
  --gold-metal: #c89122;
  --gold-bright: #fff1b8;
  --gold: #ffc51f;
  --gold-2: #d89b18;
  --gold-3: #7a4a08;
  --cream: #fff7d7;
  --ivory: #fffaf0;
  --muted: #d5c7a7;
  --win-color: #00cc7a;
  --red: #ff2b43;
  --yellow: #ffcf24;
  --line: #d39a19;
  --metal-gradient: linear-gradient(135deg, #fff6d8 0%, #e0aa32 32%, #8c5b0a 62%, #fff1b8 100%);
}
```

### Typography
- **Brand title**: `Georgia, 'Times New Roman', serif`
- **Body**: `'Wix Madefor Text', Arial, sans-serif` (woff2, weight 400-800)
- **Font source**: `https://learn.tom-edu.com/_next/static/media/c5a8279ca13fb658-s.p.18v9tocfshzyf.woff2`
- **Local copy**: `tom/tom-font.woff2` (20KB, verified wOF2)
- **Logo**: `tom/tom-logo.png` (200x200, 72KB, từ YouTube avatar)

### Layout
- Page max-width: `min(1328px, 100vw)`
- Export canvas: `1280x720px` fixed, overflow hidden
- Grid rows: `86px 112px 280px 76px 94px`, gap 8px, padding `22px 24px`
- Content grid: `58% / 42%`, gap 14px
- Footer grid: `58% / 42%`, gap 14px

---

## 3. Components

### 3.1 Brand Header
- **Logo**: 200x200px (tom/tom-logo.png), border-radius 50%, border `2px solid var(--line)`, box-shadow `0 0 24px rgba(255, 200, 35, .16)`
- **Title**: `XAUUSD PREMIUM SIGNAL SUMMARY`, Georgia serif, 40px, line-height .94, uppercase, text-shadow `0 2px 0 #5d3704, 0 0 18px rgba(255, 210, 80, .35)`
- **Subtitle**: `From Oct 05 to Oct 09, 2026 – A Historic Trading Week!`, Wix Madefor Text 27px 800 uppercase
- **Date box**: border `2px solid var(--line)`, radius 8px, padding 8px 12px, background `rgba(0,0,0,.36)`, 18px 800, text-align center

### 3.2 Metrics (5 cards)
- **Grid**: `grid-template-columns: 1.04fr 1.04fr 1.04fr .94fr 1.48fr`
- **Card**: border-right `2px solid var(--line)`, padding 12px 16px
- **Icon**: 46x46px, metal gradient, border `2px solid var(--line)`, radius 7px, 23px 800
- **Label**: 16px 800 uppercase, color var(--gold)
- **Value**: 42px 800, color white
- **Value (profit)**: 38px, color var(--gold), white-space nowrap
- **Note**: 16px 800, `.win` → var(--win-color), `.loss` → var(--red)

**5 Metrics** (theo format thật):
1. TOTAL SIGNALS — icon "M1", value `30`
2. WINNING TRADES — icon "W", value `30`, note `(+4530 PIPS)` win
3. STOP-LOSS HIT — icon "L", value `0`, note `(-0 PIPS)` loss
4. TOTAL NET PROFIT — icon "TB", value `+4530 PIPS`, gold
5. OVERALL WIN RATE — icon "%", value `100%`, green

### 3.3 Content Grid (58% / 42%)

**Left: Daily Breakdown Panel**
- Panel: border `2px solid var(--line)`, radius 7px, background `rgba(0,0,0,.64)`
- Title: "Daily Performance", metal gradient background, color #070501, 22px 800 uppercase text-align center
- Table: width 100%, border-collapse collapse, table-layout fixed
- TH: height 36px, padding 3px 5px, border-top 1px solid rgba(211,154,25,.8), border-right 1px solid rgba(211,154,25,.65), background linear-gradient(180deg, #ffd95a, #d59a1d), color #050403, 13px 800 uppercase
- TD: height 41px, padding 3px 6px, border-top 1px solid rgba(211,154,25,.8), border-right 1px solid rgba(211,154,25,.65), color white, 19px 800
- Day cell: padding-left 16px, text-align left, 15px
- Profit cell: color var(--win-color)
- Footer: height 40px, background linear-gradient(180deg, #ffd95a, #d99d20), color #080602, profit cell color #007d48

**Table columns**: Day | Winning Pips | Losing Pips | Total Pips | Result
**5 rows** (Mon-Fri): Oct 05, Oct 06, Oct 07, Oct 08, Oct 09
**Footer**: Total row

**Right: Result Summary Panel**
- Panel: same as left
- Title: "Result Summary"
- Pie wrap: 200x200px, margin 0 auto
- Pie: conic-gradient, border 1px solid rgba(255,255,255,.25), border-radius 50%, box-shadow 0 0 24px rgba(0, 204, 122, .16)
- Pie labels: absolute positioned, 20px 800, color #050403
  - .win: right 18px, top 88px
  - .loss: left 16px, top 92px
- Legend: grid gap 10px
- Legend item: grid 24px 1fr, gap 11px, color white, 16px 700
- Swatch: 24x24px, radius 4px, border 1px solid rgba(255,255,255,.32)
- Legend b: margin-top 2px, 18px 800, .win → var(--win-color), .loss-copy b → var(--red)
- Profit box: width 220px, margin 0 12px 10px auto, padding 8px 10px 10px, border 2px solid var(--line), radius 7px, text-align center, background rgba(0,0,0,.44)
- Profit box span: color var(--gold), 18px 800 uppercase
- Profit box b: margin-top 3px, color var(--gold), 34px line-height .95

### 3.4 Offer Strip (CTA Banner)
- **Background**: `linear-gradient(90deg, rgba(255, 197, 31, .15), rgba(255, 197, 31, .05))`
- **Border**: `2px solid var(--line)`, radius 7px, padding 12px 18px
- **Text**: "If you're serious about getting fast and accurate signals with consistent performance, click the link below. My team will personally guide you and support you along the way."
- **Font**: Wix Madefor Text, 16px 650, color var(--ivory)
- **CTA button**: "JOIN VIP TODAY", metal gradient, color #120b02, radius 7px, padding 10px 20px, 800 uppercase, text-decoration none
- **Link**: `https://t.me/TomBennett_TradingExpertPro`

### 3.5 Footer Grid (58% / 42%)

**Left: Note Box**
- Grid: 94px 1fr, gap 16px, padding 10px 18px, border 2px solid var(--line)`, radius 7px, background rgba(0,0,0,.64)
- VIP medal: 58x58px, metal gradient, border-radius 50%, 25px 800
- Note lines: grid gap 10px
- Check line: grid 32px 1fr, gap 10px, color white, 15px 650
- Check: 30x30px, border-radius 50%, color #061006, background #86ff98, 13px 800
- Check line gold: color var(--gold), 17px 800

**Right: Contact Box**
- Grid: 64px 1fr, gap 14px, padding 10px 16px, border 2px solid var(--line)`, radius 7px, background rgba(0,0,0,.64)
- Mail icon: 52x42px, metal gradient, radius 7px, 25px 800
- Text: 14px 650, line-height 1.18
- Link: color var(--gold), 800

### 3.6 Editor
- Margin-top 16px, padding 18px, border 1px solid rgba(211,154,25,.48), radius 9px, background rgba(10,7,3,.9)
- Head: flex space-between, align end, gap 14px, margin-bottom 14px
- Title: 22px
- Form grid: `150px repeat(5, 102px) 1fr auto`, gap 10px, align end
- Label: grid gap 6px, color var(--muted), 12px
- Input/textarea: width 100%, min-height 44px, padding 10px 11px, border 1px solid rgba(211,154,25,.42), radius 7px, background #070604, color var(--ivory)
- Textarea: resize vertical
- Entries: margin-top 14px, grid gap 8px
- Entry: grid `112px 1fr repeat(5, 80px) 44px`, gap 10px, align center, padding 10px 0, border-top 1px solid rgba(211,154,25,.35), 13px
- Entry b: color var(--gold)
- Entry span: color var(--muted)
- Icon button: 38x38px, border 1px solid rgba(211,154,25,.42), radius 7px, color var(--muted), background transparent
- Focus: outline 3px solid rgba(255, 214, 116, .84), outline-offset 2px

### 3.7 Toolbar
- Flex space-between, align center, gap 16px, margin-bottom 14px
- H1: 22px, line-height 1.1
- P: margin 4px 0 0, color var(--muted), 14px
- Actions: flex, gap 10px
- Btn: border 1px solid var(--line)`, radius 7px, metal gradient, color #120b02, padding 0 18px, 800, min-height 44px
- Btn secondary: color var(--ivory), background rgba(255, 216, 80, .08)

### 3.8 Stage
- Overflow auto, padding 8px, border 1px solid rgba(211,154,25,.48), radius 9px, background rgba(255, 216, 80, .035)

### 3.9 Telegram Export Background
- Background: radial-gradient(circle at 14% 6%, rgba(255, 214, 72, .13), transparent 30%), linear-gradient(180deg, #0d0903 0%, #020201 100%)
- Border: 2px solid var(--line)`
- Box-shadow: inset 0 0 0 1px rgba(255, 240, 190, .16), inset 0 0 80px rgba(255, 192, 35, .06)
- ::before: linear-gradient(90deg, rgba(255,255,255,.04), transparent 12%, transparent 88%, rgba(255,204,60,.05))

---

## 4. Engine Logic

```javascript
const storageKey = 'tom-bennett-gold-vip-telegram-recap-v6';

function calculateSummary(records) {
  const totalSignals = records.reduce((s, r) => s + r.wins + r.losses + r.cancel, 0);
  const totalWins = records.reduce((s, r) => s + r.wins, 0);
  const totalStops = records.reduce((s, r) => s + r.losses, 0);
  const totalCancel = records.reduce((s, r) => s + r.cancel, 0);
  const totalPips = records.reduce((s, r) => s + r.pips, 0);
  const winRate = totalSignals ? (totalWins + totalCancel) / totalSignals * 100 : 0;
  
  return { totalSignals, totalWins, totalStops, totalCancel, totalPips, winRate, records };
}

function updateDashboard() {
  const summary = calculateSummary(records);
  totalSignals.textContent = summary.totalSignals;
  totalWins.textContent = summary.totalWins;
  totalStops.textContent = summary.totalStops;
  totalPips.textContent = formatSignedCompact(summary.totalPips) + ' PIPS';
  winRate.textContent = summary.winRate.toFixed(0) + '%';
  breakdownRows.innerHTML = summary.records.map(...).join('');
}
```

---

## 5. Export

- **Library**: html2canvas (CDN: https://cdn.jsdelivr.net/npm/html2canvas@1.4.1/dist/html2canvas.min.js)
- **Target**: `#telegramExport`
- **Width**: 1280px, **Height**: 720px
- **Filename**: `tom-bennett-gold-vip-telegram-recap-v6-{YYYY-MM-DD}.png`
- **Fallback**: XMLSerializer + foreignObject → SVG → canvas → PNG

---

## 6. Verify

Chạy `verify-tom-dashboard.ps1` sau khi build:
- 34 required text patterns
- 11 regex patterns (JS logic)
- 14 forbidden patterns (tránh copy style từ Alex)

---

## 7. Forbidden (KHÔNG ĐƯỢC CÓ)

- `ALEX XAUUSD`, `alex-xauusd-performance-v2`
- `tom-bennett-performance-v2`, `tom-bennett-xauusd-command-center-v3`, `tom-bennett-xauusd-telegram-recap-v4`
- `Trading Performance Command Center`
- `#30d07d`, `#95f3bd`, `--green:`, `--green-2:`
- `url('tom-thumbnail.png')`
- `EUR/USD`, `GBP/USD`, `USD/JPY`, `AUD/USD`
- `multi-market`, `multi market`, `watchlist`
