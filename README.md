# RanSim

A ransomware simulation script written in PowerShell. It encrypts all extensions specified in the given directory and its subdirectories.

This script is extremely useful for testing your defenses and backups against real ransomware-like activity in a controlled setting.

## Usage

### Encrypt

```PowerShell
.\RanSim.ps1 -Mode encrypt
```

### Decrypt

```PowerShell
.\RanSim.ps1 -Mode decrypt
```

### Optional Parameters and Defaults

`-TargetPath` -> C:\RanSim

`-Extension` -> .encrypted

`-Key` -> Q5KyUru6wn82hlY9k8xUjJOPIC9da41jgRkpt21jo2L=

### Other Global Variables

`TargetFiles` -> .pdf .mp3 .xls* .ppt* .doc* .accd* .mpg .mpeg .rtf .txt .csv .jpg .jpeg .png .gif

## Credits

The author of the [FileCryptography.psm1](FileCryptography.psm1) is Tyler Siegrist, and he is also credited in the module's docstring.
