@echo off

echo "BIS Updater V1.0.102 08 April 2023"
timeout 3

IF EXIST BISUPDATE RMDIR BISUPDATE

color 0A
echo "Memulai Download File ..."
git clone https://github.com/DevCode0X0/BISUPDATE.git
echo "Download Selesai"
timeout 2

@echo off
cls
setlocal

REM 1.Copy bis.exe ke folder yang sama
echo f | xcopy /f /y BISUPDATE\bis.exe bis.exe
REM Selesai baris "1"

REM 2. Periksa ketersediaan tiap folder BIS, apabila ada maka akan ikut dicopy
IF EXIST D:\ProgramLocal (    
    echo f | xcopy /f /y BISUPDATE\bis.exe D:\ProgramLocal\bis.exe 
)
IF EXIST D:\ProgramWEB (    
    echo f | xcopy /f /y BISUPDATE\bis.exe D:\ProgramWEB\bis.exe 
)
IF EXIST D:\ProgramATS\ATS (    
    echo f | xcopy /f /y BISUPDATE\bis.exe D:\ProgramATS\ATS\bis.exe 
)
IF EXIST D:\ProgramATS\ATS-SQL (    
    echo f | xcopy /f /y BISUPDATE\bis.exe D:\ProgramATS\ATS-SQL\bis.exe 
)
REM Selesai baris "2"

REM 2. Periksa ketersediaan tiap folder BIS dan Reports, apabila ada maka akan ikut dicopy
IF EXIST BISUPDATE\Reports (
    IF NOT EXIST Reports (
        MKDIR Reports
    )
    echo f | xcopy /s /y BISUPDATE\Reports Reports
    IF EXIST D:\ProgramLocal (
       IF NOT EXIST Reports (
        MKDIR Reports
        )
        echo f | xcopy /s /y BISUPDATE\Reports D:\ProgramLocal\Reports\
    )
    IF EXIST D:\ProgramWEB (
       IF NOT EXIST Reports (
        MKDIR Reports
        )
        echo f | xcopy /s /y BISUPDATE\Reports D:\ProgramWEB\Reports\
    )
    IF EXIST D:\ProgramATS\ATS (
       IF NOT EXIST Reports (
        MKDIR Reports
        )
        echo f | xcopy /s /y BISUPDATE\Reports D:\ProgramATS\ATS\Reports\
    )
    IF EXIST D:\ProgramATS\ATS-SQL (
       IF NOT EXIST Reports (
        MKDIR Reports
        )
        echo f | xcopy /s /y BISUPDATE\Reports D:\ProgramATS\ATS-SQL\Reports\
    ) 
)
REM Selesai baris "3"

rmdir /s /q BISUPDATE

cls
color 09
echo "Update Selesai !"
timeout 2