$score = 40
$HasSubmitted =  $true

if (-not $HasSubmitted){
    Write-Output "Nothing submitted"
} elseif ($score -ge 80) {
    Write-Output "Fantastic Grade"
} elseif ($score -ge 50) {
    Write-Output "You Passed"
} else {
    Write-Output "Sorry but you didnt pass"
}
Write-Output "The End!"