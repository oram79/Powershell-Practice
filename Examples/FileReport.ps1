$Folder = "Y:\CorpData"
$size = 51

Write-Output "Analyzing $Folder"
$files = Get-ChildItem -Path $Folder -Recurse -File | Where-Object Length -eq $size

$files | Select-Object FullName, Length

