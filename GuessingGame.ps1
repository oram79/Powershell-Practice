
# Number Guessing Game

Write-Host "Welcome to the Number Guessing Game!" -ForegroundColor Magenta

$playAgain = "y"

# Keep playing new games until the player says no
while ($playAgain -eq "y") {

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
            Write-Host "Please enter a number." -ForegroundColor Red
            continue
        }

        $guess = [int]$answer

        # Make sure the number is between 1 and 100
        if ($guess -lt 1 -or $guess -gt 100) {
            Write-Host "Your guess has to be from 1 to 100." -ForegroundColor Red
            continue
        }

        $tries = $tries + 1

        if ($guess -lt $secretNumber) {
            Write-Host "The number is higher" -ForegroundColor Yellow
        }
        elseif ($guess -gt $secretNumber) {
            Write-Host "The number is lower" -ForegroundColor Yellow
        }
        else {
            Write-Host "You got it! The number was $secretNumber." -ForegroundColor Green
            Write-Host "It took you $tries tries."
        }
    }

    $playAgain = Read-Host "Play again? (y/n)"
}

Write-Host "Thanks for playing!" -ForegroundColor Magenta
