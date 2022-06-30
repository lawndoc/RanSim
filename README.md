![ASCII Logo](https://user-images.githubusercontent.com/24688343/176761856-2e1a02cf-0a72-4b5b-8f8f-5025ca9d8954.png)

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

`TargetFiles` -> .pdf .xls* .ppt* .doc* .accd* .rtf .txt .csv .jpg .jpeg .png .gif .avi .midi .mov mp3 .mp4 .mpeg .mpeg2 .mpeg3 .mpg .ogg

## Credits

The author of the [FileCryptography.psm1](FileCryptography.psm1) is Tyler Siegrist, and he is also credited in the module's docstring.
