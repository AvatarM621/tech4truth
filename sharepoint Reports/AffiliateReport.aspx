<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Affiliate Report — PSWC Church Assessments</title>
  <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;600;700&family=Crimson+Pro:ital,wght@0,300;0,400;0,600;1,300&display=swap" rel="stylesheet"/>
  <style>
    :root {
      --navy: #1a3a6b; --navy-light: #2a52a0; --navy-dim: #3a6abf;
      --bg: #ffffff; --panel: #f4f6fa; --panel2: #eef1f7;
      --border: rgba(26,58,107,0.18); --text: #111111;
      --text-muted: #555e70; --radius: 10px;
      --gold: #c8a85a; --gold-dim: #e0c98a;
    }
    * { box-sizing: border-box; margin: 0; padding: 0; }
    body { font-family: 'Crimson Pro', Georgia, serif; background: var(--bg); color: var(--text); min-height: 100vh; padding-bottom: 120px; }
    body::before { content:''; position:fixed; inset:0; background: radial-gradient(ellipse 80% 60% at 50% -10%, rgba(26,58,107,0.05) 0%, transparent 70%); pointer-events:none; z-index:0; }

    /* ── NAV ── */
    nav { position:sticky; top:0; z-index:100; background:var(--navy); box-shadow:0 2px 14px rgba(26,58,107,0.22); display:flex; align-items:center; padding:0 32px; height:56px; gap:4px; }
    .nav-brand { font-family:'Cinzel',serif; font-size:14px; font-weight:700; color:#fff; letter-spacing:0.08em; margin-right:24px; white-space:nowrap; }
    .nav-brand span { font-weight:400; opacity:0.65; font-size:10px; display:block; letter-spacing:0.14em; margin-top:1px; }
    .nav-divider { width:1px; height:22px; background:rgba(255,255,255,0.15); margin:0 8px; }
    .nav-link { font-family:'Cinzel',serif; font-size:11px; letter-spacing:0.1em; color:rgba(255,255,255,0.7); text-decoration:none; padding:8px 16px; border-radius:5px; transition:all 0.18s; white-space:nowrap; }
    .nav-link:hover { background:rgba(255,255,255,0.12); color:#fff; }
    .nav-link.active { background:rgba(255,255,255,0.18); color:#fff; }

    /* ── LAYOUT ── */
    .container { position:relative; z-index:1; max-width:1280px; margin:0 auto; padding:0 32px 60px; }

    /* ── HEADER ── */
    header { padding:44px 0 30px; border-bottom:2px solid var(--border); margin-bottom:36px; display:flex; align-items:flex-end; justify-content:space-between; gap:20px; flex-wrap:wrap; }
    .eyebrow { font-family:'Cinzel',serif; font-size:10px; letter-spacing:0.3em; color:var(--navy-dim); text-transform:uppercase; margin-bottom:10px; }
    h1 { font-family:'Cinzel',serif; font-size:clamp(22px,3.5vw,36px); font-weight:700; color:var(--navy); line-height:1.1; }
    h1 span { display:block; font-size:0.52em; font-weight:400; color:var(--text-muted); margin-top:5px; letter-spacing:0.01em; }
    .header-meta { font-size:13px; color:var(--text-muted); text-align:right; }
    #last-updated { color:var(--navy-dim); font-style:italic; }

    /* ── BUTTONS ── */
    .btn { display:inline-flex; align-items:center; gap:8px; padding:9px 20px; border-radius:6px; font-family:'Cinzel',serif; font-size:11px; letter-spacing:0.1em; cursor:pointer; border:none; transition:all 0.2s; }
    .btn-primary { background:var(--navy); color:#fff; }
    .btn-primary:hover { background:var(--navy-light); }
    .btn-outline { background:transparent; color:var(--navy); border:1px solid var(--border); }
    .btn-outline:hover { border-color:var(--navy); background:rgba(26,58,107,0.05); }

    /* ── FILTER BAR ── */
    .filter-bar { background:var(--panel); border:1px solid var(--border); border-radius:var(--radius); padding:20px 24px; margin-bottom:32px; display:flex; align-items:center; gap:16px; flex-wrap:wrap; }
    .filter-label { font-family:'Cinzel',serif; font-size:10px; letter-spacing:0.2em; color:var(--navy-dim); text-transform:uppercase; white-space:nowrap; }
    .filter-select-wrap { flex:1; min-width:220px; max-width:380px; }
    select { width:100%; background:#fff; border:1px solid var(--border); color:var(--text); font-family:'Crimson Pro',serif; font-size:16px; border-radius:8px; padding:11px 16px; outline:none; transition:border-color 0.2s; cursor:pointer; appearance:none; background-image:url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='12' height='12' viewBox='0 0 24 24' fill='none' stroke='%23555e70' stroke-width='2'%3E%3Cpolyline points='6 9 12 15 18 9'%3E%3C/polyline%3E%3C/svg%3E"); background-repeat:no-repeat; background-position:right 14px center; padding-right:38px; }
    select:focus { border-color:var(--navy-dim); }
    select option { background:#f4f6fa; }
    .filter-info { margin-left:auto; font-size:13px; color:var(--text-muted); display:flex; align-items:center; gap:12px; }
    #result-summary { white-space:nowrap; }

    /* ── STATS ── */
    .stats-row { display:grid; grid-template-columns:repeat(auto-fit,minmax(155px,1fr)); gap:16px; margin-bottom:36px; }
    .stat-card { background:var(--panel); border:1px solid var(--border); border-radius:var(--radius); padding:20px 22px; position:relative; overflow:hidden; transition:box-shadow 0.2s; }
    .stat-card:hover { box-shadow:0 4px 16px rgba(26,58,107,0.1); }
    .stat-card::before { content:''; position:absolute; top:0; left:0; right:0; height:3px; background:linear-gradient(90deg,var(--navy),var(--navy-dim),transparent); }
    .stat-label { font-size:10px; letter-spacing:0.18em; color:var(--text-muted); text-transform:uppercase; font-family:'Cinzel',serif; margin-bottom:8px; }
    .stat-value { font-family:'Cinzel',serif; font-size:30px; font-weight:700; color:var(--navy); line-height:1; }
    .stat-sub { font-size:12px; color:var(--text-muted); margin-top:5px; }

    /* ── SECTION DIVIDER ── */
    .section-divider { display:flex; align-items:center; gap:16px; margin:40px 0 24px; }
    .section-title { font-family:'Cinzel',serif; font-size:13px; letter-spacing:0.22em; text-transform:uppercase; color:var(--navy); white-space:nowrap; }
    .section-line { flex:1; height:1px; background:var(--border); }
    .section-count { font-family:'Cinzel',serif; font-size:11px; color:var(--text-muted); background:var(--panel); border:1px solid var(--border); border-radius:12px; padding:2px 10px; }

    /* ── CHURCH CARDS ── */
    #churches-area { display:flex; flex-direction:column; gap:20px; }
    .church-card { background:var(--panel); border:1px solid var(--border); border-radius:12px; overflow:hidden; transition:box-shadow 0.2s; }
    .church-card:hover { box-shadow:0 4px 20px rgba(26,58,107,0.1); }
    .church-card-header { background:rgba(26,58,107,0.06); border-bottom:1px solid var(--border); padding:16px 22px; display:flex; align-items:center; justify-content:space-between; gap:12px; cursor:pointer; user-select:none; transition:background 0.18s; }
    .church-card-header:hover { background:rgba(26,58,107,0.1); }
    .ch-left { display:flex; flex-direction:column; gap:5px; }
    .church-name { font-family:'Cinzel',serif; font-size:15px; font-weight:700; color:var(--navy); }
    .church-meta { display:flex; gap:10px; align-items:center; flex-wrap:wrap; }
    .badge { display:inline-block; padding:3px 10px; border-radius:20px; font-size:12px; background:rgba(26,58,107,0.1); color:var(--navy); border:1px solid rgba(26,58,107,0.18); }
    .badge-gold { background:rgba(200,168,90,0.12); color:#8a6a1a; border-color:rgba(200,168,90,0.3); }
    .meta-text { font-size:13px; color:var(--text-muted); }
    .ch-right { display:flex; align-items:center; gap:14px; flex-shrink:0; }
    .toggle-icon { font-size:16px; color:var(--navy-dim); transition:transform 0.22s; }
    .church-card.expanded .toggle-icon { transform:rotate(180deg); }
    .church-card-body { display:none; }
    .church-card.expanded .church-card-body { display:block; }

    /* Church fields grid */
    .church-fields { padding:18px 22px; border-bottom:1px solid rgba(26,58,107,0.08); display:grid; grid-template-columns:repeat(auto-fill,minmax(190px,1fr)); gap:14px 28px; }
    .field-item .field-label { font-size:10px; letter-spacing:0.14em; text-transform:uppercase; color:var(--text-muted); font-family:'Cinzel',serif; margin-bottom:3px; }
    .field-item .field-value { font-size:15px; color:var(--text); }

    /* ── LEADER ASSESSMENTS SUB-TABLE ── */
    .sub-section { padding:18px 22px 22px; }
    .sub-header { display:flex; align-items:center; gap:10px; margin-bottom:14px; }
    .sub-title { font-family:'Cinzel',serif; font-size:11px; letter-spacing:0.2em; text-transform:uppercase; color:var(--navy-dim); }
    .sub-count { background:var(--navy); color:#fff; border-radius:10px; padding:2px 8px; font-family:'Cinzel',serif; font-size:10px; }
    .sub-table-wrap { border:1px solid var(--border); border-radius:8px; overflow:hidden; }
    .sub-table { width:100%; border-collapse:collapse; font-size:14px; }
    .sub-table thead { background:rgba(26,58,107,0.06); border-bottom:1px solid var(--border); }
    .sub-table th { font-family:'Cinzel',serif; font-size:9px; letter-spacing:0.18em; color:var(--navy-dim); text-transform:uppercase; padding:10px 14px; text-align:left; white-space:nowrap; cursor:pointer; }
    .sub-table th:hover { color:var(--navy); }
    .sub-table tbody tr { border-bottom:1px solid rgba(26,58,107,0.07); transition:background 0.15s; }
    .sub-table tbody tr:last-child { border-bottom:none; }
    .sub-table tbody tr:hover { background:rgba(26,58,107,0.04); }
    .sub-table td { padding:10px 14px; vertical-align:middle; }
    .no-sub { font-style:italic; color:var(--text-muted); font-size:14px; padding:14px 0; }

    /* ── LEADER LIST TABLE ── */
    .table-wrap { background:var(--panel); border:1px solid var(--border); border-radius:var(--radius); overflow:hidden; }
    .main-table { width:100%; border-collapse:collapse; font-size:15px; }
    .main-table thead { background:rgba(26,58,107,0.07); border-bottom:1px solid var(--border); }
    .main-table th { font-family:'Cinzel',serif; font-size:10px; letter-spacing:0.18em; color:var(--navy-dim); text-transform:uppercase; padding:14px 18px; text-align:left; white-space:nowrap; cursor:pointer; user-select:none; }
    .main-table th:hover, .main-table th.sorted { color:var(--navy); }
    .main-table tbody tr { border-bottom:1px solid rgba(26,58,107,0.09); transition:background 0.15s; }
    .main-table tbody tr:last-child { border-bottom:none; }
    .main-table tbody tr:hover { background:rgba(26,58,107,0.04); }
    .main-table td { padding:13px 18px; vertical-align:middle; }
    .cell-bold { font-weight:600; }
    .empty-row td { text-align:center; color:var(--text-muted); padding:60px 20px; font-style:italic; }

    /* SEARCH */
    .search-wrap { position:relative; flex:1; min-width:200px; max-width:300px; }
    .search-icon { position:absolute; left:13px; top:50%; transform:translateY(-50%); color:var(--text-muted); pointer-events:none; }
    input[type="text"] { width:100%; background:#fff; border:1px solid var(--border); color:var(--text); font-family:'Crimson Pro',serif; font-size:15px; border-radius:8px; padding:10px 16px 10px 40px; outline:none; transition:border-color 0.2s; }
    input[type="text"]:focus { border-color:var(--navy-dim); }

    /* ── STATES ── */
    #state-loading { text-align:center; padding:100px 20px; color:var(--text-muted); }
    .spinner { width:40px; height:40px; border:2px solid var(--border); border-top-color:var(--navy); border-radius:50%; animation:spin 0.85s linear infinite; margin:0 auto 18px; }
    @keyframes spin { to { transform:rotate(360deg); } }
    .loading-sub { font-size:13px; margin-top:6px; color:var(--text-muted); }

    #state-error { display:none; background:rgba(180,60,60,0.08); border:1px solid rgba(180,60,60,0.22); border-radius:var(--radius); padding:22px 26px; margin-bottom:24px; color:#cc3333; font-size:15px; line-height:1.7; white-space:pre-wrap; }
    #state-data { display:none; }

    /* ── FOOTER ── */
    footer { margin-top:48px; padding-top:20px; border-top:1px solid var(--border); display:flex; justify-content:space-between; font-size:12px; color:var(--text-muted); flex-wrap:wrap; gap:10px; }

    /* ── DEBUG ── */
    #debug-toggle { position:fixed; bottom:0; right:16px; z-index:10000; background:var(--navy); color:#fff; border:none; padding:5px 14px; font-size:11px; font-family:monospace; cursor:pointer; border-radius:4px 4px 0 0; font-weight:bold; }
    #debug-panel { display:none; position:fixed; bottom:0; left:0; right:0; background:#0d1320; border-top:2px solid var(--navy); padding:10px 16px; font-family:monospace; font-size:12px; color:#ccc; max-height:220px; overflow-y:auto; z-index:9999; }
    #debug-panel.open { display:block; }
    .d-err{color:#ff7070} .d-ok{color:#70ffb0} .d-info{color:#70c5ff} .d-warn{color:#ffd070}

    /* ── RESPONSIVE ── */
    @media (max-width: 640px) {
      nav { padding:0 16px; }
      .container { padding:0 16px 60px; }
      .filter-bar { padding:14px 16px; }
      .church-fields { grid-template-columns:1fr 1fr; }
    }
  </style>
</head>
<body>

<nav>
  <div class="nav-brand">PSWC <span>Church Assessments</span></div>
  <div class="nav-divider"></div>
  <a href="index.aspx" class="nav-link">Home</a>
  <a href="Leaders.aspx" class="nav-link">Leaders</a>
  <a href="church-assessments-report.aspx" class="nav-link">Church Assessments</a>
  <a href="leader-assessments-report.aspx" class="nav-link">Leader Assessments</a>
  <a href="AffiliateReport.aspx" class="nav-link active">Affiliate Report</a>
</nav>

<div class="container">
  <header>
    <div>
      <div class="eyebrow">PSWC · Church Assessments</div>
      <h1>Affiliate Report <span>Church Assessments &amp; Leader Assessments — Filtered by Affiliate</span></h1>
    </div>
    <div class="header-meta">
      <div id="last-updated">—</div>
      <div style="margin-top:4px;">Live from SharePoint</div>
    </div>
  </header>

  <div id="state-error"></div>

  <div id="state-loading">
    <div class="spinner"></div>
    <div style="font-family:'Cinzel',serif;font-size:13px;letter-spacing:0.12em;">Loading data…</div>
    <div class="loading-sub">Connecting to SharePoint · PSWCTEST</div>
  </div>

  <div id="state-data">

    <!-- ── FILTER BAR ── -->
    <div class="filter-bar">
      <span class="filter-label">Filter by Affiliate</span>
      <div class="filter-select-wrap">
        <select id="affiliate-filter" onchange="applyFilters()">
          <option value="">All Affiliates</option>
        </select>
      </div>
      <div class="filter-info">
        <span id="result-summary"></span>
        <button class="btn btn-outline" onclick="loadData()">↻ Refresh</button>
      </div>
    </div>

    <!-- ── STATS ── -->
    <div class="stats-row">
      <div class="stat-card">
        <div class="stat-label">Affiliates</div>
        <div class="stat-value" id="stat-affiliates">—</div>
        <div class="stat-sub">total affiliates</div>
      </div>
      <div class="stat-card">
        <div class="stat-label">Church Assessments</div>
        <div class="stat-value" id="stat-churches">—</div>
        <div class="stat-sub">showing / total</div>
      </div>
      <div class="stat-card">
        <div class="stat-label">Leaders</div>
        <div class="stat-value" id="stat-leaders">—</div>
        <div class="stat-sub">showing / total</div>
      </div>
      <div class="stat-card">
        <div class="stat-label">Leader Assessments</div>
        <div class="stat-value" id="stat-la">—</div>
        <div class="stat-sub">showing / total</div>
      </div>
    </div>

    <!-- ── CHURCH ASSESSMENTS SECTION ── -->
    <div class="section-divider">
      <span class="section-title">Church Assessments</span>
      <div class="section-line"></div>
      <span class="section-count" id="church-section-count">0</span>
    </div>
    <div id="churches-area"></div>

    <!-- ── LEADER ASSESSMENT LIST SECTION ── -->
    <div class="section-divider" style="margin-top:52px;">
      <span class="section-title">Leader Assessment List</span>
      <div class="section-line"></div>
      <span class="section-count" id="la-section-count">0</span>
    </div>
    <div style="display:flex;gap:14px;align-items:center;margin-bottom:20px;flex-wrap:wrap;">
      <div class="search-wrap">
        <svg class="search-icon" width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="11" cy="11" r="8"/><line x1="21" y1="21" x2="16.65" y2="16.65"/></svg>
        <input type="text" id="la-search" placeholder="Search assessments…" oninput="applyFilters()"/>
      </div>
      <select id="leader-filter" onchange="applyFilters()" style="max-width:260px;">
        <option value="">All Leaders</option>
      </select>
      <span id="la-count" style="font-size:13px;color:var(--text-muted);margin-left:auto;"></span>
    </div>
    <div class="table-wrap">
      <table class="main-table">
        <thead><tr id="la-table-header"></tr></thead>
        <tbody id="la-table-body"></tbody>
      </table>
    </div>

  </div><!-- end state-data -->
</div><!-- end container -->

<footer>
  <div>© PSWC · Church Assessments Portal</div>
  <div id="footer-user"></div>
</footer>

<button id="debug-toggle" onclick="toggleDebug()">🔧 Debug</button>
<div id="debug-panel"></div>

<script>
// ─────────────────────────────────────────────────────────────────────────────
// CONFIG — update list/field names if they differ on PSWCTEST
// ─────────────────────────────────────────────────────────────────────────────
const SITE              = 'https://pswconf.sharepoint.com/sites/PSWCTEST';
const AFFILIATES_LIST   = 'Affiliates';
const LEADERS_LIST      = 'Leaders';
const CHURCH_LIST       = 'ChurchAssessments';
const LA_LIST           = 'LeaderAssessments';

// Field linking Leaders → Affiliates (internal name)
const LEADER_AFF_FIELD  = 'AffiliateID';
// Field linking ChurchAssessments → Affiliates
const CHURCH_AFF_FIELD  = 'AffiliateID';
// Field linking LeaderAssessments → Leaders
const LA_LEADER_FIELD   = 'LeaderID';
// Field linking LeaderAssessments → Affiliates (may be derived or direct)
const LA_AFF_FIELD      = 'AffiliateID';

// Church Assessment columns shown in expanded card body
const CHURCH_BODY_FIELDS = [
  { field: 'Status',         label: 'Status'          },
  { field: 'Score',          label: 'Score'            },
  { field: 'MoralScore',     label: 'Moral'            },
  { field: 'FinancialScore', label: 'Financial'        },
  { field: 'PSWCScore',      label: 'PSWC'             },
  { field: 'MissionalFocus', label: 'Missional Focus'  },
  { field: 'Notes',          label: 'Notes'            },
  { field: 'AssessedDate',   label: 'Assessed Date'    },
];

// Leader Assessment table columns
const LA_COLS = [
  { field: 'Title',          label: 'Assessment'  },
  { field: LA_LEADER_FIELD,  label: 'Leader'      },
  { field: LA_AFF_FIELD,     label: 'Affiliate'   },
  { field: 'Score',          label: 'Score'       },
  { field: 'Status',         label: 'Status'      },
  { field: 'Date',           label: 'Date'        },
  { field: 'Notes',          label: 'Notes'       },
];

// ─────────────────────────────────────────────────────────────────────────────
// STATE
// ─────────────────────────────────────────────────────────────────────────────
let allChurches         = [];
let allLeaderAssessments= [];
let allLeaders          = [];
let affiliateMap        = {};   // id → name
let leaderMap           = {};   // id → { name, affiliateId }
let laSort = { col: null, asc: true };

// ─────────────────────────────────────────────────────────────────────────────
// DEBUG
// ─────────────────────────────────────────────────────────────────────────────
function dbg(msg, type='info') {
  const p = document.getElementById('debug-panel');
  const d = document.createElement('div');
  d.className = 'd-' + type;
  d.textContent = '[' + new Date().toLocaleTimeString() + '] ' + msg;
  p.appendChild(d);
  p.scrollTop = p.scrollHeight;
  console.log('[DBG]', msg);
}
function toggleDebug() { document.getElementById('debug-panel').classList.toggle('open'); }

// ─────────────────────────────────────────────────────────────────────────────
// SHAREPOINT REST
// ─────────────────────────────────────────────────────────────────────────────
async function spGet(path) {
  const url = SITE + '/_api' + path;
  dbg('GET ' + url);
  const res = await fetch(url, {
    credentials: 'include',
    headers: {
      'Accept': 'application/json;odata=nometadata',
      'X-Requested-With': 'XMLHttpRequest',
    }
  });
  dbg('→ ' + res.status + ' ' + res.statusText, res.ok ? 'ok' : 'err');
  if (res.status === 401 || res.status === 403) throw new Error('NOT_AUTHENTICATED');
  if (!res.ok) {
    const t = await res.text();
    dbg('Body: ' + t.slice(0, 400), 'err');
    throw new Error('API ' + res.status + ': ' + res.statusText);
  }
  return res.json();
}

// ─────────────────────────────────────────────────────────────────────────────
// LOAD
// ─────────────────────────────────────────────────────────────────────────────
async function loadData() {
  showState('loading');
  hideError();

  try {
    // Current user
    try {
      const me = await spGet('/web/currentuser?$select=Title,Email');
      document.getElementById('footer-user').textContent = 'Signed in as ' + (me.Title || me.Email || '');
      dbg('User: ' + (me.Title || me.Email), 'ok');
    } catch(e) { dbg('User fetch failed: ' + e.message, 'warn'); }

    // Affiliates
    try {
      const d = await spGet(`/web/lists/getbytitle('${AFFILIATES_LIST}')/items?$select=ID,Title&$top=5000&$orderby=Title`);
      affiliateMap = {};
      (d.value || []).forEach(a => { affiliateMap[a.ID] = a.Title; });
      dbg('Affiliates loaded: ' + (d.value || []).length, 'ok');
    } catch(e) {
      dbg('Affiliates failed: ' + e.message, 'warn');
    }

    // Leaders
    try {
      const d = await spGet(`/web/lists/getbytitle('${LEADERS_LIST}')/items?$select=ID,Title,${LEADER_AFF_FIELD}&$top=5000&$orderby=Title`);
      leaderMap = {};
      (d.value || []).forEach(l => {
        leaderMap[l.ID] = { name: l.Title, affiliateId: l[LEADER_AFF_FIELD] };
      });
      allLeaders = d.value || [];
      dbg('Leaders loaded: ' + allLeaders.length, 'ok');
    } catch(e) {
      dbg('Leaders failed: ' + e.message, 'warn');
    }

    // Church Assessments
    const churchFields = [...new Set([
      'ID', 'Title', CHURCH_AFF_FIELD,
      ...CHURCH_BODY_FIELDS.map(f => f.field)
    ])].join(',');
    try {
      const d = await spGet(`/web/lists/getbytitle('${CHURCH_LIST}')/items?$select=${churchFields}&$top=5000&$orderby=Title`);
      allChurches = d.value || [];
      dbg('Church Assessments loaded: ' + allChurches.length, 'ok');
    } catch(e) {
      dbg('ChurchAssessments failed: ' + e.message, 'warn');
      allChurches = [];
    }

    // Leader Assessments
    const laFields = [...new Set([
      'ID', ...LA_COLS.map(c => c.field), 'ChurchAssessmentID'
    ])].join(',');
    try {
      const d = await spGet(`/web/lists/getbytitle('${LA_LIST}')/items?$select=${laFields}&$top=5000&$orderby=Title`);
      allLeaderAssessments = d.value || [];
      dbg('Leader Assessments loaded: ' + allLeaderAssessments.length, 'ok');
    } catch(e) {
      dbg('LeaderAssessments failed: ' + e.message, 'warn');
      allLeaderAssessments = [];
    }

    // Build UI
    buildAffiliateFilter();
    buildLeaderFilter();
    buildLAHeader();
    applyFilters();

    document.getElementById('stat-affiliates').textContent = Object.keys(affiliateMap).length || '—';
    document.getElementById('last-updated').textContent = 'Updated ' + new Date().toLocaleTimeString();
    showState('data');

  } catch(e) {
    dbg('loadData error: ' + e.message, 'err');
    showState('error');
    if (e.message === 'NOT_AUTHENTICATED') {
      showError(
        '⚠ Not authenticated.\n\n' +
        'This file must be opened directly from SharePoint — not from a local path.\n\n' +
        'Steps:\n' +
        '1. Upload AffiliateReport.aspx to your SharePoint Documents library\n' +
        '2. Navigate to the file within SharePoint\n' +
        '3. Open it — your SharePoint session will authenticate automatically.'
      );
    } else {
      showError(
        '⚠ Failed to load: ' + e.message + '\n\n' +
        'Click 🔧 Debug for details.\n\n' +
        'Common fixes:\n' +
        '• List names must match exactly (case-sensitive):\n' +
        '  Affiliates · Leaders · ChurchAssessments · LeaderAssessments\n' +
        '• Field internal names: AffiliateID · LeaderID (update CONFIG at top of script)\n' +
        '• File must be hosted on SharePoint, not opened locally'
      );
    }
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// FILTERS
// ─────────────────────────────────────────────────────────────────────────────
function buildAffiliateFilter() {
  const sel = document.getElementById('affiliate-filter');
  sel.innerHTML = '<option value="">All Affiliates</option>';
  Object.entries(affiliateMap)
    .sort((a, b) => a[1].localeCompare(b[1]))
    .forEach(([id, name]) => {
      const o = document.createElement('option');
      o.value = id;
      o.textContent = name;
      sel.appendChild(o);
    });
}

function buildLeaderFilter() {
  const sel = document.getElementById('leader-filter');
  sel.innerHTML = '<option value="">All Leaders</option>';
  allLeaders
    .sort((a, b) => (a.Title || '').localeCompare(b.Title || ''))
    .forEach(l => {
      const o = document.createElement('option');
      o.value = l.ID;
      o.textContent = l.Title || ('Leader ' + l.ID);
      sel.appendChild(o);
    });
}

function applyFilters() {
  const affId    = document.getElementById('affiliate-filter').value;
  const leaderId = document.getElementById('leader-filter').value;
  const laSearch = document.getElementById('la-search').value.trim().toLowerCase();

  // Filter Church Assessments
  const filteredChurches = allChurches.filter(c =>
    !affId || String(c[CHURCH_AFF_FIELD] || '') === affId
  );

  // Filter Leader Assessments by affiliate and optional leader/search
  const filteredLA = allLeaderAssessments.filter(la => {
    // Resolve affiliate of this assessment
    let laAffId = la[LA_AFF_FIELD];
    if (!laAffId && la[LA_LEADER_FIELD]) {
      const ldr = leaderMap[la[LA_LEADER_FIELD]];
      if (ldr) laAffId = ldr.affiliateId;
    }
    const matchAff    = !affId    || String(laAffId || '') === affId;
    const matchLeader = !leaderId || String(la[LA_LEADER_FIELD] || '') === leaderId;
    const laName      = (la.Title || '').toLowerCase();
    const leaderName  = (leaderMap[la[LA_LEADER_FIELD]]?.name || '').toLowerCase();
    const matchSearch = !laSearch || laName.includes(laSearch) || leaderName.includes(laSearch);
    return matchAff && matchLeader && matchSearch;
  });

  // Filter leaders for stat counting
  const filteredLeaderIds = new Set(filteredLA.map(la => la[LA_LEADER_FIELD]).filter(Boolean));

  // Update stats
  document.getElementById('stat-churches').textContent  = filteredChurches.length + ' / ' + allChurches.length;
  document.getElementById('stat-leaders').textContent   = filteredLeaderIds.size + ' / ' + allLeaders.length;
  document.getElementById('stat-la').textContent        = filteredLA.length + ' / ' + allLeaderAssessments.length;
  document.getElementById('church-section-count').textContent = filteredChurches.length + ' church' + (filteredChurches.length !== 1 ? 'es' : '');
  document.getElementById('la-section-count').textContent     = filteredLA.length + ' assessment' + (filteredLA.length !== 1 ? 's' : '');
  document.getElementById('result-summary').textContent  =
    affId ? (affiliateMap[affId] || 'Affiliate ' + affId) : 'All Affiliates';
  document.getElementById('la-count').textContent = filteredLA.length + ' of ' + allLeaderAssessments.length + ' assessments';

  renderChurches(filteredChurches);
  renderLATable(filteredLA);
}

// ─────────────────────────────────────────────────────────────────────────────
// CHURCH CARDS
// ─────────────────────────────────────────────────────────────────────────────
function renderChurches(churches) {
  const area = document.getElementById('churches-area');
  area.innerHTML = '';

  if (!churches.length) {
    area.innerHTML = '<div style="text-align:center;padding:60px 20px;color:var(--text-muted);font-style:italic;">No church assessments match the selected affiliate.</div>';
    return;
  }

  churches.forEach(church => {
    const affName = affiliateMap[church[CHURCH_AFF_FIELD]] || church[CHURCH_AFF_FIELD] || '—';

    // Linked leader assessments
    const linked = allLeaderAssessments.filter(la => {
      let laAffId = la[LA_AFF_FIELD];
      if (!laAffId && la[LA_LEADER_FIELD]) {
        const ldr = leaderMap[la[LA_LEADER_FIELD]];
        if (ldr) laAffId = ldr.affiliateId;
      }
      return la.ChurchAssessmentID === church.ID || laAffId === church[CHURCH_AFF_FIELD];
    });

    const card = document.createElement('div');
    card.className = 'church-card';

    // Header
    const hdr = document.createElement('div');
    hdr.className = 'church-card-header';
    hdr.innerHTML = `
      <div class="ch-left">
        <div class="church-name">${esc(church.Title || 'Unnamed Church')}</div>
        <div class="church-meta">
          <span class="badge">${esc(affName)}</span>
          ${church.Status ? `<span class="badge badge-gold">${esc(church.Status)}</span>` : ''}
          ${church.Score !== undefined && church.Score !== null ? `<span class="meta-text">Score: <strong>${esc(String(church.Score))}</strong></span>` : ''}
        </div>
      </div>
      <div class="ch-right">
        <span style="font-size:12px;color:var(--text-muted);">${linked.length} leader assessment${linked.length !== 1 ? 's' : ''}</span>
        <span class="toggle-icon">▼</span>
      </div>`;
    hdr.onclick = () => card.classList.toggle('expanded');

    // Body
    const body = document.createElement('div');
    body.className = 'church-card-body';

    // Field grid
    const showFields = CHURCH_BODY_FIELDS.filter(f => f.field !== 'Title' && f.field !== CHURCH_AFF_FIELD);
    const hasFields  = showFields.some(f => church[f.field] !== undefined && church[f.field] !== null && church[f.field] !== '');
    if (hasFields) {
      const fg = document.createElement('div');
      fg.className = 'church-fields';
      showFields.forEach(f => {
        const val = church[f.field];
        if (val === undefined || val === null || val === '') return;
        fg.innerHTML += `<div class="field-item"><div class="field-label">${esc(f.label)}</div><div class="field-value">${esc(String(val))}</div></div>`;
      });
      body.appendChild(fg);
    }

    // Leader assessments sub-table
    const sub = document.createElement('div');
    sub.className = 'sub-section';
    sub.innerHTML = `<div class="sub-header"><span class="sub-title">Leader Assessments</span><span class="sub-count">${linked.length}</span></div>`;

    if (!linked.length) {
      sub.innerHTML += '<div class="no-sub">No leader assessments linked to this church assessment.</div>';
    } else {
      const tw = document.createElement('div');
      tw.className = 'sub-table-wrap';
      const tbl = document.createElement('table');
      tbl.className = 'sub-table';

      // sub thead
      const thead = document.createElement('thead');
      const hrow  = document.createElement('tr');
      LA_COLS.forEach(col => {
        const th = document.createElement('th');
        th.textContent = col.label;
        hrow.appendChild(th);
      });
      thead.appendChild(hrow);
      tbl.appendChild(thead);

      // sub tbody
      const tbody = document.createElement('tbody');
      linked.forEach(la => {
        const tr = document.createElement('tr');
        LA_COLS.forEach(col => {
          const td = document.createElement('td');
          td.textContent = resolveLAVal(la, col);
          tr.appendChild(td);
        });
        tbody.appendChild(tr);
      });
      tbl.appendChild(tbody);
      tw.appendChild(tbl);
      sub.appendChild(tw);
    }

    body.appendChild(sub);
    card.appendChild(hdr);
    card.appendChild(body);
    area.appendChild(card);
  });
}

// ─────────────────────────────────────────────────────────────────────────────
// LEADER ASSESSMENT TABLE
// ─────────────────────────────────────────────────────────────────────────────
function buildLAHeader() {
  const tr = document.getElementById('la-table-header');
  tr.innerHTML = '';
  LA_COLS.forEach((col, i) => {
    const th = document.createElement('th');
    th.innerHTML = col.label + ' <span style="opacity:0.5">↕</span>';
    th.onclick = () => sortLABy(i);
    tr.appendChild(th);
  });
}

function sortLABy(i) {
  laSort.asc = laSort.col === i ? !laSort.asc : true;
  laSort.col = i;
  document.querySelectorAll('#la-table-header th').forEach((th, idx) => {
    th.classList.toggle('sorted', idx === i);
    const sp = th.querySelector('span');
    if (sp) sp.textContent = idx === i ? (laSort.asc ? ' ↑' : ' ↓') : ' ↕';
  });
  applyFilters();
}

function resolveLAVal(la, col) {
  if (col.field === LA_LEADER_FIELD) {
    const l = leaderMap[la[col.field]];
    return l ? l.name : (la[col.field] || '—');
  }
  if (col.field === LA_AFF_FIELD) {
    let affId = la[col.field];
    if (!affId && la[LA_LEADER_FIELD]) {
      const l = leaderMap[la[LA_LEADER_FIELD]];
      if (l) affId = l.affiliateId;
    }
    return affiliateMap[affId] || affId || '—';
  }
  const v = la[col.field];
  return (v === undefined || v === null || v === '') ? '—' : String(v);
}

function renderLATable(rows) {
  // Apply sort
  if (laSort.col !== null) {
    const col = LA_COLS[laSort.col];
    rows = [...rows].sort((a, b) => {
      const va = resolveLAVal(a, col).toLowerCase();
      const vb = resolveLAVal(b, col).toLowerCase();
      return laSort.asc ? va.localeCompare(vb) : vb.localeCompare(va);
    });
  }

  const tb = document.getElementById('la-table-body');
  tb.innerHTML = '';

  if (!rows.length) {
    const tr = document.createElement('tr');
    tr.className = 'empty-row';
    tr.innerHTML = `<td colspan="${LA_COLS.length}">No leader assessments match your filters.</td>`;
    tb.appendChild(tr);
    return;
  }

  rows.forEach(la => {
    const tr = document.createElement('tr');
    LA_COLS.forEach((col, i) => {
      const td = document.createElement('td');
      const val = resolveLAVal(la, col);
      if (i === 0) {
        td.innerHTML = `<span class="cell-bold">${esc(val)}</span>`;
      } else if (col.field === LA_LEADER_FIELD || col.field === LA_AFF_FIELD) {
        td.innerHTML = val !== '—'
          ? `<span class="badge">${esc(val)}</span>`
          : `<span style="color:var(--text-muted)">—</span>`;
      } else {
        td.textContent = val;
      }
      tr.appendChild(td);
    });
    tb.appendChild(tr);
  });
}

// ─────────────────────────────────────────────────────────────────────────────
// UTILS
// ─────────────────────────────────────────────────────────────────────────────
function showState(s) {
  document.getElementById('state-loading').style.display = s === 'loading' ? 'block' : 'none';
  document.getElementById('state-data').style.display    = s === 'data'    ? 'block' : 'none';
}
function showError(m) { const e = document.getElementById('state-error'); e.style.display = 'block'; e.textContent = m; }
function hideError()  { document.getElementById('state-error').style.display = 'none'; }
function esc(s) {
  return String(s)
    .replace(/&/g, '&amp;')
    .replace(/</g, '&lt;')
    .replace(/>/g, '&gt;')
    .replace(/"/g, '&quot;');
}

// ─────────────────────────────────────────────────────────────────────────────
// INIT
// ─────────────────────────────────────────────────────────────────────────────
dbg('AffiliateReport loaded from: ' + window.location.href);
loadData();
</script>
</body>
</html>
