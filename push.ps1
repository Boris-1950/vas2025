# Установка UTF-8 для консоли
chcp 65001 > $null

# Путь к сообщению коммита
$commitFile = "commit-message.txt"

# Проверка существования файла
if (!(Test-Path $commitFile)) {
    Write-Host "❌ Файл commit-message.txt не найден. Создай его с философским описанием."
    exit 1
}

# Проверка кодировки файла
$encoding = Get-Content $commitFile -Encoding Byte | Select-Object -First 3
if ($encoding -eq @(0xEF,0xBB,0xBF)) {
    Write-Host "⚠️ Файл содержит BOM. Рекомендуется сохранить как UTF-8 без BOM."
}

# Добавление всех изменений
git add .

# Коммит с сообщением из файла
git commit -F $commitFile

# Ребейз перед пушем
git pull origin main --rebase

# Пуш в репозиторий
git push origin main

# Подтверждение
Write-Host "✅ Коммит отправлен: $(Get-Date -Format 'yyyy-MM-dd HH:mm')"
