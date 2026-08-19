# create-recovery-marker.ps1
# Run this in the Azure portal: open your VM > Operations > Run command > RunPowerShellScript,
# paste the contents of this file, and select Run.
#
# It writes a small "recovery marker" file that you use in later labs to prove that a
# backup or Site Recovery restore returned the exact data you expected.
# Your participant number (pNN) is detected automatically from the VM's computer name.

$team = ($env:COMPUTERNAME -replace '(?i)^.*-(p\d+)$', '$1').ToLower()
New-Item -Path 'C:\LabData' -ItemType Directory -Force | Out-Null
"$(Get-Date -Format o) team=$team" | Set-Content -Path 'C:\LabData\recovery-marker.txt'
Get-Content 'C:\LabData\recovery-marker.txt'
