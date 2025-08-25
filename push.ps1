Set-Location -Path $PSScriptRoot

# Добавляем все изменения
git add .

# Коммит с философским сообщением
$timestamp = Get-Date -Format "yyyy-MM-dd HH:mm"
$commitMessage = "Акт обновления: правка структуры достоинства ($timestamp)"
git commit -m $commitMessage

# Отправка в облако
git push
