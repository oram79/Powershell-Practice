<#
.SYNOPSIS
    A tiny command-line to-do list manager.

.DESCRIPTION
    Stores tasks in a JSON file and lets you add, list, complete, and remove them.

.EXAMPLE
    ./script.ps1 add "Learn PowerShell pipelines" -Priority High
    ./script.ps1 list
    ./script.ps1 done 1
    ./script.ps1 remove 1
    ./script.ps1 clear
#>
[CmdletBinding()]
param(
    [Parameter(Position = 0)]
    [ValidateSet('add', 'list', 'done', 'remove', 'clear', 'help')]
    [string]$Command = 'list',

    [Parameter(Position = 1)]
    [string]$Value,

    [ValidateSet('Low', 'Normal', 'High')]
    [string]$Priority = 'Normal',

    [switch]$All,

    [string]$Path = (Join-Path $PSScriptRoot 'todos.json')
)

$ErrorActionPreference = 'Stop'

function Get-Todos {
    if (-not (Test-Path $Path)) { return ,@() }
    $raw = Get-Content $Path -Raw
    if ([string]::IsNullOrWhiteSpace($raw)) { return ,@() }
    # The leading comma stops PowerShell from unrolling a one-item array into a single object.
    return ,@($raw | ConvertFrom-Json)
}

function Save-Todos {
    param([object[]]$Todos)
    ConvertTo-Json -InputObject @($Todos | Where-Object { $_ }) -Depth 3 | Set-Content $Path
}

function Get-TodoById {
    param([object[]]$Todos, [string]$Id)
    $todo = $Todos | Where-Object { $_.Id -eq [int]$Id }
    if (-not $todo) { throw "No task with Id $Id." }
    return $todo
}

function Add-Todo {
    param([string]$Title)
    if ([string]::IsNullOrWhiteSpace($Title)) { throw 'Give the task a title, e.g. ./script.ps1 add "Buy milk"' }

    $todos = Get-Todos
    $nextId = if ($todos.Count) { ($todos | Measure-Object Id -Maximum).Maximum + 1 } else { 1 }

    $todo = [pscustomobject]@{
        Id       = $nextId
        Title    = $Title
        Priority = $Priority
        Done     = $false
        Created  = (Get-Date).ToString('yyyy-MM-dd HH:mm')
    }
    Save-Todos ($todos + $todo)
    Write-Host "Added #$($todo.Id): $Title" -ForegroundColor Green
}

function Show-Todos {
    $todos = Get-Todos
    if (-not $All) { $todos = $todos | Where-Object { -not $_.Done } }

    if (-not $todos) {
        Write-Host 'Nothing to do. Nice!' -ForegroundColor Cyan
        return
    }

    $rank = @{ High = 0; Normal = 1; Low = 2 }
    $colors = @{ High = 'Red'; Normal = 'White'; Low = 'DarkGray' }

    foreach ($todo in $todos | Sort-Object { $rank[$_.Priority] }, Id) {
        $check = if ($todo.Done) { '[x]' } else { '[ ]' }
        $line = '{0} #{1,-3} {2,-7} {3}' -f $check, $todo.Id, $todo.Priority, $todo.Title
        Write-Host $line -ForegroundColor $colors[$todo.Priority]
    }
}

function Complete-Todo {
    param([string]$Id)
    $todos = Get-Todos
    $todo = Get-TodoById $todos $Id
    $todo.Done = $true
    Save-Todos $todos
    Write-Host "Completed #${Id}: $($todo.Title)" -ForegroundColor Green
}

function Remove-Todo {
    param([string]$Id)
    $todos = Get-Todos
    $todo = Get-TodoById $todos $Id
    Save-Todos @($todos | Where-Object { $_.Id -ne $todo.Id })
    Write-Host "Removed #${Id}: $($todo.Title)" -ForegroundColor Yellow
}

function Clear-CompletedTodos {
    $todos = Get-Todos
    $remaining = @($todos | Where-Object { -not $_.Done })
    Save-Todos $remaining
    Write-Host "Cleared $($todos.Count - $remaining.Count) completed task(s)." -ForegroundColor Yellow
}

try {
    switch ($Command) {
        'add'    { Add-Todo $Value }
        'list'   { Show-Todos }
        'done'   { Complete-Todo $Value }
        'remove' { Remove-Todo $Value }
        'clear'  { Clear-CompletedTodos }
        'help'   { Get-Help $PSCommandPath -Detailed }
    }
}
catch {
    Write-Host "Error: $($_.Exception.Message)" -ForegroundColor Red
    exit 1
}
