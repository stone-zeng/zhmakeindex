setlocal
%~d0
cd %~p0

for /f "delims=" %%i in ('hg parent --template "{rev}({node|short})"') do set Revision=%%i
set FLAGS=-ldflags "-s -w -X main.Revision %Revision%"

set GOOS=windows
set GOARCH=386
go build %FLAGS% -o bin/windows_x86/zhmakeindex.exe
set GOARCH=amd64
go build %FLAGS% -o bin/windows_x64/zhmakeindex.exe

set GOOS=linux
set GOARCH=386
go build %FLAGS% -o bin/linux_x86/zhmakeindex
set GOARCH=amd64
go build %FLAGS% -o bin/linux_x64/zhmakeindex

set GOOS=darwin
set GOARCH=386
go build %FLAGS% -o bin/darwin_x86/zhmakeindex
set GOARCH=amd64
go build %FLAGS% -o bin/darwin_x64/zhmakeindex

endlocal
