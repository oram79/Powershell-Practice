$fruit = "apples", "oranges", "pears"

for ($i = 0; $i -lt $fruit.count; $i++) {
    Write-Output ([string]$i + " is " + $fruit[$i])
    # Write-Output ("Fruit " + $i + " is " + $fruit[$i])
}