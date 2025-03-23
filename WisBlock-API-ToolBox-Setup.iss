; Sample script for creating an installer for a 64-bit Xojo desktop app
; To use this script, specify the values for the two constants
; below with those for your app and project.
; XojoAppName is the name of the build app without the ".exe" extension.
#define XojoAppName            "WisBlock-API-ToolBox"
; XojoProjectName is the name of the project file, including its extension.
#define XojoProjectName        "WisBlock-API-ToolBox.xojo_binary_project"

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID from the menu.)
AppId={{63E9E186-34FC-4133-B509-8A6A35E9F2C9}
AppName={#XojoAppName}
AppVerName={#XojoAppName} 1.0.0
AppPublisher=RAKwireless
AppPublisherURL=https://rakwireless.com
AppSupportURL=https://docs.rakwireless.com/product-categories/wisnode/rak10706/overview/
AppUpdatesURL=https://downloads.rakwireless.com/
DefaultDirName={pf}\\{#XojoAppName}
DefaultGroupName={#XojoAppName}
; save installer file alongside this script
OutputDir=.
OutputBaseFilename=Setup{#XojoAppName}
; If you have an End User License Agreement (EULA) that you want the user to agree to before letting the install continue,
; put the path to it here.
LicenseFile=
Compression=lzma
SolidCompression=yes
ChangesAssociations=yes
ArchitecturesInstallIn64BitMode=x64
; Require Windows 7 SP1 or later
MinVersion=6.1.7601
SetupIconFile=RAK-Whirl.ico

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

; These directories will be created by the installer inside the DefaultDirName
; (defined above).
[Dirs]
Name: "{app}\\{#XojoAppName} Libs"
Name: "{app}\\{#XojoAppName} Resources"

; These are the files to include.  By default you want to include
; the EXE plus the Libs and Resources folders
; but you can include any other files you like as well.
[Files]
Source: ".\\Builds - {#XojoAppName}\\Windows 64 bit\\{#XojoAppName}\\{#XojoAppName}.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: ".\\Builds - {#XojoAppName}\\Windows 64 bit\\{#XojoAppName}\\*"; DestDir: "{app}\\"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: ".\\Builds - {#XojoAppName}\\Windows 64 bit\\{#XojoAppName}\\{#XojoAppName} Libs\\*"; DestDir: "{app}\\{#XojoAppName} Libs"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: ".\\Builds - {#XojoAppName}\\Windows 64 bit\\{#XojoAppName}\\{#XojoAppName} Resources\\*"; DestDir: "{app}\\{#XojoAppName} Resources"; Flags: ignoreversion recursesubdirs createallsubdirs

; NOTE: Don't use "Flags: ignoreversion" on any shared system files

; Creates icons/links in the Start Menu and/or the desktop if the user chooses during installation.
[Icons]
Name: "{group}\\{#XojoAppName}"; Filename: "{app}\\{#XojoAppName}.exe";
Name: "{commondesktop}\\{#XojoAppName}"; Filename: "{app}\\{#XojoAppName}.exe"; Tasks: desktopicon;

; Give the user the option to run the app after the installation is finished.
[Run]
Filename: "{app}\\{#XojoAppName}.exe"; Description: "{cm:LaunchProgram,{#XojoAppName}}"; Flags: nowait postinstall skipifsilent

; This specifies the Visual C++ Windows Runtime Redistributable to also install because
; it is required by Xojo apps made with 2016r1 or later.
[Files]
Source: "C:\\Program Files\\Xojo\\Xojo 2024r4.1\\Extras\\Windows Runtime\\Installers\\VC_redist.x64.exe"; DestDir: {tmp}

[Run]
Filename: {tmp}\\VC_redist.x64.exe; Parameters: "/install /quiet /norestart"; StatusMsg: "Installing 64-bit Windows Universal runtime..."; Flags: waituntilterminated