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

`-TargetPath` -> C:\File Shares

`-Extension` -> .encrypted

`-Key` -> S4Xe7C57wbNVgmUss7xUjJOoICLdaW1Zgrks4s1hN4E=

### Other Global Variables

`TargetFiles` -> .pdf .mp3 .xls* .ppt* .doc* .mpg .mpeg .rtf .jpg .jpeg .png .gif

## Credits

The author of the [FileCryptography.psm1](FileCryptography.psm1) is Tyler Siegrist, and he is also credited in the module's docstring.
