<#
Author:Emmitt Houston
Summary: Output the list of security groups that contain with the partial name given
Created:
Last modified 3/30/19 - Added comments & linespacing
#>
# Prompt for the computer (with $) name or an ePanther
# Maybe figure out how to append the $ later to make computer name entry easier?
$member = read-host 'Enter the ePanther or a computer name (ex: ePanther or computername$): '

# Get the partial group name to search for membership of or list all group membership
$group = read-host 'What does the group contain with (ex: UITS-uFiles-SF-HR, or BFS) [enter for all]? '

# Create a hash Table for layout
#$GroupMembers = @{Expression={$_.GivenName};Label="First Name";width=25},@{Expression={$_.Surname};Label="Last Name";width=25},@{Expression={$_.Name};Label="ePanther";width=25}
#Get-ADGroupMember "$group" -recursive|select -ExpandProperty SamAccountName|get-aduser|select @{Name="First Name";expression={$_.GivenName}},@{Name="Last Name";Expression={$_.Surname}},@{Name="ePanther";Expression={$_.SamAccountName}}|export-csv -path "$group.csv" -NoTypeInformation
#Get-ADGroupMember "$group" -recursive|select -ExpandProperty SamAccountName|get-aduser|select @{Name="First Name";expression={$_.GivenName}},@{Name="Last Name";Expression={$_.Surname}},@{Name="ePanther";Expression={$_.SamAccountName}}|export-excel .\$group.xlsx -WorkSheetname $group+1

# Get group membership of the computer or ePanther entered
Get-ADPrincipalGroupMembership $member|select name|where {$_.Name -like "*$group*"}

exit 0
