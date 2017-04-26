# Set deploy directory on target server
$deployDirectory = "/tmp/mrpdeploy_" + [System.Guid]::NewGuid().toString()
Write-Host "##vso[task.setvariable variable=deployDirectory;]$deployDirectory"