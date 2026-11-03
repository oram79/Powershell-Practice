[int] $temperature = read-host "What is the current temperature"

if ($Temperature -lt 10) {
    write-output "it is too cold!"
} else {
    Write-Output "It isnt to bad!"
}