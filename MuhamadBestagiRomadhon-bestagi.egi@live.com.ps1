#Script template
function listChildFolder($folderPath) {
    #write your script here

    #checking object folder path before starting sorting object
    #this checking folder not spend time because prevent enumeration
    #but have a limitation on doesn't exist folder path
    #please ignore the message and focus on Error messages
    if((Get-ChildItem $folderPath | Select-Object -First 1 | Measure-Object).Count -eq 0){"Folder Empty"}

    try{
        Get-ChildItem $folderPath -ErrorAction Stop | Select-Object LastWriteTime, Name | Sort-Object LastWriteTime -Descending
    }

    Catch {
        Write-Host "Error :" $_.Exception.Message -ForegroundColor Red
    }
    
    return
    }
#Example call function, remove the "#" sign below to a call, dont forget to configure a path
#listChildFolder -folderPath D:\Test

function compareTwoFiles($firstFilePath, $secondFilePath) {
    #write your script here
    $size1 = ((Get-Item $firstFilePath).Length)
    $size2 = ((Get-Item $secondFilePath).Length)

    if ($size1 -gt $size2) {
        [io.path]::GetFileName($firstFilePath)
    }
    ElseIf ($size1 -lt $size2) {
        [io.path]::GetFileName($secondFilePath)
    }
    Else {
        "both file has same size"
    }


return
}
#Example call function, remove the "#" sign below to a call, dont forget to configure a path
#compareTwoFiles -firstFilePath "D:\Test\File 1" -secondFilePath "D:\Test\File 2"