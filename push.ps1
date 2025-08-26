# Установка UTF-8 для консоли
chcp 65001 > $null
# Установка UTF-8 для Git
git config --global i18n.commitEncoding utf-8
git config --global i18n.logOutputEncoding utf-8

# Получение текущей даты и времени
$timestamp = Get-Date -Format "yyyy-MM-dd HH:mm"

# Философский шаблон сообщения
$philosophy = "Акт обновления: уточнение структуры достоинства"
$commitMessage = "$philosophy ($timestamp)"

# Создание временного файла с сообщением
$commitFile = "commit-message.txt"
Set-Content -Path $commitFile -Value $commitMessage -Encoding UTF8

# Добавление всех изменений
git add .

# Коммит с сообщением из файла
git commit -F $commitFile

# Ребейз перед пушем
git pull origin main --rebase

# Пуш в репозиторий
git push origin main

# Подтверждение
Write-Host "`n✅ Коммит отправлен: $commitMessage" -ForegroundColor Green
