$ErrorActionPreference = 'Stop'

$path = Join-Path $PSScriptRoot 'index.html'
if (-not (Test-Path -LiteralPath $path)) {
  throw "Missing TOM dashboard file: $path"
}

$html = Get-Content -LiteralPath $path -Raw

$required = @(
  'TOM BENNETT',
  'GOLD TRADING VIP',
  'Tom Bennett Channel',
  'Trading Expert',
  'XAUUSD ONLY',
  'WEEK TRADING SUMMARY',
  'Weekly Breakdown',
  'Result Summary',
  'TOTAL SIGNALS',
  'WINNING SIGNALS',
  'LOSING SIGNALS',
  'CANCEL SIGNALS',
  'NET PROFIT',
  'id="telegramExport"',
  'width: 1280px',
  'height: 720px',
  'Wix Madefor Text',
  'Gold Weekly Recap',
  '+4500 PIPS',
  'id="totalPips"',
  'id="totalSignals"',
  'id="totalWins"',
  'id="totalStops"',
  'id="totalCancel"',
  'id="winRate"',
  'id="weekRange"',
  'id="breakdownRows"',
  'id="pieChart"',
  'function calculateSummary(records)',
  'function updateDashboard()',
  'async function exportPng()',
  'async function captureWithHtml2Canvas(exportNode)',
  'async function captureWithForeignObject(exportNode)',
  'new XMLSerializer()',
  'foreignObject',
  'URL.createObjectURL(svgBlob)',
  'downloadCanvas(canvas)',
  'try {',
  'catch (error)',
  'typeof html2canvas === ''function''',
  'useCORS: true',
  'allowTaint: false',
  'tom-bennett-gold-vip-telegram-recap-v5',
  '--gold-metal',
  '--gold-bright',
  '--ivory',
  '--black',
  'linear-gradient(135deg, #fff6d8 0%, #e0aa32 32%, #8c5b0a 62%, #fff1b8 100%)',
  'Export PNG'
)

foreach ($text in $required) {
  if ($html -notlike "*$text*") {
    throw "Missing expected TOM Gold VIP export/dashboard text: $text"
  }
}

$regexRequired = @(
  'const\s+totalPips\s*=\s*records\.reduce',
  'const\s+totalSignals\s*=\s*records\.reduce',
  'const\s+totalWins\s*=\s*records\.reduce',
  'const\s+totalStops\s*=\s*records\.reduce',
  'const\s+totalCancel\s*=\s*records\.reduce',
  'winRate\.textContent\s*=\s*summary\.winRate',
  'totalPips\.textContent\s*=\s*formatSignedCompact\(summary\.totalPips\)\s*\+\s*'' PIPS''',
  'breakdownRows\.innerHTML\s*=\s*summary\.records\.map',
  'saveRecords\(records\);\s*updateDashboard\(\);',
  'exportNode\.style\.width\s*=\s*''1280px''',
  'exportNode\.style\.height\s*=\s*''720px''',
  'document\.getElementById\(''exportReport''\)\.addEventListener\(''click'',\s*exportPng\)'
)

foreach ($pattern in $regexRequired) {
  if ($html -notmatch $pattern) {
    throw "Missing expected live binding/export implementation pattern: $pattern"
  }
}

$forbidden = @(
  'ALEX XAUUSD',
  'alex-xauusd-performance-v2',
  'tom-bennett-performance-v2',
  'tom-bennett-xauusd-command-center-v3',
  'tom-bennett-xauusd-telegram-recap-v4',
  'Trading Performance Command Center',
  '#30d07d',
  '#95f3bd',
  '--green:',
  '--green-2:',
  'url(''tom-thumbnail.png'')',
  'url("tom-thumbnail.png")',
  'EUR/USD',
  'GBP/USD',
  'USD/JPY',
  'AUD/USD',
  'multi-market',
  'multi market',
  'watchlist'
)

foreach ($text in $forbidden) {
  if ($html -like "*$text*") {
    throw "Found copy/style that conflicts with reliable TOM Gold VIP export: $text"
  }
}

Write-Host 'TOM Gold VIP reliable PNG export verification passed.'
