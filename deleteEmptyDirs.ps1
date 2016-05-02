##  DELETE EMPTY DIRS
# Purpose: Finds empty folders in a directory and deletes them based on matching names
# Author: Caleb Angelino
##

# Where do you want to search?
$rootPath = "c:\Your Folder Here"

# Create a variable that stores a list of empty dirs that don't contain any other empty dirs
$folders = Get-ChildItem $rootPath -Recurse -Directory: $true
$emptyFolders = $folders | ? { $_.GetFiles().Count -eq 0 -and $_.GetDirectories().Count -eq 0 }

foreach ($folder in $emptyFolders)
{
    # What are the dirs that you want to delete named?
    if ($folder.Name -like "<Deleted Folder Name>" -or $folder.Name -like "<Deleted Folder Name>")
    {
        # Log deletion to the console
        Write-Host -ForegroundColor Cyan "Removing: $($folder.FullName)"

        # Log deletion of dir into a "removed" file
        Write-Output "Removing: $($folder.FullName)" | Add-Content C:\removed.txt

        # Delete dir
        Remove-Item $folder.FullName -Confirm:$false
    }
    else
    {
        # Log skipped dir to console and "safe" file
        Write-Host -ForegroundColor Yellow "Skipping: $($folder.FullName)"
        Write-Output "Skipping: $($folder.FullName)" | Add-Content C:\safe.txt
    }

}