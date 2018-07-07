cls
dism /Online /Cleanup-Image /startComponentCleanup
dism /Online /Cleanup-Image /RestoreHealth
sfc /scannow
pause