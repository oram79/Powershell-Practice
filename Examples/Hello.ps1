Get-Date
Write-output "Hello World. This is my first PowerShell Script!"
Get-Process | Sort-Object CPU -Descending | Select-object -First 5 Name, ID, CPU | Format-Table