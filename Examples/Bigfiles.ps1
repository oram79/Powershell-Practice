$folder = "Y:\CorpData"

$bigfiles = Get-ChildItem $folder -recuse - file | Sort-Object Length -Descending | Select-Object -first 10

$runningtotal = 0

foreach($file in $bigfiles) {
    $runningtotal = $runningtotal + $file.Length
    Write-Output($file.fullname + "is" + $file.length + " bytes. Running total is " + $runningtotal)
}