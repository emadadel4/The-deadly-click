@echo off
setlocal

REM Run PowerShell command to read JSON file and extract process names
for /F "usebackq tokens=*" %%A in (`powershell -Command "(Get-Content 'Victim.json' | ConvertFrom-Json) | ForEach-Object { $_.names }"`) do (
    REM Iterate through each process name
    for %%B in (%%A) do (
        REM Kill the process
        taskkill /F /IM "%%B"
    )
)

echo All specified processes have been killed.
