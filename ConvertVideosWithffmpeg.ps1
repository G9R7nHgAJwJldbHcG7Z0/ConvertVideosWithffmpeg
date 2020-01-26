#Written by Daniel Kill
#Modified: 2020-01-07 by Daniel Kill
Clear-Host

do
{
    [string]$dir = Read-Host -Prompt "What path"
    if (!(Test-Path $dir)) {Write-Warning -Message "*** Invalid Path ***"}
} until (Test-Path $dir)

Set-Location -Path $dir

[string]$filter = Read-Host -Prompt "What filter"

Get-ChildItem -Path $dir -Filter ("*" + $filter + "*") | ForEach-Object {ffmpeg -i ($PSItem.Name) -threads 4 -vcodec libx264 -crf 28 -acodec aac -f mp4 (($PSItem.BaseName) + "-NEW.mp4")}
