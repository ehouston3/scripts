<#
Author:Emmitt Houston
Summary: Output the list of security group members to a .csv file
#>
#Prompt for name of group
$group = read-host 'What group do you want to look up?'

#Hash Table for layout
#$GroupMembers = @{Expression={$_.GivenName};Label="First Name";width=25},@{Expression={$_.Surname};Label="Last Name";width=25},@{Expression={$_.Name};Label="ePanther";width=25}
Get-ADGroupMember "$group" -recursive|select -ExpandProperty SamAccountName|get-aduser|select @{Name="First Name";expression={$_.GivenName}},@{Name="Last Name";Expression={$_.Surname}},@{Name="ePanther";Expression={$_.SamAccountName}}|export-csv -path "$group.csv" -NoTypeInformation
#Get-ADGroupMember "$group" -recursive|select -ExpandProperty SamAccountName|get-aduser|select @{Name="First Name";expression={$_.GivenName}},@{Name="Last Name";Expression={$_.Surname}},@{Name="ePanther";Expression={$_.SamAccountName}}|export-excel .\$group.xlsx -WorkSheetname $group+1

exit 0