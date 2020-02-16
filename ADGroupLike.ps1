<#
Author:Emmitt Houston
Summary: Output the list of security groups that contain with the partial name given
Created:
Last modified 3/30/19 - Added comments & linespacing
Last modified 2/3/2020 - Broadened searchbase since we are no longer in UITS only OU.
#>

# Prompt for the partial name of group
$group = read-host 'What does the group contain with (ex: UITS-uFiles-SF-HR, or BFS)?'

#Hash Table for layout
#$GroupMembers = @{Expression={$_.GivenName};Label="First Name";width=25},@{Expression={$_.Surname};Label="Last Name";width=25},@{Expression={$_.Name};Label="ePanther";width=25}
#Get-ADGroupMember "$group" -recursive|select -ExpandProperty SamAccountName|get-aduser|select @{Name="First Name";expression={$_.GivenName}},@{Name="Last Name";Expression={$_.Surname}},@{Name="ePanther";Expression={$_.SamAccountName}}|export-csv -path "$group.csv" -NoTypeInformation
#Get-ADGroupMember "$group" -recursive|select -ExpandProperty SamAccountName|get-aduser|select @{Name="First Name";expression={$_.GivenName}},@{Name="Last Name";Expression={$_.Surname}},@{Name="ePanther";Expression={$_.SamAccountName}}|export-excel .\$group.xlsx -WorkSheetname $group+1

# Use a filter string with a search base of: ad.uwm.edu\UITS\Groups\Security
# Output any security groups containing the word provided
#get-adgroup -filter "Name -Like '*$group*'" -searchbase "OU=Security,OU=Groups,OU=UITS,DC=ad,DC=uwm,DC=edu"|select -expandproperty SamAccountName
get-adgroup -filter "Name -Like '*$group*'" -searchbase "DC=ad,DC=uwm,DC=edu"|select -expandproperty SamAccountName
exit 0
