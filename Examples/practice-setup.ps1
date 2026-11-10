$corp = "$HOME/Documents/CorpData-practice"
$bl = "$corp/Business Lines"
New-Item "$bl/Sales/Quarterly Reports" -ItemType Directory -Force | Out-Null
New-Item "$bl/Marketing/Campaigns" -ItemType Directory -Force | Out-Null
New-Item "$bl/Finance" -ItemType Directory -Force | Out-Null
New-Item "$corp/Shared" -ItemType Directory -Force | Out-Null
New-Item "$HOME/Documents/PSHOA-practice" -ItemType Directory -Force | Out-Null
Set-Content "$bl/Sales/Customer Feedback.pdf" ("a" * 48) -NoNewline
Set-Content "$bl/Sales/Sales Targets.xlsx" ("a" * 90) -NoNewline
Set-Content "$bl/Sales/Price List.pdf" ("a" * 120) -NoNewline
Set-Content "$bl/Sales/Team Notes.txt" ("a" * 22) -NoNewline
Set-Content "$bl/Sales/Quarterly Reports/Q1 Report.pdf" ("a" * 75) -NoNewline
Set-Content "$bl/Sales/Quarterly Reports/Q2 Report.pdf" ("a" * 110) -NoNewline
Set-Content "$bl/Sales/Quarterly Reports/Q3 Report.pdf" ("a" * 35) -NoNewline
Set-Content "$bl/Sales/Quarterly Reports/Summary.txt" ("a" * 18) -NoNewline
Set-Content "$bl/Marketing/Brand Guide.pdf" ("a" * 95) -NoNewline
Set-Content "$bl/Marketing/Campaign Report.pdf" ("a" * 60) -NoNewline
Set-Content "$bl/Marketing/Social Media.txt" ("a" * 30) -NoNewline
Set-Content "$bl/Marketing/Logo Ideas.txt" ("a" * 12) -NoNewline
Set-Content "$bl/Marketing/Campaigns/Spring Campaign.pdf" ("a" * 44) -NoNewline
Set-Content "$bl/Marketing/Campaigns/Fall Campaign.pdf" ("a" * 130) -NoNewline
Set-Content "$bl/Marketing/Campaigns/Budget.xlsx" ("a" * 66) -NoNewline
Set-Content "$bl/Finance/Budget 2026.xlsx" ("a" * 140) -NoNewline
Set-Content "$bl/Finance/Expense Report.pdf" ("a" * 55) -NoNewline
Set-Content "$bl/Finance/Invoices.txt" ("a" * 25) -NoNewline
Set-Content "$corp/Shared/Welcome.txt" ("a" * 40) -NoNewline
Set-Content "$corp/Shared/Phone List.txt" ("a" * 50) -NoNewline
Write-Output "Ready! Practice CorpData: $corp"