$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$mainDir = "$(Split-Path -parent $toolsDir)"
$srcDir = "$(Join-Path -Path $mainDir -ChildPath 'src')"

$sourceFile = "$(Join-Path $srcDir 'mathmini.c')"
$mainFile = "$(Join-Path $srcDir 'main.c')"

$objectFile = "$(Join-Path $srcDir 'mathmini.o')"
$libFile = "$(Join-Path $srcDir 'libmathmini.lib')"
$dllFile = "$(Join-Path $srcDir 'mathmini.dll')"
$binFile = "$(Join-Path $srcDir 'mathmini.exe')"

# Object file (mathmini.o)
gcc -c -o "$objectFile" "$sourceFile"

# Static library (libmathmini.lib)
ar -rcs "$libFile" "$objectFile"

# Dynamic library (mathmini.dll)
gcc -shared -o "$dllFile" "$objectFile"

# Executable file (mathmini.exe)
gcc -o "$binFile" "$mainFile" -L "$srcDir" -lmathmini

Install-BinFile -Name 'mathmini' -Path "$binFile"
