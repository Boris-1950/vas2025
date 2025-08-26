chcp 65001 > $null

# Настройка Git на UTF-8
git config --global i18n.commitEncoding utf-8
git config --global i18n.logOutputEncoding utf-8

# Формирование сообщения
$timestamp = Get-Date -Format "yyyy-MM-dd HH:mm"
$commitMessage = "Акт обновления: уточнение структуры достоинства ($timestamp)"

# Сохранение в файл с явной кодировкой UTF-8
$commitFile = "commit-message.txt"
[System.IO.File]::WriteAllText($commitFile, $commitMessage, [System.Text.Encoding]::UTF8)

# Добавление и коммит
git add .
git commit -F $commitFile

# Ребейз и пуш
git pull origin main --rebase
git push origin main

Write-Host "`n✅ Коммит отправлен: $commitMessage" -ForegroundColor Green
