do {
   $choice = Read-Host "enter 1 for processes, or Q to quit" 

   if ($choice -eq "1") {
        Get-Process |
            Sort-Object WorkingSet64 -Descending |
            Select-Object -First 3 Name, ID, WorkingSet64
            Format-Table
   } elseif ( ($choice -ne "Q")) {
        Write-Output "You must enter either 1 or Q"

   }

} while ($choice -ne "Q")

write-output "thanks for vistiting"