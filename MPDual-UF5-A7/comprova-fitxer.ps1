function ComprovarFitxer {
    param (
        [string]$nomFitxer
    )

    if (Test-Path $nomFitxer -PathType Leaf) {
        Write-Host "El fitxer existeix en aquesta ruta."
    } else {
        Write-Host "No s'ha trobat el fitxer $nomFitxer."
    }

    $continuar = Read-Host -Prompt 'Vols continuar? (Sí/No)'
    if ($continuar -eq 'No') {
        exit
    }
}