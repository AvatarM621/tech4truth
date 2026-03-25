<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Affiliate Report — PSWC Church Assessments</title>
  <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;600;700&family=Crimson+Pro:ital,wght@0,300;0,400;0,600;1,300&display=swap" rel="stylesheet"/>
  <style>
    :root {
      --navy:#1a3a6b; --navy-light:#2a52a0; --navy-dim:#3a6abf;
      --bg:#ffffff; --panel:#f4f6fa;
      --border:rgba(26,58,107,0.15); --text:#111111;
      --text-muted:#555e70; --radius:8px;
    }
    *{ box-sizing:border-box; margin:0; padding:0; }
    body{ font-family:'Crimson Pro',Georgia,serif; background:var(--bg); color:var(--text); min-height:100vh; }

    /* NAV */
    nav{ position:sticky; top:0; z-index:100; background:var(--navy); box-shadow:0 2px 12px rgba(26,58,107,0.2); display:flex; align-items:center; padding:0 24px; height:52px; gap:4px; }
    .nav-brand{ font-family:'Cinzel',serif; font-size:13px; font-weight:700; color:#fff; letter-spacing:0.08em; margin-right:20px; }
    .nav-brand span{ font-weight:400; opacity:0.65; font-size:10px; display:block; letter-spacing:0.14em; }
    .nav-divider{ width:1px; height:20px; background:rgba(255,255,255,0.15); margin:0 6px; }
    .nav-link{ font-family:'Cinzel',serif; font-size:11px; letter-spacing:0.1em; color:rgba(255,255,255,0.7); text-decoration:none; padding:7px 14px; border-radius:4px; transition:all 0.15s; }
    .nav-link:hover{ background:rgba(255,255,255,0.12); color:#fff; }
    .nav-link.active{ background:rgba(255,255,255,0.18); color:#fff; }

    /* PAGE HEADER */
    .page-header{ padding:28px 24px 20px; border-bottom:1px solid var(--border); display:flex; align-items:flex-end; justify-content:space-between; flex-wrap:wrap; gap:12px; }
    .eyebrow{ font-family:'Cinzel',serif; font-size:9px; letter-spacing:0.3em; color:var(--navy-dim); text-transform:uppercase; margin-bottom:6px; }
    h1{ font-family:'Cinzel',serif; font-size:clamp(18px,2.5vw,26px); font-weight:700; color:var(--navy); }
    h1 span{ display:block; font-size:0.5em; font-weight:400; color:var(--text-muted); margin-top:3px; }
    .header-meta{ font-size:12px; color:var(--text-muted); text-align:right; }
    #last-updated{ color:var(--navy-dim); font-style:italic; }

    /* MAIN SPLIT LAYOUT */
    .report-layout{ display:flex; height:calc(100vh - 130px); min-height:500px; }

    /* LEFT PANEL — Affiliates list */
    .left-panel{ width:280px; flex-shrink:0; border-right:1px solid var(--border); display:flex; flex-direction:column; background:var(--panel); }
    .left-panel-header{ padding:14px 16px 10px; border-bottom:1px solid var(--border); }
    .panel-title{ font-family:'Cinzel',serif; font-size:11px; letter-spacing:0.18em; text-transform:uppercase; color:var(--navy); margin-bottom:8px; }
    .search-box{ position:relative; }
    .search-box input{ width:100%; padding:7px 10px 7px 30px; border:1px solid var(--border); border-radius:6px; font-family:'Crimson Pro',serif; font-size:14px; background:#fff; outline:none; transition:border-color 0.2s; }
    .search-box input:focus{ border-color:var(--navy-dim); }
    .search-box svg{ position:absolute; left:9px; top:50%; transform:translateY(-50%); color:var(--text-muted); pointer-events:none; }
    .affiliate-list{ flex:1; overflow-y:auto; padding:6px 0; }
    .affiliate-item{ padding:9px 16px; font-size:14px; cursor:pointer; transition:background 0.12s; border-radius:0; }
    .affiliate-item:hover{ background:rgba(26,58,107,0.06); }
    .affiliate-item.selected{ background:rgba(26,58,107,0.12); color:var(--navy); font-weight:600; border-left:3px solid var(--navy); padding-left:13px; }

    /* RIGHT PANEL */
    .right-panel{ flex:1; overflow-y:auto; display:flex; flex-direction:column; }

    /* SECTION BLOCKS */
    .section-block{ padding:20px 24px; border-bottom:1px solid var(--border); }
    .section-block:last-child{ border-bottom:none; }
    .section-heading{ font-family:'Cinzel',serif; font-size:12px; letter-spacing:0.2em; text-transform:uppercase; color:var(--navy); margin-bottom:14px; display:flex; align-items:center; gap:10px; }
    .section-heading .count-badge{ background:var(--navy); color:#fff; border-radius:10px; padding:1px 8px; font-size:10px; font-family:'Cinzel',serif; }

    /* TABLES */
    .data-table-wrap{ border:1px solid var(--border); border-radius:var(--radius); overflow:hidden; }
    .data-table{ width:100%; border-collapse:collapse; font-size:14px; }
    .data-table thead{ background:rgba(26,58,107,0.06); border-bottom:1px solid var(--border); }
    .data-table th{ font-family:'Cinzel',serif; font-size:9px; letter-spacing:0.18em; color:var(--navy-dim); text-transform:uppercase; padding:9px 14px; text-align:center; white-space:nowrap; cursor:pointer; user-select:none; }
    .data-table th:first-child{ text-align:center; }
    .data-table th:hover,.data-table th.sorted{ color:var(--navy); }
    .data-table tbody tr{ border-bottom:1px solid rgba(26,58,107,0.07); transition:background 0.12s; }
    .data-table tbody tr:last-child{ border-bottom:none; }
    .data-table tbody tr:hover{ background:rgba(26,58,107,0.04); }
    .data-table td{ padding:8px 14px; text-align:center; vertical-align:middle; }
    .data-table td:first-child{ text-align:center; font-weight:600; }
    .data-table td.text-col{ text-align:left; font-weight:normal; }
    .empty-msg{ text-align:center; padding:32px; color:var(--text-muted); font-style:italic; font-size:14px; }
    .stars{ color:#c8a85a; letter-spacing:1px; font-size:15px; white-space:nowrap; }
    .stars .empty-star{ color:#d0d4dd; }
    .na{ color:var(--text-muted); font-style:italic; font-size:12px; }

    /* STATES */
    #state-loading{ display:flex; flex-direction:column; align-items:center; justify-content:center; height:300px; color:var(--text-muted); gap:12px; }
    .spinner{ width:32px; height:32px; border:2px solid var(--border); border-top-color:var(--navy); border-radius:50%; animation:spin 0.8s linear infinite; }
    @keyframes spin{ to{ transform:rotate(360deg); } }
    #state-error{ display:none; margin:24px; background:rgba(180,60,60,0.08); border:1px solid rgba(180,60,60,0.2); border-radius:var(--radius); padding:18px 22px; color:#cc3333; font-size:14px; line-height:1.6; white-space:pre-wrap; }
    #state-data{ display:none; flex:1; }
    .report-layout{ display:none; }
    .report-layout.visible{ display:flex; }

    /* FOOTER */
    footer{ padding:14px 24px; border-top:1px solid var(--border); display:flex; justify-content:space-between; font-size:11px; color:var(--text-muted); }

    /* DEBUG */
    #debug-toggle{ position:fixed; bottom:0; right:16px; z-index:10000; background:var(--navy); color:#fff; border:none; padding:4px 12px; font-size:11px; font-family:monospace; cursor:pointer; border-radius:4px 4px 0 0; }
    #debug-panel{ display:none; position:fixed; bottom:0; left:0; right:0; background:#0d1320; border-top:2px solid var(--navy); padding:8px 14px; font-family:monospace; font-size:11px; color:#ccc; max-height:200px; overflow-y:auto; z-index:9999; }
    #debug-panel.open{ display:block; }
    .d-err{color:#ff7070} .d-ok{color:#70ffb0} .d-info{color:#70c5ff} .d-warn{color:#ffd070}

    @media(max-width:700px){
      .left-panel{ width:220px; }
      .data-table{ font-size:12px; }
    }
  </style>
</head>
<body>

<nav>
  <div class="nav-brand">PSWC <span>Church Assessments</span></div>
  <div class="nav-divider"></div>
  <a href="https://pswconf.sharepoint.com/sites/ChurchAssessment" class="nav-link">Home</a>
  <a href="AffiliateReport.aspx" class="nav-link active">Affiliate Report</a>
</nav>

<div class="page-header">
  <div>
    <div class="eyebrow">PSWC &middot; Church Assessments</div>
    <h1>Affiliate Report <span>Church &amp; Leader Assessments filtered by Affiliate</span></h1>
  </div>
  <div class="header-meta">
    <div id="last-updated">-</div>
    <div style="margin-top:3px;">Live from SharePoint</div>
  </div>
</div>

<div id="state-error"></div>

<div id="state-loading">
  <div class="spinner"></div>
  <div style="font-family:'Cinzel',serif;font-size:12px;letter-spacing:0.12em;">Loading data…</div>
</div>

<div class="report-layout" id="report-layout">

  <!-- LEFT: Affiliates -->
  <div class="left-panel">
    <div class="left-panel-header">
      <div class="panel-title">Affiliates</div>
      <div class="search-box">
        <svg width="13" height="13" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="11" cy="11" r="8"/><line x1="21" y1="21" x2="16.65" y2="16.65"/></svg>
        <input type="text" id="aff-search" placeholder="Search…" oninput="filterAffList()"/>
      </div>
    </div>
    <div class="affiliate-list" id="affiliate-list"></div>
  </div>

  <!-- RIGHT: Tables -->
  <div class="right-panel" id="right-panel">

    <!-- Church Assessment -->
    <div class="section-block">
      <div class="section-heading">
        Church Assessment
        <span class="count-badge" id="church-count">0</span>
      </div>
      <div class="data-table-wrap">
        <table class="data-table" id="church-table">
          <thead>
            <tr>
              <th onclick="sortTable('church',0)">Financial <span>↕</span></th>
              <th onclick="sortTable('church',1)">Leaders <span>↕</span></th>
              <th onclick="sortTable('church',2)">PSWC <span>↕</span></th>
              <th onclick="sortTable('church',3)">Moral <span>↕</span></th>
            </tr>
          </thead>
          <tbody id="church-tbody"></tbody>
        </table>
      </div>
    </div>

    <!-- Leader Assessment -->
    <div class="section-block">
      <div class="section-heading">
        Leader Assessment
        <span class="count-badge" id="la-count">0</span>
      </div>
      <div class="data-table-wrap">
        <table class="data-table" id="la-table">
          <thead>
            <tr>
              <th onclick="sortTable('la',0)">Leader <span>↕</span></th>
              <th onclick="sortTable('la',1)">Preachteach <span>↕</span></th>
              <th onclick="sortTable('la',2)">Catalytic <span>↕</span></th>
              <th onclick="sortTable('la',3)">Coaching Openness <span>↕</span></th>
              <th onclick="sortTable('la',4)">Evangelism <span>↕</span></th>
              <th onclick="sortTable('la',5)" class="text-col">Profile 1 <span>↕</span></th>
              <th onclick="sortTable('la',6)" class="text-col">Profile 2 <span>↕</span></th>
            </tr>
          </thead>
          <tbody id="la-tbody"></tbody>
        </table>
      </div>
    </div>

  </div>
</div>

<footer>
  <div>© PSWC &middot; Church Assessments Portal</div>
  <div id="footer-user"></div>
</footer>

<button id="debug-toggle" onclick="toggleDebug()">🔧 Debug</button>
<div id="debug-panel"></div>

<script>
// ─────────────────────────────────────────────────────────────────────────────
// CONFIG
// ─────────────────────────────────────────────────────────────────────────────
const SITE            = 'https://pswconf.sharepoint.com/sites/ChurchAssessment';
const AFFILIATES_LIST = 'Affiliates';
const LEADERS_LIST    = 'Leaders';
const CHURCH_LIST     = 'ChurchAssessments';
const LA_LIST         = 'LeaderAssessments';

// RELATIONSHIPS (all joins on plain text fields — not SP lookup IDs)
//   ChurchAssessments.AffiliateID  ──►  Affiliates.AffiliateID
//   LeaderAssessments.AccountID    ──►  Leaders.AccountID
//   Leaders.AffiliateID            ──►  Affiliates.AffiliateID

const AFF_KEY       = 'AffiliateID';  // key on Affiliates
const CHURCH_AFF    = 'AffiliateID';  // ChurchAssessments → Affiliates
const LEADER_AFF    = 'AffiliateID';  // Leaders → Affiliates
const LEADER_ACCT   = 'AccountID';    // key on Leaders
const LA_ACCT       = 'AccountID';    // LeaderAssessments → Leaders

// Church Assessment score fields
const CHURCH_FIELDS = [
  { field:'financial',  label:'Financial' },
  { field:'leaders',    label:'Leaders'   },
  { field:'pswc',       label:'PSWC'      },
  { field:'moral',      label:'Moral'     },
];

// Leader Assessment score fields
const LA_FIELDS = [
  { field:'preachteach',       label:'Preachteach'        },
  { field:'catalytic',         label:'Catalytic'          },
  { field:'coaching_openess',  label:'Coaching Openness'  },
  { field:'evangelism',        label:'Evangelism'         },
  { field:'Profile1',          label:'Profile 1', text:true },
  { field:'Profile2',          label:'Profile 2', text:true },
];

// ─────────────────────────────────────────────────────────────────────────────
// STATE
// ─────────────────────────────────────────────────────────────────────────────
let allAffiliates    = [];   // raw rows from Affiliates list
let allChurches      = [];   // raw rows from ChurchAssessments
let allLeaders       = [];   // raw rows from Leaders
let allLA            = [];   // raw rows from LeaderAssessments

// Maps keyed by natural-key value (plain string)
let affMap   = {};   // AffiliateID  → Title (affiliate name)
let leaderMap= {};   // AccountID    → { name, affiliateId }

let selectedAffId = '';  // currently selected AffiliateID value
let churchSort = { col:null, asc:true };
let laSort     = { col:null, asc:true };
let profileMap = {};  // SP row ID (string) → profile Title

// ─────────────────────────────────────────────────────────────────────────────
// DEBUG
// ─────────────────────────────────────────────────────────────────────────────
function dbg(msg, type='info') {
  const p = document.getElementById('debug-panel');
  const d = document.createElement('div');
  d.className = 'd-' + type;
  d.textContent = '[' + new Date().toLocaleTimeString() + '] ' + msg;
  p.appendChild(d); p.scrollTop = p.scrollHeight;
  console.log('[DBG]', msg);
}
function toggleDebug() { document.getElementById('debug-panel').classList.toggle('open'); }

function inspectRecord(label, rec) {
  if (!rec) return;
  dbg('── ' + label + ' ──', 'warn');
  Object.entries(rec).forEach(([k,v]) => {
    dbg('  ' + k + ' = ' + JSON.stringify(v).slice(0,100));
  });
}

// ─────────────────────────────────────────────────────────────────────────────
// SHAREPOINT FETCH
// ─────────────────────────────────────────────────────────────────────────────
async function spGet(path) {
  const url = SITE + '/_api' + path;
  dbg('GET ' + url);
  const res = await fetch(url, {
    credentials: 'include',
    headers: { 'Accept':'application/json;odata=nometadata', 'X-Requested-With':'XMLHttpRequest' }
  });
  dbg('→ ' + res.status, res.ok ? 'ok' : 'err');
  if (res.status === 401 || res.status === 403) throw new Error('NOT_AUTHENTICATED');
  if (!res.ok) { const t = await res.text(); throw new Error('HTTP ' + res.status + ': ' + t.slice(0,150)); }
  return res.json();
}

// Read a field value — handles plain string/number or SP lookup object
function fv(item, field) {
  const v = item[field];
  if (v === undefined || v === null || v === '') return '';
  if (typeof v === 'object') return String(v.ID ?? v.Value ?? v.Title ?? '');
  return String(v).trim();
}

// ─────────────────────────────────────────────────────────────────────────────
// LOAD
// ─────────────────────────────────────────────────────────────────────────────
async function loadData() {
  document.getElementById('state-loading').style.display = 'flex';
  document.getElementById('report-layout').classList.remove('visible');
  document.getElementById('state-error').style.display = 'none';

  try {
    // Current user
    try {
      const me = await spGet('/web/currentuser?$select=Title,Email');
      document.getElementById('footer-user').textContent = 'Signed in as ' + (me.Title || me.Email || '');
    } catch(e) { dbg('User: ' + e.message, 'warn'); }

    // ── Affiliates ────────────────────────────────────────────────────────
    {
      const d = await spGet(`/web/lists/getbytitle('${AFFILIATES_LIST}')/items?$top=1`);
      if (d.value?.[0]) inspectRecord('AFFILIATES sample', d.value[0]);
    }
    {
      const d = await spGet(`/web/lists/getbytitle('${AFFILIATES_LIST}')/items?$top=5000&$orderby=Title`);
      allAffiliates = d.value || [];
      affMap = {};
      allAffiliates.forEach(a => {
        const key = fv(a, AFF_KEY) || String(a.ID);
        affMap[key] = a.Title;
        // Also index by SP row ID as fallback
        affMap[String(a.ID)] = affMap[String(a.ID)] || a.Title;
      });
      dbg('Affiliates: ' + allAffiliates.length + ' loaded', 'ok');
    }

    // ── Leaders ───────────────────────────────────────────────────────────
    {
      const d = await spGet(`/web/lists/getbytitle('${LEADERS_LIST}')/items?$top=1`);
      if (d.value?.[0]) inspectRecord('LEADERS sample', d.value[0]);
    }
    {
      const d = await spGet(`/web/lists/getbytitle('${LEADERS_LIST}')/items?$top=5000&$orderby=Title`);
      allLeaders = d.value || [];
      leaderMap = {};
      allLeaders.forEach(l => {
        const acctKey = fv(l, LEADER_ACCT) || String(l.ID);
        const affId   = fv(l, LEADER_AFF);
        leaderMap[acctKey] = { name: l.Title, affiliateId: affId };
        leaderMap[String(l.ID)] = leaderMap[String(l.ID)] || { name: l.Title, affiliateId: affId };
      });
      dbg('Leaders: ' + allLeaders.length + ' loaded', 'ok');
    }

    // ── Church Assessments ────────────────────────────────────────────────
    {
      const d = await spGet(`/web/lists/getbytitle('${CHURCH_LIST}')/items?$top=1`);
      if (d.value?.[0]) inspectRecord('CHURCH_ASSESSMENTS sample', d.value[0]);
    }
    {
      const d = await spGet(`/web/lists/getbytitle('${CHURCH_LIST}')/items?$top=5000&$orderby=Title`);
      allChurches = d.value || [];
      dbg('ChurchAssessments: ' + allChurches.length + ' loaded', 'ok');
    }

    // ── PastorProfiles (lookup table) ─────────────────────────────────────────
    try {
      const d = await spGet(`/web/lists/getbytitle('PastorProfiles')/items?$select=ID,Title&$top=500`);
      profileMap = {};
      (d.value || []).forEach(p => { profileMap[String(p.ID)] = p.Title; });
      dbg('PastorProfiles: ' + (d.value || []).length + ' loaded', 'ok');
    } catch(e) { dbg('PastorProfiles load skipped: ' + e.message, 'warn'); }

    // ── Leader Assessments ────────────────────────────────────────────────
    {
      const d = await spGet(`/web/lists/getbytitle('${LA_LIST}')/items?$top=1`);
      if (d.value?.[0]) inspectRecord('LEADER_ASSESSMENTS sample', d.value[0]);
    }
    {
      const d = await spGet(`/web/lists/getbytitle('${LA_LIST}')/items?$top=5000&$orderby=Title`);
      allLA = d.value || [];
      dbg('LeaderAssessments: ' + allLA.length + ' loaded', 'ok');
    }

    document.getElementById('last-updated').textContent = 'Updated ' + new Date().toLocaleTimeString();
    document.getElementById('state-loading').style.display = 'none';
    document.getElementById('report-layout').classList.add('visible');

    buildAffList();
    renderTables();

  } catch(e) {
    dbg('ERROR: ' + e.message, 'err');
    document.getElementById('state-loading').style.display = 'none';
    const el = document.getElementById('state-error');
    el.style.display = 'block';
    if (e.message === 'NOT_AUTHENTICATED') {
      el.textContent = '⚠ Not authenticated.\n\nOpen this file directly from SharePoint — not locally.';
    } else {
      el.textContent = '⚠ Failed to load: ' + e.message + '\n\nSee 🔧 Debug panel for details.';
    }
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// AFFILIATES LIST (left panel)
// ─────────────────────────────────────────────────────────────────────────────
function buildAffList() {
  const container = document.getElementById('affiliate-list');
  container.innerHTML = '';

  // "All" option
  const all = document.createElement('div');
  all.className = 'affiliate-item' + (selectedAffId === '' ? ' selected' : '');
  all.textContent = 'All Affiliates';
  all.onclick = () => selectAffiliate('');
  container.appendChild(all);

  const query = document.getElementById('aff-search').value.trim().toLowerCase();

  allAffiliates
    .filter(a => !query || (a.Title || '').toLowerCase().includes(query))
    .forEach(a => {
      const affId = fv(a, AFF_KEY) || String(a.ID);
      const item = document.createElement('div');
      item.className = 'affiliate-item' + (selectedAffId === affId ? ' selected' : '');
      item.textContent = a.Title || affId;
      item.onclick = () => selectAffiliate(affId);
      container.appendChild(item);
    });
}

function filterAffList() { buildAffList(); }

function selectAffiliate(affId) {
  selectedAffId = affId;
  buildAffList();
  renderTables();
}

// ─────────────────────────────────────────────────────────────────────────────
// RENDER TABLES
// ─────────────────────────────────────────────────────────────────────────────
function renderTables() {
  // ── Filter Church Assessments by AffiliateID ──────────────────────────────
  let churches = allChurches.filter(c => {
    if (!selectedAffId) return true;
    return fv(c, CHURCH_AFF) === selectedAffId;
  });

  // ── Filter Leader Assessments via: LA.AccountID → Leader.AccountID → Leader.AffiliateID ──
  let las = allLA.filter(la => {
    if (!selectedAffId) return true;
    const acctKey = fv(la, LA_ACCT);
    const ldr     = leaderMap[acctKey];
    if (!ldr) return false;
    return ldr.affiliateId === selectedAffId;
  });

  // Apply sorts
  if (churchSort.col !== null) churches = sortRows(churches, churchSort, churchRowValues);
  if (laSort.col !== null)     las      = sortRows(las, laSort, laRowValues);

  // Update counts
  document.getElementById('church-count').textContent = churches.length;
  document.getElementById('la-count').textContent     = las.length;

  renderChurchTable(churches);
  renderLATable(las);
}

function churchRowValues(c) {
  return [
    fv(c, 'financial'),
    fv(c, 'leaders'),
    fv(c, 'pswc'),
    fv(c, 'moral'),
  ];
}

function laRowValues(la) {
  const acctKey = fv(la, LA_ACCT);
  const ldr     = leaderMap[acctKey];
  return [
    ldr ? ldr.name : (la.Title || acctKey || ''),
    fv(la, 'preachteach'),
    fv(la, 'catalytic'),
    fv(la, 'coaching_openess'),
    fv(la, 'evangelism'),
    lookupTitle(la, 'Profile1'),
    lookupTitle(la, 'Profile2'),
  ];
}

// Resolve a numeric ID field to its PastorProfiles Title via profileMap.
// Tries the exact field name first, then common SP internal name variants.
// Logs all field keys on the first call to help diagnose wrong field names.
let _profileFieldsLogged = false;
function lookupTitle(item, field) {
  // On first call, log every key in the item so we can see real field names
  if (!_profileFieldsLogged) {
    _profileFieldsLogged = true;
    dbg('LA item keys: ' + Object.keys(item).join(', '), 'warn');
  }

  // Try the exact field name, then common SP suffix variants
  const candidates = [
    field,
    field + 'Id',          // SP lookup ID suffix
    field + '0',           // SP sometimes appends 0 on conflict
    field.replace(/(\d+)$/, (m, n) => String(Number(n))), // normalise number
  ];

  let raw = null;
  for (const key of candidates) {
    const v = item[key];
    if (v !== null && v !== undefined && v !== '') { raw = v; break; }
  }

  if (raw === null || raw === undefined || raw === '') return '';
  // If it's an object (lookup), extract ID or Title directly
  if (typeof raw === 'object') {
    const title = raw.Title || raw.Value;
    if (title) return title;
    raw = raw.ID ?? raw.Id ?? raw;
  }
  const id = String(raw).trim();
  if (!id || id === '0') return '';
  return profileMap[id] || id;
}

function sortRows(rows, sortState, valFn) {
  return [...rows].sort((a, b) => {
    const va = valFn(a)[sortState.col];
    const vb = valFn(b)[sortState.col];
    const na = parseFloat(va), nb = parseFloat(vb);
    const numCompare = !isNaN(na) && !isNaN(nb) ? na - nb : String(va).localeCompare(String(vb));
    return sortState.asc ? numCompare : -numCompare;
  });
}

// ─────────────────────────────────────────────────────────────────────────────
// STAR RATING HELPER
// Converts a numeric score (1-5 scale) to filled/empty stars.
// Value of -1 or blank = N/A
// ─────────────────────────────────────────────────────────────────────────────
function stars(val) {
  if (val === '' || val === null || val === undefined) return '';
  const num = parseFloat(val);
  if (isNaN(num)) return val; // return text as-is (e.g. Profile1/Profile2)
  if (num === -1) return '<span class="na">N/A</span>';
  const filled = Math.round(Math.min(Math.max(num, 0), 5));
  const empty  = 5 - filled;
  return '<span class="stars">'
    + '&#9733;'.repeat(filled)
    + '<span class="empty-star">' + '&#9733;'.repeat(empty) + '</span>'
    + '</span>';
}

function renderChurchTable(churches) {
  const tb = document.getElementById('church-tbody');
  tb.innerHTML = '';
  if (!churches.length) {
    tb.innerHTML = `<tr><td colspan="4" class="empty-msg">No church assessments for this affiliate.</td></tr>`;
    return;
  }
  churches.forEach(c => {
    const tr = document.createElement('tr');
    const vals = churchRowValues(c);
    vals.forEach((v, i) => {
      const td = document.createElement('td');
      td.style.textAlign = 'center';
      td.innerHTML = stars(v);
      tr.appendChild(td);
    });
    tb.appendChild(tr);
  });
}

function renderLATable(las) {
  const tb = document.getElementById('la-tbody');
  tb.innerHTML = '';
  if (!las.length) {
    tb.innerHTML = `<tr><td colspan="7" class="empty-msg">No leader assessments for this affiliate.</td></tr>`;
    return;
  }
  las.forEach(la => {
    const tr = document.createElement('tr');
    const vals = laRowValues(la);
    vals.forEach((v, i) => {
      const td = document.createElement('td');
      td.style.textAlign = 'center';
      // Leader name (col 0) and Profile cols (5,6) are text — no stars
      if (i === 0 || i >= 5) {
        td.textContent = v !== undefined && v !== null && v !== '' ? v : '';
      } else {
        td.innerHTML = stars(v);
      }
      tr.appendChild(td);
    });
    tb.appendChild(tr);
  });
}

// ─────────────────────────────────────────────────────────────────────────────
// SORTING
// ─────────────────────────────────────────────────────────────────────────────
function sortTable(which, col) {
  const state = which === 'church' ? churchSort : laSort;
  state.asc = state.col === col ? !state.asc : true;
  state.col = col;

  // Update header indicators
  const tbl = document.getElementById(which === 'church' ? 'church-table' : 'la-table');
  tbl.querySelectorAll('th').forEach((th, i) => {
    th.classList.toggle('sorted', i === col);
    const sp = th.querySelector('span');
    if (sp) sp.textContent = i === col ? (state.asc ? '↑' : '↓') : '↕';
  });
  renderTables();
}

// ─────────────────────────────────────────────────────────────────────────────
// UTILS
// ─────────────────────────────────────────────────────────────────────────────
function esc(s) {
  return String(s).replace(/&/g,'&amp;').replace(/</g,'&lt;').replace(/>/g,'&gt;').replace(/"/g,'&quot;');
}

// ─────────────────────────────────────────────────────────────────────────────
// INIT
// ─────────────────────────────────────────────────────────────────────────────
dbg('AffiliateReport loaded');
loadData();
</script>
</body>
</html>
