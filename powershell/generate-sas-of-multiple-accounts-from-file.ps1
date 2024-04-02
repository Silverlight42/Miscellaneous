Clear-Host

<# 
    az-accounts.properties file:
    accountName=acconutKey
#>

$propsFilePath = Join-Path -Path $PSScriptRoot -ChildPath az-accounts.properties
$properties = ConvertFrom-StringData (Get-Content $propsFilePath -Raw)

$properties.GetEnumerator() | ForEach-Object -Process {
    $accountName = $_.Key
    $key = $_.Value

    $ctx = New-AzStorageContext -StorageAccountName $accountName -StorageAccountKey $key    
    $token = New-AzStorageAccountSASToken -Service Blob,Table `
        -ResourceType Service,Container,Object `
        -Permission rwdxftlacup `
        -StartTime (Get-Date).AddDays(-1) `
        -ExpiryTime (Get-Date).AddMonths(6) `
        -Context $ctx

    $output = New-Object PSObject -Property @{
        AccountName = $accountName
        Token = $token
    }

    $output
} | Format-Table -Property AccountName, Token -AutoSize
