Function Sync-Git {
    git fetch --all
    git pull
    git add .
    git commit -m 'git-sync'
    git push
}

$rootFolder = '/rootFolder'

Write-Host "Changing directory to root folder: $rootFolder"
Set-Location $rootFolder
Get-Location | Write-Host

Get-ChildItem -Directory | ForEach-Object { 
    Set-Location -Path $_ 
    Write-Host $_
    Sync-Git
    Set-Location $rootFolder
}

Write-Host "Done"

