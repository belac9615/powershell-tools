# This script is used to create sequentially numbered Public Folders on Exchange
# It has been tested with Exchange 2010

$Path = read-host "Please enter the path with a trailing \"
# If you want to script your path, comment out the above line and modify below
# $Path = "\Your Public Folder\"

#Capture the starting and ending number from the user
[int]$StartingFolder = read-host "Please enter the starting number"
[int]$EndingFolder = read-host "Please enter the ending number"

#Check to make sure the user put in a starting number
If (-not $StartingFolder){
    Write-Output "You must enter a number."
    Exit
}

#Check to see if the ending folder number is higher than the starting number
If ($EndingFolder -le $StartingFolder){
    Write-Output “The ending folder number must be larger than the starting folder number.”
    Exit
}

#Loop and create all folders in between the two numbers that were captured
for ($i=$StartingFolder ; $i -le $EndingFolder; $i++) {
    New-PublicFolder -Name $i -Path $Path
    $pubFolder = $Path + $i + "\"
    Enable-MailPublicFolder -Identity $pubFolder
}