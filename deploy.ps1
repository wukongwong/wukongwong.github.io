# al-folio 网站部署脚本
# 使用方法: .\deploy.ps1

Write-Host "=====================================" -ForegroundColor Cyan
Write-Host "   al-folio Academic Website Deployment" -ForegroundColor Cyan
Write-Host "=====================================" -ForegroundColor Cyan
Write-Host ""

# 检查是否已经配置了Git
$gitConfigured = git config user.name
if (-not $gitConfigured) {
    Write-Host "⚙️  首次使用Git，需要配置用户信息..." -ForegroundColor Yellow
    Write-Host ""
    $userName = Read-Host "请输入你的姓名（例如：Shuaijun Wang）"
    $userEmail = Read-Host "请输入你的邮箱（例如：wukongwoong@gmail.com）"
    
    git config --global user.name "$userName"
    git config --global user.email "$userEmail"
    Write-Host "✅ Git配置完成！" -ForegroundColor Green
    Write-Host ""
}

# 询问GitHub用户名和仓库名
Write-Host "📝 请提供GitHub信息：" -ForegroundColor Yellow
Write-Host ""
$githubUsername = Read-Host "你的GitHub用户名（例如：wukongwoong）"
Write-Host ""
Write-Host "选择仓库类型：" -ForegroundColor Cyan
Write-Host "1. 个人主页仓库（推荐）- 仓库名：$githubUsername.github.io"
Write-Host "2. 项目仓库 - 自定义仓库名"
Write-Host ""
$choice = Read-Host "请选择 (1 或 2)"

if ($choice -eq "1") {
    $repoName = "$githubUsername.github.io"
    $websiteUrl = "https://$githubUsername.github.io"
    $baseurl = ""
} else {
    $repoName = Read-Host "请输入仓库名（例如：academic-website）"
    $websiteUrl = "https://$githubUsername.github.io"
    $baseurl = "/$repoName"
}

Write-Host ""
Write-Host "📋 配置信息：" -ForegroundColor Cyan
Write-Host "   GitHub用户名: $githubUsername"
Write-Host "   仓库名: $repoName"
Write-Host "   网站地址: $websiteUrl$baseurl"
Write-Host ""
$confirm = Read-Host "确认无误？(y/n)"

if ($confirm -ne "y") {
    Write-Host "❌ 已取消部署" -ForegroundColor Red
    exit
}

# 更新配置文件
Write-Host ""
Write-Host "⚙️  正在更新配置文件..." -ForegroundColor Yellow

$configPath = ".\_config.yml"
$configContent = Get-Content $configPath -Raw

# 替换URL和baseurl
$configContent = $configContent -replace 'url: https://.*', "url: $websiteUrl"
$configContent = $configContent -replace 'baseurl: .*', "baseurl: $baseurl"

Set-Content $configPath $configContent

Write-Host "✅ 配置文件已更新！" -ForegroundColor Green

# 初始化Git仓库（如果还没初始化）
if (-not (Test-Path ".git")) {
    Write-Host ""
    Write-Host "🔧 初始化Git仓库..." -ForegroundColor Yellow
    git init
    Write-Host "✅ Git仓库初始化完成！" -ForegroundColor Green
}

# 添加文件并提交
Write-Host ""
Write-Host "📦 准备提交文件..." -ForegroundColor Yellow
git add .
git commit -m "Deploy academic website for Shuaijun Wang"

# 检查是否已有远程仓库
$remoteExists = git remote get-url origin 2>$null
if ($remoteExists) {
    Write-Host "⚠️  检测到已存在的远程仓库" -ForegroundColor Yellow
    $updateRemote = Read-Host "是否更新远程仓库地址？(y/n)"
    if ($updateRemote -eq "y") {
        git remote set-url origin "https://github.com/$githubUsername/$repoName.git"
    }
} else {
    git remote add origin "https://github.com/$githubUsername/$repoName.git"
}

# 推送到GitHub
Write-Host ""
Write-Host "🚀 准备推送到GitHub..." -ForegroundColor Yellow
Write-Host ""
Write-Host "⚠️  重要提示：" -ForegroundColor Red
Write-Host "   1. 请先在GitHub上创建仓库：$repoName"
Write-Host "   2. 访问：https://github.com/new"
Write-Host "   3. 仓库可以是私有或公开的"
Write-Host ""
$readyToPush = Read-Host "已创建GitHub仓库？准备推送？(y/n)"

if ($readyToPush -eq "y") {
    Write-Host ""
    Write-Host "📤 正在推送..." -ForegroundColor Yellow
    
    git branch -M main
    git push -u origin main
    
    if ($LASTEXITCODE -eq 0) {
        Write-Host ""
        Write-Host "=====================================" -ForegroundColor Green
        Write-Host "   ✅ 部署成功！" -ForegroundColor Green
        Write-Host "=====================================" -ForegroundColor Green
        Write-Host ""
        Write-Host "📝 后续步骤：" -ForegroundColor Cyan
        Write-Host "   1. 访问你的GitHub仓库"
        Write-Host "      https://github.com/$githubUsername/$repoName"
        Write-Host ""
        Write-Host "   2. 进入 Settings → Pages"
        Write-Host ""
        Write-Host "   3. 在 Build and deployment 中："
        Write-Host "      Source: 选择 'GitHub Actions'"
        Write-Host ""
        Write-Host "   4. 等待5-10分钟后访问："
        Write-Host "      $websiteUrl$baseurl"
        Write-Host ""
        Write-Host "🎉 你的学术网站即将上线！" -ForegroundColor Green
    } else {
        Write-Host ""
        Write-Host "❌ 推送失败！" -ForegroundColor Red
        Write-Host ""
        Write-Host "💡 可能的原因：" -ForegroundColor Yellow
        Write-Host "   1. GitHub仓库不存在"
        Write-Host "   2. 需要GitHub认证（Personal Access Token）"
        Write-Host "   3. 网络连接问题"
        Write-Host ""
        Write-Host "📚 参考部署指南：" -ForegroundColor Cyan
        Write-Host "   查看 DEPLOYMENT_GUIDE.md 获取详细帮助"
    }
} else {
    Write-Host ""
    Write-Host "⏸️  部署已暂停" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "📝 手动推送命令：" -ForegroundColor Cyan
    Write-Host "   git branch -M main"
    Write-Host "   git push -u origin main"
}

Write-Host ""
Write-Host "Press any key to exit..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

