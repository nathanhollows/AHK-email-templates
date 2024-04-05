#Persistent  ; Keeps the script running
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability

; Initialize MyMenu
Menu, MyMenu, Add
submenuArray := []  ; Array to keep track of submenus

; Define the hotkey Ctrl+Shift+T
^+t::
    MouseGetPos, mouseX, mouseY  ; Get current mouse position
    Menu, MyMenu, DeleteAll  ; Clear the existing items in the main menu
    submenuArray := []  ; Reset submenu tracking array

    ; Add .txt files directly under the Templates folder to the top of the menu
    Loop, Files, %A_ScriptDir%\Templates\*.txt
    {
        SplitPath, A_LoopFileFullPath, fileName  ; Extract the file name without path
        fileName := StrReplace(fileName, ".txt", "")  ; Remove file extension
        Menu, MyMenu, Add, %fileName%, FileAction  ; Add file to top-level menu
        Menu, MyMenu, Icon, %fileName%, shell32.dll, 2  ; Set text file icon
    }

    ; Loop through directories in the Templates folder
    Loop, Files, %A_ScriptDir%\Templates\*., D
    {
        dirName := A_LoopFileName  ; Get directory name
        dirPath := A_ScriptDir . "\Templates\" . dirName

        ; Skip if the directory has no .txt files
        if !FileExist(dirPath . "\*.txt")
            continue

        Menu, %dirName%, Add  ; Create a new submenu for each directory
        submenuArray.Push(dirName)  ; Add submenu name to tracking array

        ; Loop through text files in the directory
        Loop, Files, %dirPath%\*.txt
        {
            SplitPath, A_LoopFileFullPath, fileName  ; Extract the file name without path
            fileName := StrReplace(fileName, ".txt", "")  ; Remove file extension
            Menu, %dirName%, Add, %fileName%, FileAction  ; Add file to submenu
            Menu, %dirName%, Icon, %fileName%, shell32.dll, 2  ; Set text file icon
        }
        Menu, MyMenu, Add, %dirName%, :%dirName%  ; Add directory as submenu
        Menu, MyMenu, Icon, %dirName%, shell32.dll, 4 ; Set folder icon
    }
    Menu, MyMenu, Show, %mouseX%, %mouseY%  ; Show the menu at the mouse position
return

FileAction:
    ; Determine the correct file path
    if (A_ThisMenu = "MyMenu")
        filePath := A_ScriptDir . "\Templates\" . A_ThisMenuItem . ".txt"
    else
        filePath := A_ScriptDir . "\Templates\" . A_ThisMenu . "\" . A_ThisMenuItem . ".txt"

    ; Check if the file exists and read it as UTF-8
    if FileExist(filePath) {
        file := FileOpen(filePath, "r")  ; Open the file for reading
        file.Encoding := "UTF-8"  ; Set file encoding to UTF-8
        fileContent := file.Read()  ; Read the entire file
        file.Close()  ; Close the file

        Clipboard := fileContent  ; Copy the file content to the clipboard

        ; Wait for the clipboard to contain data
        ClipWait, 0.25

        ; Optional: Paste the content immediately
        Send ^v

        ; Delete all submenus
        for index, submenu in submenuArray
        {
            Menu, %submenu%, DeleteAll
        }

        ; Delete the main menu
        Menu, MyMenu, DeleteAll

    } else {
        MsgBox, 48, Error, File not found: %filePath%
    }
return
