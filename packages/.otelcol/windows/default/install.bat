@ECHO OFF

if not exist "C:\apica\" mkdir C:\apica

if not exist "C:\apica\otelcol" mkdir C:\apica\otelcol

powershell.exe -Command "Invoke-WebRequest -OutFile C:\apica\otelcol\otelcol-contrib_0.109.0_windows_amd64.tar.gz https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.109.0/otelcol-contrib_0.109.0_windows_amd64.tar.gz"

checkmd5 --hash=ed96fe60b2b2fecfc95df1da38cb3a11f7770d87e4e8b4a8afd102a113305b89d1f01a719b4fc98e525e1c0c5e1acfd05f2d91399ab725c01ec2bb73a49f2603 --file=C:\apica\otelcol\otelcol-contrib_0.109.0_linux_amd64.tar.gz && (
    cd C:\apica\otelcol
    tar -xzvf otelcol-contrib_0.109.0_windows_amd64.tar.gz
) ELSE (
    echo "Downloaded package files do not match checksum"
    exit 1
)
