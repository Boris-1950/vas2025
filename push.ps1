chcp 65001 > $null

# Настройка Git на UTF-8
git config --global i18n.commitEncoding utf-8
git config --global i18n.logOutputEncoding utf-8

# Формирование сообщения
$timestamp = Get-Date -Format "yyyy-MM-dd HH:mm"
$commitMessage = "Акт обновления: уточнение структуры достоинства ($timestamp)"

# Создание файла commit-message.txt в UTF-8 без BOM
$utf8NoBom = New-Object System.Text.UTF8Encoding $false
[System.IO.File]::WriteAllText("commit-message.txt", $commitMessage, $utf8NoBom)

# Добавление и коммит
git add .
git commit -F commit-message.txt

# Ребейз и пуш
git pull origin main --rebase
git push origin main

Write-Host "`n✅ Коммит отправлен: $commitMessage" -ForegroundColor Green
