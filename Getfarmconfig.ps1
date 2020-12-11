add-pssnapin "microsoft.sharepoint.powershell" 
Write-Warning "This is only a test to gather SharePoint Farm information"

# Save the current execution policy so it can be reset
$SaveExecutionPolicy = Get-ExecutionPolicy
Set-ExecutionPolicy RemoteSigned -Scope Currentuser


Write-Host "spserviceapplication" 
"Service Applications" | Out-File -FilePath c:\temp\spfarmconfig.txt
get-spserviceapplication | select name >> c:\temp\spfarmconfig.txt |Out-GridView


Write-Host "spwebapplication"
"SharePoint Web Applications" | Out-File -FilePath c:\temp\spfarmconfig.txt -append
get-spwebapplication | select name >> c:\temp\spfarmconfig.txt


Write-Host "solutions"
"SharePoint Solutions" | Out-File -FilePath c:\temp\spfarmconfig.txt -append
get-spsolution >> c:\temp\spfarmconfig.txt

Write-Host "Service Applications"
"SharePoint Service Applications" | Out-File -FilePath c:\temp\spfarmconfig.txt -append
get-spserviceapplication >> c:\temp\spfarmconfig.txt

Write-Host "Service Applications Name Only"
"SharePoint Service Applications Display Name" | Out-File -FilePath c:\temp\spfarmconfig.txt -append
get-spserviceapplication | select displayname >> c:\temp\spfarmconfig.txt



Write-Host "serviceapplicationpools"
"Service Application Pools" | Out-File -FilePath c:\temp\spfarmconfig.txt -append
get-spserviceapplicationpool >> c:\temp\spfarmconfig.txt

Write-Host "servers"
"Servers List" | Out-File -FilePath c:\temp\spfarmconfig.txt -append
get-spserver >> c:\temp\spfarmconfig.txt

Write-Host "managed accounts"
"Managed Accounts" | Out-File -FilePath c:\temp\spfarmconfig.txt -append
get-spmanagedaccount >> c:\temp\spfarmconfig.txt

Write-Host "content database"
"SharePoint content databases" | Out-File -FilePath c:\temp\spfarmconfig.txt -append
get-spcontentdatabase | select name >> c:\temp\spfarmconfig.txt

Write-Host "datbaselist"
"All SharePoint databases" | Out-File -FilePath c:\temp\spfarmconfig.txt -append
get-spdatabase | select name >> c:\temp\spfarmconfig.txt

Write-Host "sites" 
"SharePoint sites" | Out-File -FilePath c:\temp\spfarmconfig.txt -append
get-spsite | select url,contentdatabase >> c:\temp\spfarmconfig.txt

Write-Host "Compability"
"SharePoint compatiblity settings" | Out-File -FilePath c:\temp\spfarmconfig.txt -append
Get-SPSite -Limit all >> c:\temp\spfarmconfig.txt 

Write-Host "Sites size in MB" 
"SharePoint sites size in MB" | Out-File -FilePath c:\temp\spfarmconfig.txt -append
Get-SPSite | select url, @{label="Size in MB";Expression={$_.usage.storage/1MB}} | Sort-Object -Descending -Property "Size in MB" | Format-Table –AutoSize >> c:\temp\spfarmconfig.txt 

Write-Host "Completed. Thank you!" 
Write-Host "Author: Anthony Teekah" 

# Reset the execution policy to the original state
Set-ExecutionPolicy $SaveExecutionPolicy -Scope Currentuser