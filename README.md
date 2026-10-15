# PowerShell Practice

## `script.ps1`: command-line to-do list

A small to-do manager that saves tasks to `todos.json` next to the script.

```powershell
./script.ps1 add "Learn PowerShell pipelines" -Priority High   # add a task (Low | Normal | High)
./script.ps1 list                                               # show open tasks, highest priority first
./script.ps1 list -All                                          # include completed tasks
./script.ps1 done 1                                             # mark task #1 complete
./script.ps1 remove 1                                           # delete task #1
./script.ps1 clear                                              # delete all completed tasks
./script.ps1 help                                               # show built-in help
```

Concepts it practices: `param()` blocks with `ValidateSet`, functions, `[pscustomobject]`,
JSON round-tripping, `Where-Object` / `Sort-Object` pipelines, string formatting with `-f`,
and `try`/`catch` error handling.

### Ideas to extend it
- Add a `-Due` date and highlight overdue tasks
- Add an `edit` command to rename a task
- Add a `-Tag` parameter and filter `list` by tag
