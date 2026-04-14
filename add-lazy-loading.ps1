# ─── ADD LAZY LOADING ────────────────────────────────────────────────────────
# Roda na raiz do projeto: .\add-lazy-loading.ps1
# Adiciona loading="lazy" nas imagens certas, sem mexer nos heroes.

Write-Host "Adicionando lazy loading..." -ForegroundColor Cyan

# ─── LancomeCase.vue ─────────────────────────────────────────────────────────
$file = "src\seções\LancomeCase.vue"
if (Test-Path $file) {
    $content = Get-Content $file -Raw
    $content = $content -replace '(alt="User flow diagram — Guest and Promoter journeys")(\s*/>)', '$1 loading="lazy"$2'
    $content = $content -replace '(alt="Wireframes — low and high fidelity")(\s+class="lc-photo")', '$1 loading="lazy"$2'
    $content = $content -replace '(alt="Final UI — guest and promoter screens")(\s+class="lc-photo")', '$1 loading="lazy"$2'
    Set-Content $file $content -NoNewline
    Write-Host "  OK  LancomeCase.vue" -ForegroundColor Green
} else {
    Write-Host "  --  LancomeCase.vue nao encontrado, pulando" -ForegroundColor Yellow
}

# ─── YSLCase.vue ─────────────────────────────────────────────────────────────
$file = "src\seções\YSLCase.vue"
if (Test-Path $file) {
    $content = Get-Content $file -Raw
    $content = $content -replace '(:alt="t\.altCaptacao"\s+)(class="ysl-photo ysl-photo--full")', '$1loading="lazy" $2'
    $content = $content -replace '(:alt="t\.altDesktop"\s+)(class="ysl-photo")', '$1loading="lazy" $2'
    $content = $content -replace '(:alt="t\.altMobile"\s+)(class="ysl-photo")', '$1loading="lazy" $2'
    $content = $content -replace '(alt="YSL Libre — Dua Lipa campaign")(\s*/>)', '$1 loading="lazy"$2'
    $content = $content -replace '(alt="YSL E-commerce Brazil launch")(\s*/>)', '$1 loading="lazy"$2'
    Set-Content $file $content -NoNewline
    Write-Host "  OK  YSLCase.vue" -ForegroundColor Green
} else {
    Write-Host "  --  YSLCase.vue nao encontrado, pulando" -ForegroundColor Yellow
}

# ─── ProjectsPage.vue ────────────────────────────────────────────────────────
$file = "src\seções\ProjectsPage.vue"
if (Test-Path $file) {
    $content = Get-Content $file -Raw
    $content = $content -replace '(v-if="project\.image"\s+:src="project\.image"\s+class="card-thumb-img")(\s+alt="")', '$1 loading="lazy"$2'
    Set-Content $file $content -NoNewline
    Write-Host "  OK  ProjectsPage.vue" -ForegroundColor Green
} else {
    Write-Host "  --  ProjectsPage.vue nao encontrado, pulando" -ForegroundColor Yellow
}

# ─── ProjectsSection.vue ─────────────────────────────────────────────────────
$file = "src\components\ProjectsSection.vue"
if (Test-Path $file) {
    $content = Get-Content $file -Raw
    $content = $content -replace '(v-if="featured\.image"\s+:src="featured\.image"\s+class="card-img-photo")(\s+alt="")', '$1 loading="lazy"$2'
    $content = $content -replace '(v-if="project\.image"\s+:src="project\.image"\s+class="card-img-photo")(\s+alt="")', '$1 loading="lazy"$2'
    Set-Content $file $content -NoNewline
    Write-Host "  OK  ProjectsSection.vue" -ForegroundColor Green
} else {
    Write-Host "  --  ProjectsSection.vue nao encontrado, pulando" -ForegroundColor Yellow
}

# ─── AboutSection.vue ────────────────────────────────────────────────────────
$file = "src\components\AboutSection.vue"
if (Test-Path $file) {
    $content = Get-Content $file -Raw
    $content = $content -replace '(<img)(\s+class="ab-photo")', '$1 loading="lazy"$2'
    Set-Content $file $content -NoNewline
    Write-Host "  OK  AboutSection.vue" -ForegroundColor Green
} else {
    Write-Host "  --  AboutSection.vue nao encontrado, pulando" -ForegroundColor Yellow
}

Write-Host ""
Write-Host "Pronto! Lazy loading adicionado." -ForegroundColor Cyan
Write-Host "Teste no browser: F12 > Network > Img" -ForegroundColor Gray
