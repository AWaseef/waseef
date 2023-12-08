$programa = Read-Host -Prompt 'Introdueix els noms dels programes que vols desinstal·lar (separats per una coma)'

$nomProgrames = $programa -split ',\s*'

foreach ($nomPrograma in $nomProgrames) {
    $programes = @(Get-WmiObject -Query "SELECT * FROM Win32_Product WHERE (Name LIKE '%$nomPrograma%')")

    if ($programes) {
        Write-Host "Aquests són els programes que coincideixen amb la teva cerca per $nomPrograma :"
        $i = 1
        foreach ($programa in $programes) {
            Write-Host ($i.ToString() + ": " + $programa.Name)
            $i++
        }

        $seleccions = Read-Host -Prompt 'Introdueix els números dels programes que vols desinstal·lar (separats per una coma)'

        $numSeleccions = $seleccions -split ',\s*'

        foreach ($seleccio in $numSeleccions) {
            $seleccio = [int]$seleccio # convert the string to an integer
            if ($seleccio -gt 0 -and $seleccio -le $programes.Count) {
                $programa = $programes[$seleccio - 1]
                $programaName = $programa.Name
                $programaID = $programa.IdentifyingNumber
                Write-Host "Desinstal·lant $programaName..."
                #Start-Process -FilePath "msiexec.exe" -ArgumentList "/X $programaID /qn" -Wait
                Write-Host "Desinstal·lat $programaName."
            } else {
                Write-Host "La selecció no és vàlida. No s'ha realitzat cap desinstal·lació."
            }
        }
    } else {
        Write-Host "No s'ha trobat cap programa que coincideixi amb la teva cerca per $nomPrograma."
    }
}