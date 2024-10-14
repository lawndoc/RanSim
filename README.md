![Logo](RanSim.png)

## Description

RanSim is a ransomware simulation script written in PowerShell. It recurisively encrypts files in the target directory using 256-bit AES encryption. RanSim will not leave any ransom note, it is only meant to perform file encryption.

You can use RanSim to test your defenses and backups against real ransomware-like activity in a controlled setting. The same script can be used to decrypt the files if needed.



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
