
[string]$path_to_download = "C:\example"
[string]$path_to_file = $path_to_download + ""
[int]$i = 0

Function DownloadXML
($tree, $sessionOptions){
           foreach($fork in $tree){
           try{
               if($fork.Name -match "summary.xml"){
                    $localFileName = "C:/example" + $fork.FullName
                    $localFile = Get-Item $localFileName -ErrorAction Ignore
                    if($fork.LastWriteTime -ne $localFile.LastWriteTime){
                        #Write-Output($fork.LastWriteTime-$localFileName.LastWriteTime)
                        $xmlSaveName = "C:/example" + $fork.Fullname.Replace($fork.Name, "")
                        $session.GetFileToDirectory($fork.Fullname,$xmlSaveName, $false)
                    }
               }
               if($fork.FileType -eq "D" -and $fork.Name -notlike ".." -and $fork.Name -notlike "."){
                   $dirname = "C:/example" + $fork.FullName
                   mkdir $dirname -ErrorAction Ignore
                   $tree = $session.ListDirectory($fork.FullName).Files
                   DownloadXML $tree     
                   }
               
               
            
            } catch{
            
            
            }
           }
           }

           

Function tendertech(){
try
{
    Add-Type -Path "C:\example\WinSCP\WinSCPnet.dll"
 
    # Параметры подключения
    $sessionOptions = New-Object WinSCP.SessionOptions -Property @{
        Protocol = [WinSCP.Protocol]::Sftp
        #FtpMode  = [WinSCP.FtpMode]::Passive
        HostName = "example"
        UserName = "example"
        Password = "example"
        PortNumber = "22"
        SshHostKeyFingerprint = "PWEYHbexample2F8="
    }
 
    $session = New-Object WinSCP.Session
 
    try
    {
        # Открываем FTP сессию
        $session.Open($sessionOptions)
        $tree = $session.ListDirectory("/").Files
        DownloadXML $tree $sessionOptions
        # Вывод результата
    }
    finally
    {
        # Завершаем сессию
        $session.Dispose()
    }
 
}
catch
{
    Write-Host "Error: $($_.Exception.Message)"
    exit 1
}
}

Function ora2(){
try
{
    Add-Type -Path "C:\example\WinSCP\WinSCPnet.dll"
 
    # Параметры подключения
    $sessionOptions = New-Object WinSCP.SessionOptions -Property @{
        Protocol = [WinSCP.Protocol]::Sftp
        #FtpMode  = [WinSCP.FtpMode]::Passive
        HostName = "example"
        UserName = "example"
        Password = "example"
        PortNumber = "22"
        SshHostKeyFingerprint = "+o+T/sXnmexampleJR+noU="
    }
 
    $session = New-Object WinSCP.Session
 
    try
    {
        # Открываем FTP сессию
        $session.Open($sessionOptions)
        # Синхроним с удаленной площадкой ЦБ
        $synchronizationResult = $session.SynchronizeDirectories([WinSCP.SynchronizationMode]::Remote, "C:\example\", "/home/example", $true)
        # Остановка по ошибке
        $synchronizationResult.Check()
 
        # Вывод результата
    }
    finally
    {
        # Завершаем сессию
        $session.Dispose()
    }
 
    
}
catch
{
    Write-Host "Error: $($_.Exception.Message)"
    
}
}

Function work() {
    Write-Output "$(Get-Date)   Начало выгрузки на example"
    tendertech
    Write-Output "$(Get-Date)   Начало выгрузки на example"
    ora2
    Write-Output "$(Get-Date)   Конец выгрузки, пауза 5 минут"
    [System.GC]::Collect()
    Start-Sleep -Seconds 300
    work
}

work