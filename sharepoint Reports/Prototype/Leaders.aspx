<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Leaders Report — Church Assessments</title>
  <!-- NO external scripts needed — uses SharePoint's built-in session auth -->
  <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;600;700&family=Crimson+Pro:ital,wght@0,300;0,400;0,600;1,300&display=swap" rel="stylesheet"/>
  <style>
    :root {
      --gold: #1a3a6b; --gold-light: #2a52a0; --gold-dim: #3a6abf;
      --deep: #ffffff; --panel: #f4f6fa;
      --border: rgba(26,58,107,0.18); --text: #111111;
      --text-muted: #555e70; --accent: #1a3a6b; --radius: 10px;
    }
    * { box-sizing: border-box; margin: 0; padding: 0; }
    body { font-family: 'Crimson Pro', Georgia, serif; background: var(--deep); color: var(--text); min-height: 100vh; padding-bottom: 120px; }
    body::before { content:''; position:fixed; inset:0; background: radial-gradient(ellipse 80% 60% at 50% -10%, rgba(26,58,107,0.06) 0%, transparent 70%); pointer-events:none; z-index:0; }
    .container { position:relative; z-index:1; max-width:1200px; margin:0 auto; padding:0 28px 60px; }

    header { padding:48px 0 32px; border-bottom:1px solid var(--border); margin-bottom:36px; display:flex; align-items:flex-end; justify-content:space-between; gap:20px; flex-wrap:wrap; }
    .eyebrow { font-family:'Cinzel',serif; font-size:10px; letter-spacing:0.3em; color:var(--gold-dim); text-transform:uppercase; margin-bottom:8px; }
    h1 { font-family:'Cinzel',serif; font-size:clamp(24px,4vw,38px); font-weight:700; color:var(--gold); line-height:1.1; }
    h1 span { display:block; font-size:0.55em; font-weight:400; color:var(--text-muted); margin-top:4px; }
    .header-meta { font-size:13px; color:var(--text-muted); text-align:right; }
    #last-updated { color:var(--gold-dim); font-style:italic; }

    .btn { display:inline-flex; align-items:center; gap:8px; padding:9px 20px; border-radius:6px; font-family:'Cinzel',serif; font-size:12px; letter-spacing:0.08em; cursor:pointer; border:none; transition:all 0.2s; }
    .btn-outline { background:transparent; color:var(--gold); border:1px solid var(--border); }
    .btn-outline:hover { border-color:var(--gold); background:rgba(26,58,107,0.05); }

    .controls { display:flex; align-items:center; gap:14px; margin-bottom:28px; flex-wrap:wrap; }
    .search-wrap { position:relative; flex:1; min-width:220px; max-width:360px; }
    .search-icon { position:absolute; left:14px; top:50%; transform:translateY(-50%); color:var(--text-muted); pointer-events:none; }
    input[type="text"], select { width:100%; background:var(--panel); border:1px solid var(--border); color:var(--text); font-family:'Crimson Pro',serif; font-size:15px; border-radius:var(--radius); padding:11px 16px; outline:none; transition:border-color 0.2s; }
    input[type="text"] { padding-left:42px; }
    input[type="text"]:focus, select:focus { border-color:var(--gold-dim); }
    select { cursor:pointer; appearance:none; background-image:url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='12' height='12' viewBox='0 0 24 24' fill='none' stroke='%238a8070' stroke-width='2'%3E%3Cpolyline points='6 9 12 15 18 9'%3E%3C/polyline%3E%3C/svg%3E"); background-repeat:no-repeat; background-position:right 14px center; padding-right:38px; }
    select option { background:#f4f6fa; }
    .controls-right { margin-left:auto; display:flex; gap:10px; align-items:center; }
    #result-count { font-size:13px; color:var(--text-muted); white-space:nowrap; }

    .stats-row { display:grid; grid-template-columns:repeat(auto-fit,minmax(160px,1fr)); gap:16px; margin-bottom:32px; }
    .stat-card { background:var(--panel); border:1px solid var(--border); border-radius:var(--radius); padding:20px 22px; position:relative; overflow:hidden; }
    .stat-card::before { content:''; position:absolute; top:0; left:0; right:0; height:2px; background:linear-gradient(90deg,var(--gold),transparent); }
    .stat-label { font-size:11px; letter-spacing:0.15em; color:var(--text-muted); text-transform:uppercase; font-family:'Cinzel',serif; margin-bottom:8px; }
    .stat-value { font-family:'Cinzel',serif; font-size:32px; font-weight:700; color:var(--gold); line-height:1; }
    .stat-sub { font-size:12px; color:var(--text-muted); margin-top:4px; }

    .table-wrap { background:var(--panel); border:1px solid var(--border); border-radius:var(--radius); overflow:hidden; }
    table { width:100%; border-collapse:collapse; font-size:15px; }
    thead { background:rgba(26,58,107,0.08); border-bottom:1px solid var(--border); }
    th { font-family:'Cinzel',serif; font-size:10px; letter-spacing:0.18em; color:var(--gold-dim); text-transform:uppercase; padding:14px 18px; text-align:left; white-space:nowrap; cursor:pointer; user-select:none; }
    th:hover, th.sorted { color:var(--gold); }
    tbody tr { border-bottom:1px solid rgba(26,58,107,0.1); transition:background 0.15s; }
    tbody tr:last-child { border-bottom:none; }
    tbody tr:hover { background:rgba(26,58,107,0.06); }
    td { padding:13px 18px; color:var(--text); vertical-align:middle; }
    .leader-name { font-weight:600; }
    .affiliate-badge { display:inline-block; padding:3px 10px; border-radius:20px; font-size:12px; background:rgba(74,144,184,0.12); color:var(--accent); border:1px solid rgba(74,144,184,0.2); }
    .empty-row td { text-align:center; color:var(--text-muted); padding:60px 20px; font-style:italic; }

    #state-loading { text-align:center; padding:80px 20px; color:var(--text-muted); }
    .spinner { width:36px; height:36px; border:2px solid var(--border); border-top-color:var(--gold); border-radius:50%; animation:spin 0.8s linear infinite; margin:0 auto 16px; }
    @keyframes spin { to { transform:rotate(360deg); } }

    #state-error { display:none; background:rgba(180,60,60,0.1); border:1px solid rgba(180,60,60,0.25); border-radius:var(--radius); padding:20px 24px; margin-bottom:24px; color:#e08080; font-size:15px; line-height:1.6; white-space:pre-wrap; }

    #state-data { display:none; }

    footer { margin-top:40px; padding-top:20px; border-top:1px solid var(--border); display:flex; justify-content:space-between; font-size:12px; color:var(--text-muted); flex-wrap:wrap; gap:10px; }

    /* DEBUG */
    #debug-toggle { position:fixed; bottom:0; right:16px; z-index:10000; background:var(--gold); color:#ffffff; border:none; padding:5px 12px; font-size:11px; font-family:monospace; cursor:pointer; border-radius:4px 4px 0 0; font-weight:bold; }
    #debug-panel { display:none; position:fixed; bottom:0; left:0; right:0; background:#1a1a2e; border-top:2px solid var(--gold); padding:10px 16px; font-family:monospace; font-size:12px; color:#ccc; max-height:200px; overflow-y:auto; z-index:9999; }
    #debug-panel.open { display:block; }
    .d-err{color:#ff7070} .d-ok{color:#70ffb0} .d-info{color:#70c5ff} .d-warn{color:#ffd070}
  </style>
</head>
<body>
<div class="container">
  <header>
    <div>
      <div class="eyebrow">Tech4Truth · Church Assessments</div>
      <h1>Leaders Report <span>Affiliated Leadership Directory</span></h1>
    </div>
    <div class="header-meta">
      <div id="last-updated">—</div>
      <div style="margin-top:4px;">Live from SharePoint</div>
    </div>
  </header>

  <div id="state-error"></div>

  <div id="state-loading">
    <div class="spinner"></div>
    <div>Connecting to SharePoint…</div>
    <div style="font-size:13px;margin-top:8px;color:var(--text-muted);">Using your existing SharePoint session</div>
  </div>

  <div id="state-data">
    <div class="stats-row">
      <div class="stat-card"><div class="stat-label">Total Leaders</div><div class="stat-value" id="stat-total">—</div><div class="stat-sub">across all affiliates</div></div>
      <div class="stat-card"><div class="stat-label">Affiliates</div><div class="stat-value" id="stat-affiliates">—</div><div class="stat-sub">unique affiliates</div></div>
      <div class="stat-card"><div class="stat-label">Showing</div><div class="stat-value" id="stat-showing">—</div><div class="stat-sub">filtered results</div></div>
    </div>
    <div class="controls">
      <div class="search-wrap">
        <svg class="search-icon" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="11" cy="11" r="8"/><line x1="21" y1="21" x2="16.65" y2="16.65"/></svg>
        <input type="text" id="search-input" placeholder="Search by leader name…" oninput="applyFilters()"/>
      </div>
      <select id="affiliate-filter" onchange="applyFilters()"><option value="">All Affiliates</option></select>
      <div class="controls-right">
        <span id="result-count"></span>
        <button class="btn btn-outline" onclick="loadData()">↻ Refresh</button>
      </div>
    </div>
    <div class="table-wrap">
      <table><thead><tr id="table-header"></tr></thead><tbody id="table-body"></tbody></table>
    </div>
  </div>

  <footer>
    <div>© Tech4Truth · Church Assessments Portal</div>
    <div id="footer-user"></div>
  </footer>
</div>

<button id="debug-toggle" onclick="toggleDebug()">🔧 Debug</button>
<div id="debug-panel"></div>

<script>
// ── CONFIG ────────────────────────────────────────────────────────────────────
// This report uses SharePoint's native session — no login needed.
// The user must already be signed into SharePoint (which they are, since this
// file is hosted there).
const SITE = 'https://tech4truth.sharepoint.com/sites/ChurchAssessments';

// List names — update if different
const LEADERS_LIST    = 'Leaders';
const AFFILIATES_LIST = 'Affiliates';

// The field in Leaders that links to Affiliates (internal name)
const AFF_ID_FIELD = 'AffiliateID';

// Columns to display — use SharePoint internal field names
// To find internal names: go to List Settings > click column name > check URL for 'Field='
const COLUMNS = [
  { field: 'Title',       label: 'Leader Name' },
  { field: AFF_ID_FIELD,  label: 'Affiliate'   },
  { field: 'Email',       label: 'Email'        },
  { field: 'Role',        label: 'Role'         },
  { field: 'Phone',       label: 'Phone'        },
];

// ── DEBUG ─────────────────────────────────────────────────────────────────────
function dbg(msg, type='info') {
  const p = document.getElementById('debug-panel');
  const d = document.createElement('div');
  d.className = 'd-' + type;
  d.textContent = '[' + new Date().toLocaleTimeString() + '] ' + msg;
  p.appendChild(d); p.scrollTop = p.scrollHeight;
  console.log('[DBG]', msg);
}
function toggleDebug() { document.getElementById('debug-panel').classList.toggle('open'); }

// ── STATE ─────────────────────────────────────────────────────────────────────
let allLeaders = [], affiliateMap = {}, sortCol = null, sortAsc = true;

// ── SHAREPOINT FETCH (uses existing browser session — no token needed) ────────
async function spGet(path) {
  const url = SITE + '/_api' + path;
  dbg('GET ' + url);
  const res = await fetch(url, {
    credentials: 'include',   // sends SharePoint session cookies automatically
    headers: {
      'Accept': 'application/json;odata=nometadata',
      'X-Requested-With': 'XMLHttpRequest',  // required for SP REST API
    }
  });
  dbg('Status: ' + res.status + ' ' + res.statusText, res.ok ? 'ok' : 'err');
  if (res.status === 401 || res.status === 403) {
    throw new Error('NOT_AUTHENTICATED');
  }
  if (!res.ok) {
    const text = await res.text();
    dbg('Error body: ' + text.slice(0, 400), 'err');
    throw new Error('API error ' + res.status + ': ' + res.statusText);
  }
  const json = await res.json();
  return json;
}

// ── LOAD DATA ─────────────────────────────────────────────────────────────────
async function loadData() {
  showState('loading');
  hideError();

  try {
    // Get current user info
    try {
      const me = await spGet('/web/currentuser?$select=Title,Email');
      dbg('Current user: ' + (me.Title||me.Email||'unknown'), 'ok');
      document.getElementById('footer-user').textContent = 'Signed in as ' + (me.Title || me.Email || '');
    } catch(e) {
      dbg('Could not get current user: ' + e.message, 'warn');
    }

    // Load Affiliates
    try {
      dbg('Loading Affiliates list…');
      const affData = await spGet(`/web/lists/getbytitle('${AFFILIATES_LIST}')/items?$select=ID,Title,${AFF_ID_FIELD}&$top=5000`);
      affiliateMap = {};
      (affData.value || []).forEach(a => {
        affiliateMap[a.ID] = a.Title;
        if (a[AFF_ID_FIELD]) affiliateMap[a[AFF_ID_FIELD]] = a.Title;
      });
      dbg('Affiliates loaded: ' + (affData.value||[]).length, 'ok');
    } catch(e) {
      dbg('Affiliates load failed (non-fatal): ' + e.message, 'warn');
    }

    // Load Leaders
    dbg('Loading Leaders list…');
    const fields = [...new Set(COLUMNS.map(c => c.field))].join(',');
    const leaderData = await spGet(`/web/lists/getbytitle('${LEADERS_LIST}')/items?$select=ID,${fields}&$top=5000&$orderby=Title`);
    allLeaders = leaderData.value || [];
    dbg('Leaders loaded: ' + allLeaders.length, 'ok');

    // Render
    buildHeader();
    buildAffFilter();
    applyFilters();

    document.getElementById('stat-total').textContent = allLeaders.length;
    document.getElementById('stat-affiliates').textContent = new Set(allLeaders.map(l => l[AFF_ID_FIELD] || '?')).size;
    document.getElementById('last-updated').textContent = 'Updated ' + new Date().toLocaleTimeString();

    showState('data');

  } catch(e) {
    dbg('loadData failed: ' + e.message, 'err');
    showState('error');

    if (e.message === 'NOT_AUTHENTICATED') {
      showError(
        '⚠ Not authenticated.\n\n' +
        'This page must be opened directly from SharePoint — not from a local file or external server.\n\n' +
        'Steps to fix:\n' +
        '1. Upload this HTML file to your SharePoint Documents library\n' +
        '2. Navigate to the file in SharePoint\n' +
        '3. Click on it to open it in your browser\n\n' +
        'Your SharePoint session will automatically authenticate the data requests.'
      );
    } else {
      showError(
        '⚠ Failed to load data: ' + e.message + '\n\n' +
        'Click 🔧 Debug (bottom right) for details.\n\n' +
        'Common fixes:\n' +
        '• Make sure the list is named exactly "' + LEADERS_LIST + '" (case-sensitive)\n' +
        '• Check that field names like "' + AFF_ID_FIELD + '" match your list\'s internal column names\n' +
        '• Open this file directly from SharePoint, not locally'
      );
    }
  }
}

// ── TABLE ──────────────────────────────────────────────────────────────────────
function buildHeader() {
  const tr = document.getElementById('table-header');
  tr.innerHTML = '';
  COLUMNS.forEach((col, i) => {
    const th = document.createElement('th');
    th.innerHTML = col.label + ' <span>↕</span>';
    th.onclick = () => sortBy(i);
    tr.appendChild(th);
  });
}

function resolveVal(leader, col) {
  if (col.field === AFF_ID_FIELD) {
    const id = leader[col.field];
    return affiliateMap[id] || id || '—';
  }
  const v = leader[col.field];
  return (v === null || v === undefined || v === '') ? '—' : v;
}

function renderTable(rows) {
  const tb = document.getElementById('table-body');
  tb.innerHTML = '';
  if (!rows.length) {
    const tr = document.createElement('tr');
    tr.className = 'empty-row';
    tr.innerHTML = `<td colspan="${COLUMNS.length}">No leaders match your filters.</td>`;
    tb.appendChild(tr); return;
  }
  rows.forEach(leader => {
    const tr = document.createElement('tr');
    COLUMNS.forEach((col, i) => {
      const td = document.createElement('td');
      const val = resolveVal(leader, col);
      if (i === 0) {
        td.innerHTML = `<span class="leader-name">${esc(val)}</span>`;
      } else if (col.field === AFF_ID_FIELD) {
        td.innerHTML = val !== '—' ? `<span class="affiliate-badge">${esc(val)}</span>` : `<span style="color:var(--text-muted)">—</span>`;
      } else if (col.field === 'Email' && val !== '—') {
        td.innerHTML = `<a href="mailto:${esc(val)}" style="color:var(--accent);text-decoration:none">${esc(val)}</a>`;
      } else {
        td.textContent = val;
      }
      tr.appendChild(td);
    });
    tb.appendChild(tr);
  });
}

function applyFilters() {
  const s = document.getElementById('search-input').value.trim().toLowerCase();
  const af = document.getElementById('affiliate-filter').value;
  let rows = allLeaders.filter(l =>
    (!s || (l.Title||'').toLowerCase().includes(s)) &&
    (!af || String(l[AFF_ID_FIELD]||'') === af)
  );
  if (sortCol !== null) {
    const col = COLUMNS[sortCol];
    rows.sort((a, b) => {
      const va = String(resolveVal(a, col)).toLowerCase();
      const vb = String(resolveVal(b, col)).toLowerCase();
      return sortAsc ? va.localeCompare(vb) : vb.localeCompare(va);
    });
  }
  renderTable(rows);
  document.getElementById('stat-showing').textContent = rows.length;
  document.getElementById('result-count').textContent = rows.length + ' of ' + allLeaders.length + ' leaders';
}

function sortBy(i) {
  sortAsc = sortCol === i ? !sortAsc : true;
  sortCol = i;
  document.querySelectorAll('#table-header th').forEach((th, idx) => {
    th.classList.toggle('sorted', idx === i);
    const sp = th.querySelector('span');
    if (sp) sp.textContent = idx === i ? (sortAsc ? '↑' : '↓') : '↕';
  });
  applyFilters();
}

function buildAffFilter() {
  const sel = document.getElementById('affiliate-filter');
  sel.innerHTML = '<option value="">All Affiliates</option>';
  const seen = new Set();
  allLeaders.forEach(l => {
    const id = String(l[AFF_ID_FIELD] || '');
    if (id && !seen.has(id)) {
      seen.add(id);
      const o = document.createElement('option');
      o.value = id;
      o.textContent = affiliateMap[id] || id;
      sel.appendChild(o);
    }
  });
}

// ── UTILS ──────────────────────────────────────────────────────────────────────
function showState(s) {
  document.getElementById('state-loading').style.display = s==='loading' ? 'block' : 'none';
  document.getElementById('state-data').style.display    = s==='data'    ? 'block' : 'none';
}
function showError(m) { const e = document.getElementById('state-error'); e.style.display='block'; e.textContent=m; }
function hideError()  { document.getElementById('state-error').style.display='none'; }
function esc(s) { return String(s).replace(/&/g,'&amp;').replace(/</g,'&lt;').replace(/>/g,'&gt;').replace(/"/g,'&quot;'); }

// ── START ──────────────────────────────────────────────────────────────────────
dbg('Page loaded from: ' + window.location.href);
loadData();
</script>
</body>
</html>
