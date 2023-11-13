param (
    [string]$ruta = "C:\Ruta\Directorio\Origen",
    [string]$rutaDestino = "C:\Ruta\Destino"
)

# Verificar si se proporcionó el directorio de origen
if (-not $ruta) {
    Write-Host "Por favor, proporciona el directorio de origen."
    exit
}

# Verificar si se proporcionó la ruta de destino
if (-not $rutaDestino) {
    Write-Host "Por favor, proporciona la ruta de destino para la copia de seguridad."
    exit
}

# Combinar la ruta de destino con el nombre del directorio de origen para obtener la ruta completa de destino
$rutaCompletaDestino = Join-Path $rutaDestino (Split-Path $ruta -Leaf)

# Verificar si el directorio de origen existe
if (Test-Path $ruta) {
    # Crear la copia de seguridad
    Copy-Item -Path $ruta -Destination $rutaCompletaDestino -Recurse -Force
    Write-Host "Copia de seguridad completada. Directorio de destino: $rutaCompletaDestino"
} else {
    Write-Host "El directorio de origen '$ruta' no existe."
}
