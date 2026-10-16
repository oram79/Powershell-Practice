
# Number Guessing Game

Write-Host "Welcome to the Number Guessing Game!"
Write-Host "Pick any number from 1 to 100"

# Pick a random number from 1 to 100
$secretNumber = Get-Random -Minimum 1 -Maximum 101

$guess = 0
$tries = 0

# Keep asking until your successful
while ($guess -ne $secretNumber) {

    $answer = Read-Host "Enter your guess"

    # Make sure the player typed a number
    if ($answer -notmatch '^\d+$') {
        Write-Host "Please enter a number."
        continue
    }

    $guess = [int]$answer
    $tries = $tries + 1

    if ($guess -lt $secretNumber) {
        Write-Host "The number is higher"
    }
    elseif ($guess -gt $secretNumber) {
        Write-Host "The number is lower"
    }
    else {
        Write-Host "You got it! The number was $secretNumber."
        Write-Host "It took you $tries tries."
    }
}