<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Church Assessments Report</title>
  <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;600;700&family=Crimson+Pro:ital,wght@0,300;0,400;0,600;1,300&display=swap" rel="stylesheet"/>
  <style>
    :root {
      --navy: #1a3a6b; --navy-light: #2a52a0; --navy-dim: #3a6abf;
      --bg: #ffffff; --panel: #f4f6fa; --panel2: #eef1f7;
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
    select { background:var(--panel); border:1px solid var(--border); color:var(--text); font-family:'Crimson Pro',serif; font-size:15px; border-radius:var(--radius); padding:11px 16px; outline:none; transition:border-color 0.2s; cursor:pointer; appearance:none; background-image:url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='12' height='12' viewBox='0 0 24 24' fill='none' stroke='%23555e70' stroke-width='2'%3E%3Cpolyline points='6 9 12 15 18 9'%3E%3C/polyline%3E%3C/svg%3E"); background-repeat:no-repeat; background-position:right 14px center; padding-right:38px; min-width:220px; }
    select:focus { border-color:var(--navy-dim); }
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

    /* CHURCH ASSESSMENT CARDS */
    #churches-area { display:flex; flex-direction:column; gap:28px; }

    .church-card {
      background: var(--panel);
      border: 1px solid var(--border);
      border-radius: 12px;
      overflow: hidden;
    }
    .church-card-header {
      background: rgba(26,58,107,0.07);
      border-bottom: 1px solid var(--border);
      padding: 16px 22px;
      display: flex; align-items: center; justify-content: space-between; gap: 12px;
      cursor: pointer; user-select: none;
    }
    .church-card-header:hover { background: rgba(26,58,107,0.11); }
    .church-name { font-family:'Cinzel',serif; font-size:15px; font-weight:700; color:var(--navy); }
    .church-meta { font-size:13px; color:var(--text-muted); display:flex; gap:16px; align-items:center; flex-wrap:wrap; }
    .badge { display:inline-block; padding:3px 10px; border-radius:20px; font-size:12px; background:rgba(26,58,107,0.1); color:var(--navy); border:1px solid rgba(26,58,107,0.2); }
    .toggle-icon { font-size:18px; color:var(--navy-dim); transition:transform 0.2s; flex-shrink:0; }
    .church-card.expanded .toggle-icon { transform:rotate(180deg); }

    .church-card-body { display:none; padding:0; }
    .church-card.expanded .church-card-body { display:block; }

    /* Assessment fields */
    .church-fields { padding:18px 22px; border-bottom:1px solid var(--border); display:grid; grid-template-columns:repeat(auto-fill,minmax(200px,1fr)); gap:12px 24px; }
    .field-item { }
    .field-label { font-size:10px; letter-spacing:0.12em; text-transform:uppercase; color:var(--text-muted); font-family:'Cinzel',serif; margin-bottom:3px; }
    .field-value { font-size:15px; color:var(--text); }

    /* Leader Assessments sub-table */
    .sub-section { padding:16px 22px 20px; }
    .sub-title { font-family:'Cinzel',serif; font-size:11px; letter-spacing:0.18em; text-transform:uppercase; color:var(--navy-dim); margin-bottom:12px; display:flex; align-items:center; gap:8px; }
    .sub-count { background:var(--navy); color:#fff; border-radius:10px; padding:1px 7px; font-size:10px; }

    .sub-table-wrap { border:1px solid var(--border); border-radius:8px; overflow:hidden; }
    table { width:100%; border-collapse:collapse; font-size:14px; }
    thead { background:rgba(26,58,107,0.08); border-bottom:1px solid var(--border); }
    th { font-family:'Cinzel',serif; font-size:9px; letter-spacing:0.18em; color:var(--navy-dim); text-transform:uppercase; padding:10px 14px; text-align:left; white-space:nowrap; }
    tbody tr { border-bottom:1px solid rgba(26,58,107,0.08); transition:background 0.15s; }
    tbody tr:last-child { border-bottom:none; }
    tbody tr:hover { background:rgba(26,58,107,0.04); }
    td { padding:10px 14px; color:var(--text); vertical-align:middle; }
    .no-sub { font-style:italic; color:var(--text-muted); font-size:13px; padding:14px 0; }

    /* States */
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
  <a href="https://tech4truth.sharepoint.com/sites/ChurchAssessments/Reports/index.html" class="nav-link">Home</a>
  <a href="https://tech4truth.sharepoint.com/sites/ChurchAssessments/Reports/leaders-report.html" class="nav-link">Leaders</a>
  <a href="https://tech4truth.sharepoint.com/sites/ChurchAssessments/Reports/church-assessments-report.html" class="nav-link active">Church Assessments</a>
  <a href="https://tech4truth.sharepoint.com/sites/ChurchAssessments/Reports/leader-assessments-report.html" class="nav-link">Leader Assessments</a>
</nav>

<div class="container">
  <header>
    <div>
      <div class="eyebrow">Tech4Truth · Church Assessments</div>
      <h1>Church Assessments <span>Filtered by Affiliate · with Leader Assessments</span></h1>
    </div>
    <div class="header-meta">
      <div id="last-updated">—</div>
      <div style="margin-top:4px;">Live from SharePoint</div>
    </div>
  </header>

  <div id="state-error"></div>

  <div id="state-loading">
    <div class="spinner"></div>
    <div>Loading assessments…</div>
    <div style="font-size:13px;margin-top:8px;color:var(--text-muted);">Using your SharePoint session</div>
  </div>

  <div id="state-data">
    <div class="stats-row">
      <div class="stat-card"><div class="stat-label">Total Assessments</div><div class="stat-value" id="stat-total">—</div><div class="stat-sub">church assessments</div></div>
      <div class="stat-card"><div class="stat-label">Affiliates</div><div class="stat-value" id="stat-affiliates">—</div><div class="stat-sub">unique affiliates</div></div>
      <div class="stat-card"><div class="stat-label">Leader Assessments</div><div class="stat-value" id="stat-leader-total">—</div><div class="stat-sub">linked records</div></div>
      <div class="stat-card"><div class="stat-label">Showing</div><div class="stat-value" id="stat-showing">—</div><div class="stat-sub">churches</div></div>
    </div>

    <div class="controls">
      <select id="affiliate-filter" onchange="applyFilters()">
        <option value="">All Affiliates</option>
      </select>
      <div class="controls-right">
        <span id="result-count"></span>
        <button class="btn btn-outline" onclick="loadData()">↻ Refresh</button>
      </div>
    </div>

    <div id="churches-area"></div>
  </div>
</div>

<footer>
  <div>© Tech4Truth · Church Assessments Portal</div>
  <div id="footer-user"></div>
</footer>

<button id="debug-toggle" onclick="toggleDebug()">🔧 Debug</button>
<div id="debug-panel"></div>

<script>
const SITE = 'https://tech4truth.sharepoint.com/sites/ChurchAssessments';
const CHURCH_LIST         = 'ChurchAssessments';
const AFFILIATES_LIST     = 'Affiliates';
const LEADER_ASSESS_LIST  = 'LeaderAssessments';
const AFF_ID_FIELD        = '__AffiliateID';   // field in ChurchAssessments linking to Affiliates
const LEADER_ID_FIELD     = 'LeaderID';      // field in LeaderAssessments linking to Leaders

// Columns to show in the church assessment card fields
const CHURCH_FIELDS = [
  { field: 'Title',           label: 'Church Name'      },
  { field: AFF_ID_FIELD,      label: 'Affiliate'        },
  { field: 'leadersNumber',   label: 'Leaders Number'   },
  { field: 'moralNumber',     label: 'Moral Number'     },
  { field: 'financialNumber', label: 'Financial Number' },
  { field: 'pswcNumber',      label: 'PSWC Number'      },
  { field: 'missionalfocus',  label: 'Missional Focus'  },
];

// Columns for the leader assessments sub-table
const LA_COLUMNS = [
  { field: 'Title',         label: 'Assessment'   },
  { field: LEADER_ID_FIELD, label: 'Leader'       },
  { field: 'Score',         label: 'Score'        },
  { field: 'Status',        label: 'Status'       },
  { field: 'Date',          label: 'Date'         },
];

function dbg(msg, type='info') {
  const p = document.getElementById('debug-panel');
  const d = document.createElement('div'); d.className='d-'+type;
  d.textContent='['+new Date().toLocaleTimeString()+'] '+msg;
  p.appendChild(d); p.scrollTop=p.scrollHeight; console.log('[DBG]',msg);
}
function toggleDebug(){ document.getElementById('debug-panel').classList.toggle('open'); }

let allChurches=[], allLeaderAssessments=[], affiliateMap={}, leaderMap={}, sortCol=null, sortAsc=true;

async function spGet(path) {
  const url = SITE+'/_api'+path;
  dbg('GET '+url);
  const res = await fetch(url, { credentials:'include', headers:{ 'Accept':'application/json;odata=nometadata','X-Requested-With':'XMLHttpRequest' }});
  dbg('Status: '+res.status, res.ok?'ok':'err');
  if (res.status===401||res.status===403) throw new Error('NOT_AUTHENTICATED');
  if (!res.ok) { const t=await res.text(); dbg('Error: '+t.slice(0,300),'err'); throw new Error('API '+res.status+': '+res.statusText); }
  return res.json();
}

async function loadData() {
  showState('loading'); hideError();

  try {
    // Current user
    try {
      const me = await spGet('/web/currentuser?$select=Title,Email');
      dbg('User: '+(me.Title||me.Email),'ok');
      document.getElementById('footer-user').textContent='Signed in as '+(me.Title||me.Email||'');
    } catch(e) { dbg('User fetch failed: '+e.message,'warn'); }

    // Affiliates
    try {
      const d = await spGet(`/web/lists/getbytitle('${AFFILIATES_LIST}')/items?$select=ID,Title,${AFF_ID_FIELD}&$top=5000`);
      affiliateMap={};
      (d.value||[]).forEach(a=>{ affiliateMap[a.ID]=a.Title; if(a[AFF_ID_FIELD]) affiliateMap[a[AFF_ID_FIELD]]=a.Title; });
      dbg('Affiliates: '+(d.value||[]).length,'ok');
    } catch(e){ dbg('Affiliates failed: '+e.message,'warn'); }

    // Leaders (for resolving LeaderID in sub-table)
    try {
      const d = await spGet(`/web/lists/getbytitle('Leaders')/items?$select=ID,Title&$top=5000`);
      leaderMap={};
      (d.value||[]).forEach(l=>{ leaderMap[l.ID]=l.Title; });
      dbg('Leaders map: '+Object.keys(leaderMap).length,'ok');
    } catch(e){ dbg('Leaders map failed: '+e.message,'warn'); }

    // Church Assessments
    const churchFields = [...new Set(CHURCH_FIELDS.map(c=>c.field))].join(',');
    const cd = await spGet(`/web/lists/getbytitle('${CHURCH_LIST}')/items?$select=ID,${churchFields}&$top=5000&$orderby=Title`);
    allChurches = cd.value||[];
    dbg('Churches: '+allChurches.length,'ok');

    // Leader Assessments
    const laFields = [...new Set(LA_COLUMNS.map(c=>c.field))].concat(['ChurchAssessmentID']).join(',');
    const lad = await spGet(`/web/lists/getbytitle('${LEADER_ASSESS_LIST}')/items?$select=ID,${laFields}&$top=5000`);
    allLeaderAssessments = lad.value||[];
    dbg('Leader Assessments: '+allLeaderAssessments.length,'ok');

    document.getElementById('stat-total').textContent = allChurches.length;
    document.getElementById('stat-leader-total').textContent = allLeaderAssessments.length;
    document.getElementById('stat-affiliates').textContent = new Set(allChurches.map(c=>c[AFF_ID_FIELD]||'?')).size;
    document.getElementById('last-updated').textContent = 'Updated '+new Date().toLocaleTimeString();

    buildAffFilter();
    applyFilters();
    showState('data');
  } catch(e) {
    dbg('loadData error: '+e.message,'err');
    showState('error');
    if(e.message==='NOT_AUTHENTICATED'){
      showError('⚠ Not authenticated.\n\nThis file must be opened directly from SharePoint — not locally.\n\nUpload to your Documents library and open it from there.');
    } else {
      showError('⚠ Failed to load: '+e.message+'\n\nCheck the 🔧 Debug panel. Common issues:\n• List names must match exactly (case-sensitive)\n• File must be opened from SharePoint, not locally');
    }
  }
}

function buildAffFilter(){
  const sel=document.getElementById('affiliate-filter');
  sel.innerHTML='<option value="">All Affiliates</option>';
  const seen=new Set();
  allChurches.forEach(c=>{
    const id=String(c[AFF_ID_FIELD]||'');
    if(id&&!seen.has(id)){
      seen.add(id);
      const o=document.createElement('option');
      o.value=id; o.textContent=affiliateMap[id]||id;
      sel.appendChild(o);
    }
  });
}

function applyFilters(){
  const af=document.getElementById('affiliate-filter').value;
  const filtered=allChurches.filter(c=>!af||String(c[AFF_ID_FIELD]||'')===af);
  renderChurches(filtered);
  document.getElementById('stat-showing').textContent=filtered.length;
  document.getElementById('result-count').textContent=filtered.length+' of '+allChurches.length+' churches';
}

function renderChurches(churches){
  const area=document.getElementById('churches-area');
  area.innerHTML='';
  if(!churches.length){
    area.innerHTML='<div style="text-align:center;padding:60px;color:var(--text-muted);font-style:italic;">No church assessments found for this filter.</div>';
    return;
  }
  churches.forEach(church=>{
    // Find linked leader assessments — try matching by church ID or AffiliateID
    const linked = allLeaderAssessments.filter(la=>
      la['ChurchAssessmentID']===church.ID ||
      la[AFF_ID_FIELD]===church[AFF_ID_FIELD]
    );

    const affName = affiliateMap[church[AFF_ID_FIELD]] || church[AFF_ID_FIELD] || '—';
    const card = document.createElement('div');
    card.className='church-card';

    // Header
    const hdr=document.createElement('div');
    hdr.className='church-card-header';
    hdr.innerHTML=`
      <div>
        <div class="church-name">${esc(church.Title||'Unnamed')}</div>
        <div class="church-meta">
          <span class="badge">${esc(affName)}</span>
          ${church.Status?`<span>${esc(church.Status)}</span>`:''}
          ${church.Score!==undefined&&church.Score!==null?`<span>Score: <strong>${esc(String(church.Score))}</strong></span>`:''}
        </div>
      </div>
      <div style="display:flex;align-items:center;gap:12px;">
        <span style="font-size:12px;color:var(--text-muted);">${linked.length} leader assessment${linked.length!==1?'s':''}</span>
        <span class="toggle-icon">▼</span>
      </div>`;
    hdr.onclick=()=>card.classList.toggle('expanded');

    // Body
    const body=document.createElement('div');
    body.className='church-card-body';

    // Field grid (skip Title and AffiliateID since shown in header)
    const showFields=CHURCH_FIELDS.filter(f=>f.field!=='Title'&&f.field!==AFF_ID_FIELD);
    if(showFields.some(f=>church[f.field]!==undefined&&church[f.field]!==null&&church[f.field]!=='')){
      const fg=document.createElement('div');
      fg.className='church-fields';
      showFields.forEach(f=>{
        const val=church[f.field];
        if(val===undefined||val===null||val==='') return;
        fg.innerHTML+=`<div class="field-item"><div class="field-label">${esc(f.label)}</div><div class="field-value">${esc(String(val))}</div></div>`;
      });
      body.appendChild(fg);
    }

    // Leader Assessments sub-table
    const sub=document.createElement('div');
    sub.className='sub-section';
    sub.innerHTML=`<div class="sub-title">Leader Assessments <span class="sub-count">${linked.length}</span></div>`;

    if(!linked.length){
      sub.innerHTML+=`<div class="no-sub">No leader assessments linked to this church.</div>`;
    } else {
      const tw=document.createElement('div'); tw.className='sub-table-wrap';
      const tbl=document.createElement('table');
      const thead=document.createElement('thead');
      const hrow=document.createElement('tr');
      LA_COLUMNS.forEach(col=>{ const th=document.createElement('th'); th.textContent=col.label; hrow.appendChild(th); });
      thead.appendChild(hrow); tbl.appendChild(thead);
      const tbody=document.createElement('tbody');
      linked.forEach(la=>{
        const tr=document.createElement('tr');
        LA_COLUMNS.forEach(col=>{
          const td=document.createElement('td');
          let val=la[col.field];
          if(col.field===LEADER_ID_FIELD) val=leaderMap[val]||val||'—';
          td.textContent=val===undefined||val===null||val===''?'—':val;
          tr.appendChild(td);
        });
        tbody.appendChild(tr);
      });
      tbl.appendChild(tbody); tw.appendChild(tbl); sub.appendChild(tw);
    }
    body.appendChild(sub);
    card.appendChild(hdr); card.appendChild(body);
    area.appendChild(card);
  });
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
