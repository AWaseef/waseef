param (
    [string]$ruta = "C:\Ruta\Por\Defecto",
    [string]$nombreArchivo
)

# Verificar si se proporcionó el nombre del archivo
if (-not $nombreArchivo) {
    Write-Host "Por favor, proporciona el nombre del archivo o directorio."
    exit
}

# Combinar la ruta y el nombre del archivo para obtener la ruta completa
$rutaCompleta = Join-Path $ruta $nombreArchivo

# Verificar si el archivo o directorio existe
if (Test-Path $rutaCompleta) {
    Write-Host "El archivo o directorio '$nombreArchivo' se encuentra en la ruta: $rutaCompleta"
} else {
    Write-Host "No se encontró el archivo o directorio '$nombreArchivo' en la ruta: $rutaCompleta"
}
