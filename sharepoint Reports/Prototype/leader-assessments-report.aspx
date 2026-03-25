<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Leader Assessments Report</title>
  <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;600;700&family=Crimson+Pro:ital,wght@0,300;0,400;0,600;1,300&display=swap" rel="stylesheet"/>
  <style>
    :root {
      --navy: #1a3a6b; --navy-light: #2a52a0; --navy-dim: #3a6abf;
      --bg: #ffffff; --panel: #f4f6fa;
      --border: rgba(26,58,107,0.18); --text: #111111;
      --text-muted: #555e70; --radius: 10px;
    }
    * { box-sizing: border-box; margin: 0; padding: 0; }
    body { font-family: 'Crimson Pro', Georgia, serif; background: var(--bg); color: var(--text); min-height: 100vh; padding-bottom: 120px; }
    body::before { content:''; position:fixed; inset:0; background: radial-gradient(ellipse 80% 60% at 50% -10%, rgba(26,58,107,0.06) 0%, transparent 70%); pointer-events:none; z-index:0; }

    /* NAV */
    nav { position:sticky; top:0; z-index:100; background:var(--navy); box-shadow:0 2px 12px rgba(26,58,107,0.18); display:flex; align-items:center; padding:0 32px; height:56px; gap:4px; }
    .nav-brand { font-family:'Cinzel',serif; font-size:14px; font-weight:700; color:#fff; letter-spacing:0.08em; margin-right:24px; white-space:nowrap; }
    .nav-brand span { font-weight:400; opacity:0.7; font-size:11px; display:block; letter-spacing:0.12em; margin-top:1px; }
    .nav-link { font-family:'Cinzel',serif; font-size:11px; letter-spacing:0.1em; color:rgba(255,255,255,0.75); text-decoration:none; padding:8px 16px; border-radius:5px; transition:all 0.18s; white-space:nowrap; }
    .nav-link:hover { background:rgba(255,255,255,0.12); color:#fff; }
    .nav-link.active { background:rgba(255,255,255,0.18); color:#fff; }
    .nav-divider { width:1px; height:22px; background:rgba(255,255,255,0.15); margin:0 8px; }

    .container { position:relative; z-index:1; max-width:1200px; margin:0 auto; padding:0 28px 60px; }
    header { padding:40px 0 28px; border-bottom:1px solid var(--border); margin-bottom:32px; display:flex; align-items:flex-end; justify-content:space-between; gap:20px; flex-wrap:wrap; }
    .eyebrow { font-family:'Cinzel',serif; font-size:10px; letter-spacing:0.3em; color:var(--navy-dim); text-transform:uppercase; margin-bottom:8px; }
    h1 { font-family:'Cinzel',serif; font-size:clamp(22px,4vw,36px); font-weight:700; color:var(--navy); line-height:1.1; }
    h1 span { display:block; font-size:0.55em; font-weight:400; color:var(--text-muted); margin-top:4px; }
    .header-meta { font-size:13px; color:var(--text-muted); text-align:right; }
    #last-updated { color:var(--navy-dim); font-style:italic; }

    .btn { display:inline-flex; align-items:center; gap:8px; padding:9px 20px; border-radius:6px; font-family:'Cinzel',serif; font-size:12px; letter-spacing:0.08em; cursor:pointer; border:none; transition:all 0.2s; }
    .btn-outline { background:transparent; color:var(--navy); border:1px solid var(--border); }
    .btn-outline:hover { border-color:var(--navy); background:rgba(26,58,107,0.05); }

    /* CONTROLS */
    .controls { display:flex; align-items:center; gap:14px; margin-bottom:28px; flex-wrap:wrap; }
    .search-wrap { position:relative; flex:1; min-width:220px; max-width:320px; }
    .search-icon { position:absolute; left:14px; top:50%; transform:translateY(-50%); color:var(--text-muted); pointer-events:none; }
    input[type="text"], select { background:var(--panel); border:1px solid var(--border); color:var(--text); font-family:'Crimson Pro',serif; font-size:15px; border-radius:var(--radius); padding:11px 16px; outline:none; transition:border-color 0.2s; }
    input[type="text"] { width:100%; padding-left:42px; }
    input[type="text"]:focus, select:focus { border-color:var(--navy-dim); }
    select { cursor:pointer; appearance:none; background-image:url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='12' height='12' viewBox='0 0 24 24' fill='none' stroke='%23555e70' stroke-width='2'%3E%3Cpolyline points='6 9 12 15 18 9'%3E%3C/polyline%3E%3C/svg%3E"); background-repeat:no-repeat; background-position:right 14px center; padding-right:38px; min-width:200px; }
    select option { background:#f4f6fa; }
    .controls-right { margin-left:auto; display:flex; gap:10px; align-items:center; }
    #result-count { font-size:13px; color:var(--text-muted); white-space:nowrap; }

    /* STATS */
    .stats-row { display:grid; grid-template-columns:repeat(auto-fit,minmax(150px,1fr)); gap:16px; margin-bottom:32px; }
    .stat-card { background:var(--panel); border:1px solid var(--border); border-radius:var(--radius); padding:18px 20px; position:relative; overflow:hidden; }
    .stat-card::before { content:''; position:absolute; top:0; left:0; right:0; height:2px; background:linear-gradient(90deg,var(--navy),transparent); }
    .stat-label { font-size:10px; letter-spacing:0.15em; color:var(--text-muted); text-transform:uppercase; font-family:'Cinzel',serif; margin-bottom:6px; }
    .stat-value { font-family:'Cinzel',serif; font-size:28px; font-weight:700; color:var(--navy); line-height:1; }
    .stat-sub { font-size:12px; color:var(--text-muted); margin-top:4px; }

    /* TABLE */
    .table-wrap { background:var(--panel); border:1px solid var(--border); border-radius:var(--radius); overflow:hidden; }
    table { width:100%; border-collapse:collapse; font-size:15px; }
    thead { background:rgba(26,58,107,0.08); border-bottom:1px solid var(--border); }
    th { font-family:'Cinzel',serif; font-size:10px; letter-spacing:0.18em; color:var(--navy-dim); text-transform:uppercase; padding:14px 18px; text-align:left; white-space:nowrap; cursor:pointer; user-select:none; }
    th:hover, th.sorted { color:var(--navy); }
    tbody tr { border-bottom:1px solid rgba(26,58,107,0.08); transition:background 0.15s; }
    tbody tr:last-child { border-bottom:none; }
    tbody tr:hover { background:rgba(26,58,107,0.04); }
    td { padding:13px 18px; color:var(--text); vertical-align:middle; }
    .cell-bold { font-weight:600; }
    .badge { display:inline-block; padding:3px 10px; border-radius:20px; font-size:12px; background:rgba(26,58,107,0.1); color:var(--navy); border:1px solid rgba(26,58,107,0.2); }
    .empty-row td { text-align:center; color:var(--text-muted); padding:60px 20px; font-style:italic; }

    /* STATES */
    #state-loading { text-align:center; padding:80px 20px; color:var(--text-muted); }
    .spinner { width:36px; height:36px; border:2px solid var(--border); border-top-color:var(--navy); border-radius:50%; animation:spin 0.8s linear infinite; margin:0 auto 16px; }
    @keyframes spin { to { transform:rotate(360deg); } }
    #state-error { display:none; background:rgba(180,60,60,0.1); border:1px solid rgba(180,60,60,0.25); border-radius:var(--radius); padding:20px 24px; margin-bottom:24px; color:#cc4444; font-size:15px; line-height:1.6; white-space:pre-wrap; }
    #state-data { display:none; }

    footer { margin-top:40px; padding-top:20px; border-top:1px solid var(--border); display:flex; justify-content:space-between; font-size:12px; color:var(--text-muted); flex-wrap:wrap; gap:10px; }

    /* DEBUG */
    #debug-toggle { position:fixed; bottom:0; right:16px; z-index:10000; background:var(--navy); color:#fff; border:none; padding:5px 12px; font-size:11px; font-family:monospace; cursor:pointer; border-radius:4px 4px 0 0; font-weight:bold; }
    #debug-panel { display:none; position:fixed; bottom:0; left:0; right:0; background:#0f1521; border-top:2px solid var(--navy); padding:10px 16px; font-family:monospace; font-size:12px; color:#ccc; max-height:200px; overflow-y:auto; z-index:9999; }
    #debug-panel.open { display:block; }
    .d-err{color:#ff7070} .d-ok{color:#70ffb0} .d-info{color:#70c5ff} .d-warn{color:#ffd070}
  </style>
</head>
<body>

<nav>
  <div class="nav-brand">Tech4Truth <span>Church Assessments</span></div>
  <div class="nav-divider"></div>
  <a href="https://tech4truth.sharepoint.com/sites/ChurchAssessments/Reports/index.aspx" class="nav-link">Home</a>
  <a href="https://tech4truth.sharepoint.com/sites/ChurchAssessments/Reports/leaders-report.aspx" class="nav-link">Leaders</a>
  <a href="https://tech4truth.sharepoint.com/sites/ChurchAssessments/Reports/church-assessments-report.aspx" class="nav-link">Church Assessments</a>
  <a href="https://tech4truth.sharepoint.com/sites/ChurchAssessments/Reports/leader-assessments-report.aspx" class="nav-link active">Leader Assessments</a>
</nav>

<div class="container">
  <header>
    <div>
      <div class="eyebrow">Tech4Truth · Church Assessments</div>
      <h1>Leader Assessments <span>Filter by Leader or Affiliate</span></h1>
    </div>
    <div class="header-meta">
      <div id="last-updated">—</div>
      <div style="margin-top:4px;">Live from SharePoint</div>
    </div>
  </header>

  <div id="state-error"></div>

  <div id="state-loading">
    <div class="spinner"></div>
    <div>Loading leader assessments…</div>
    <div style="font-size:13px;margin-top:8px;color:var(--text-muted);">Using your SharePoint session</div>
  </div>

  <div id="state-data">
    <div class="stats-row">
      <div class="stat-card"><div class="stat-label">Total</div><div class="stat-value" id="stat-total">—</div><div class="stat-sub">leader assessments</div></div>
      <div class="stat-card"><div class="stat-label">Leaders</div><div class="stat-value" id="stat-leaders">—</div><div class="stat-sub">unique leaders</div></div>
      <div class="stat-card"><div class="stat-label">Affiliates</div><div class="stat-value" id="stat-affiliates">—</div><div class="stat-sub">represented</div></div>
      <div class="stat-card"><div class="stat-label">Showing</div><div class="stat-value" id="stat-showing">—</div><div class="stat-sub">filtered results</div></div>
    </div>

    <div class="controls">
      <div class="search-wrap">
        <svg class="search-icon" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="11" cy="11" r="8"/><line x1="21" y1="21" x2="16.65" y2="16.65"/></svg>
        <input type="text" id="search-affiliate" placeholder="Search by affiliate…" oninput="applyFilters()"/>
      </div>
      <select id="leader-filter" onchange="applyFilters()">
        <option value="">All Leaders</option>
      </select>
      <div class="controls-right">
        <span id="result-count"></span>
        <button class="btn btn-outline" onclick="loadData()">↻ Refresh</button>
      </div>
    </div>

    <div class="table-wrap">
      <table>
        <thead><tr id="table-header"></tr></thead>
        <tbody id="table-body"></tbody>
      </table>
    </div>
  </div>
</div>

<footer>
  <div>© Tech4Truth · Church Assessments Portal</div>
  <div id="footer-user"></div>
</footer>

<button id="debug-toggle" onclick="toggleDebug()">🔧 Debug</button>
<div id="debug-panel"></div>

<script>
const SITE             = 'https://tech4truth.sharepoint.com/sites/ChurchAssessments';
const LA_LIST          = 'LeaderAssessments';
const LEADERS_LIST     = 'Leaders';
const AFFILIATES_LIST  = 'Affiliates';
const LEADER_ID_FIELD  = 'LeaderID';   // internal field in LeaderAssessments linking to Leaders
const AFF_ID_FIELD     = 'AffiliateID';

// Columns for the table
const COLUMNS = [
  { field: 'Title',          label: 'Assessment'  },
  { field: LEADER_ID_FIELD,  label: 'Leader'      },
  { field: AFF_ID_FIELD,     label: 'Affiliate'   },
  { field: 'Score',          label: 'Score'       },
  { field: 'Status',         label: 'Status'      },
  { field: 'Date',           label: 'Date'        },
  { field: 'Notes',          label: 'Notes'       },
];

function dbg(msg,type='info'){
  const p=document.getElementById('debug-panel');
  const d=document.createElement('div'); d.className='d-'+type;
  d.textContent='['+new Date().toLocaleTimeString()+'] '+msg;
  p.appendChild(d); p.scrollTop=p.scrollHeight; console.log('[DBG]',msg);
}
function toggleDebug(){ document.getElementById('debug-panel').classList.toggle('open'); }

let allAssessments=[], leaderMap={}, affiliateMap={}, sortCol=null, sortAsc=true;

async function spGet(path){
  const url=SITE+'/_api'+path;
  dbg('GET '+url);
  const res=await fetch(url,{credentials:'include',headers:{'Accept':'application/json;odata=nometadata','X-Requested-With':'XMLHttpRequest'}});
  dbg('Status: '+res.status,res.ok?'ok':'err');
  if(res.status===401||res.status===403) throw new Error('NOT_AUTHENTICATED');
  if(!res.ok){const t=await res.text(); dbg('Error: '+t.slice(0,300),'err'); throw new Error('API '+res.status+': '+res.statusText);}
  return res.json();
}

async function loadData(){
  showState('loading'); hideError();
  try {
    try {
      const me=await spGet('/web/currentuser?$select=Title,Email');
      document.getElementById('footer-user').textContent='Signed in as '+(me.Title||me.Email||'');
      dbg('User: '+(me.Title||me.Email),'ok');
    } catch(e){ dbg('User failed: '+e.message,'warn'); }

    // Affiliates
    try {
      const d=await spGet(`/web/lists/getbytitle('${AFFILIATES_LIST}')/items?$select=ID,Title,${AFF_ID_FIELD}&$top=5000`);
      affiliateMap={};
      (d.value||[]).forEach(a=>{ affiliateMap[a.ID]=a.Title; if(a[AFF_ID_FIELD]) affiliateMap[a[AFF_ID_FIELD]]=a.Title; });
      dbg('Affiliates: '+(d.value||[]).length,'ok');
    } catch(e){ dbg('Affiliates failed: '+e.message,'warn'); }

    // Leaders
    try {
      const d=await spGet(`/web/lists/getbytitle('${LEADERS_LIST}')/items?$select=ID,Title,${AFF_ID_FIELD}&$top=5000`);
      leaderMap={};
      (d.value||[]).forEach(l=>{ leaderMap[l.ID]={ name:l.Title, affiliateId:l[AFF_ID_FIELD] }; });
      dbg('Leaders: '+Object.keys(leaderMap).length,'ok');
    } catch(e){ dbg('Leaders failed: '+e.message,'warn'); }

    // Leader Assessments
    const fields=[...new Set(COLUMNS.map(c=>c.field))].join(',');
    const d=await spGet(`/web/lists/getbytitle('${LA_LIST}')/items?$select=ID,${fields}&$top=5000&$orderby=Title`);
    allAssessments=d.value||[];
    dbg('LeaderAssessments: '+allAssessments.length,'ok');

    document.getElementById('stat-total').textContent=allAssessments.length;
    document.getElementById('stat-leaders').textContent=new Set(allAssessments.map(a=>a[LEADER_ID_FIELD]||'?')).size;

    // Count unique affiliates via leader map
    const affSet=new Set(allAssessments.map(a=>{
      const l=leaderMap[a[LEADER_ID_FIELD]]; return l?l.affiliateId:'?';
    }));
    document.getElementById('stat-affiliates').textContent=affSet.size;
    document.getElementById('last-updated').textContent='Updated '+new Date().toLocaleTimeString();

    buildHeader();
    buildLeaderFilter();
    applyFilters();
    showState('data');
  } catch(e){
    dbg('loadData error: '+e.message,'err');
    showState('error');
    if(e.message==='NOT_AUTHENTICATED'){
      showError('⚠ Not authenticated.\n\nOpen this file directly from SharePoint — not locally.');
    } else {
      showError('⚠ Failed to load: '+e.message+'\n\nCheck the 🔧 Debug panel.\nCommon issues:\n• List name must be exactly "'+LA_LIST+'"\n• Field names must match SharePoint internal names\n• Must be opened from SharePoint');
    }
  }
}

function buildLeaderFilter(){
  const sel=document.getElementById('leader-filter');
  sel.innerHTML='<option value="">All Leaders</option>';
  const seen=new Set();
  allAssessments.forEach(a=>{
    const id=String(a[LEADER_ID_FIELD]||'');
    if(id&&!seen.has(id)){
      seen.add(id);
      const o=document.createElement('option');
      o.value=id;
      o.textContent=leaderMap[id]?.name||id;
      sel.appendChild(o);
    }
  });
}

function resolveVal(item, col){
  if(col.field===LEADER_ID_FIELD){
    const l=leaderMap[item[col.field]]; return l?l.name:(item[col.field]||'—');
  }
  if(col.field===AFF_ID_FIELD){
    // Try to get affiliate from leader map first, then direct
    const l=leaderMap[item[LEADER_ID_FIELD]];
    const affId=l?l.affiliateId:item[col.field];
    return affiliateMap[affId]||affId||'—';
  }
  const v=item[col.field];
  return (v===undefined||v===null||v==='')?'—':String(v);
}

function applyFilters(){
  const searchAff=document.getElementById('search-affiliate').value.trim().toLowerCase();
  const leaderFilter=document.getElementById('leader-filter').value;

  let rows=allAssessments.filter(a=>{
    // Affiliate search — resolve affiliate name from leader
    const l=leaderMap[a[LEADER_ID_FIELD]];
    const affId=l?l.affiliateId:a[AFF_ID_FIELD];
    const affName=(affiliateMap[affId]||affId||'').toLowerCase();
    const matchAff=!searchAff||affName.includes(searchAff);
    const matchLeader=!leaderFilter||String(a[LEADER_ID_FIELD]||'')===leaderFilter;
    return matchAff&&matchLeader;
  });

  if(sortCol!==null){
    const col=COLUMNS[sortCol];
    rows.sort((a,b)=>{
      const va=resolveVal(a,col).toLowerCase();
      const vb=resolveVal(b,col).toLowerCase();
      return sortAsc?va.localeCompare(vb):vb.localeCompare(va);
    });
  }
  renderTable(rows);
  document.getElementById('stat-showing').textContent=rows.length;
  document.getElementById('result-count').textContent=rows.length+' of '+allAssessments.length+' assessments';
}

function buildHeader(){
  const tr=document.getElementById('table-header'); tr.innerHTML='';
  COLUMNS.forEach((col,i)=>{
    const th=document.createElement('th');
    th.innerHTML=col.label+' <span>↕</span>';
    th.onclick=()=>sortBy(i);
    tr.appendChild(th);
  });
}

function renderTable(rows){
  const tb=document.getElementById('table-body'); tb.innerHTML='';
  if(!rows.length){
    const tr=document.createElement('tr'); tr.className='empty-row';
    tr.innerHTML=`<td colspan="${COLUMNS.length}">No assessments match your filters.</td>`;
    tb.appendChild(tr); return;
  }
  rows.forEach(item=>{
    const tr=document.createElement('tr');
    COLUMNS.forEach((col,i)=>{
      const td=document.createElement('td');
      const val=resolveVal(item,col);
      if(i===0){
        td.innerHTML=`<span class="cell-bold">${esc(val)}</span>`;
      } else if(col.field===AFF_ID_FIELD||col.field===LEADER_ID_FIELD){
        td.innerHTML=val!=='—'?`<span class="badge">${esc(val)}</span>`:`<span style="color:var(--text-muted)">—</span>`;
      } else {
        td.textContent=val;
      }
      tr.appendChild(td);
    });
    tb.appendChild(tr);
  });
}

function sortBy(i){
  sortAsc=sortCol===i?!sortAsc:true; sortCol=i;
  document.querySelectorAll('#table-header th').forEach((th,idx)=>{
    th.classList.toggle('sorted',idx===i);
    const sp=th.querySelector('span'); if(sp) sp.textContent=idx===i?(sortAsc?'↑':'↓'):'↕';
  });
  applyFilters();
}

function showState(s){
  document.getElementById('state-loading').style.display=s==='loading'?'block':'none';
  document.getElementById('state-data').style.display=s==='data'?'block':'none';
}
function showError(m){const e=document.getElementById('state-error');e.style.display='block';e.textContent=m;}
function hideError(){document.getElementById('state-error').style.display='none';}
function esc(s){return String(s).replace(/&/g,'&amp;').replace(/</g,'&lt;').replace(/>/g,'&gt;').replace(/"/g,'&quot;');}

dbg('Page loaded: '+window.location.href);
loadData();
</script>
</body>
</html>
