##  SET CALENDAR ACCESS
# Purpose: Used to allow all users in a group to view all calendars
# It has been tested with Exchange 2010
# Author: Caleb Angelino
##

$userAccounts = get-mailbox -resultsize unlimited
ForEach ($user in $userAccounts)
{
    Add-MailboxFolderPermission -Identity ($user.UserPrincipalName + ":\Calendar") -User entire-company -AccessRights Reviewer
}
