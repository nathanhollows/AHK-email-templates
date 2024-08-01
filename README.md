# AHK Email Templates

AHK Email Templates is an AutoHotkey script that boosts your email productivity by allowing you to quickly insert pre-defined templates into your emails. With the simple press of `Ctrl` + `Shift` + `t`, a menu pops up, letting you choose from a variety of templates stored in `.txt` files. This is perfect for responding to common inquiries, sending standard updates, or anything that you find yourself typing repeatedly.

## Features

- **Quick Access to Templates:** Use the `Ctrl` + `Shift` + `t` shortcut to open the template menu.
- **Customizable Templates:** Easily add, remove, or edit templates in the `Templates` folder.
- **Simple Folder Structure:** Organize your templates in folders, up to one level deep, for better management.
- **Lightweight and Easy to Use:** No complex installation or configuration required.

## Installation

1. Ensure you have AutoHotkey installed on your system. If not, download and install it from [https://www.autohotkey.com/](https://www.autohotkey.com/).
2. Clone this repository or [download the ZIP](https://github.com/nathanhollows/AHK-email-templates/archive/refs/heads/main.zip) file and extract it.
3. Navigate to the folder and double-click `TemplatesShortcut.ahk` to run the script.

## Usage

1. Prepare your `.txt` template files and place them inside the `Templates` folder. You can organize them in subfolders (one level deep) for better management.
2. With the script running, simply press `Ctrl` + `Shift` + `t` in any email field (e.g., in Outlook, Gmail, or any other email client that supports text insertion).
3. A menu will pop up listing all your templates. Use the arrow keys to navigate and press `Enter` to select the template you wish to insert.
4. The content of the selected template will be pasted into your email.

![image](https://github.com/nathanhollows/AHK-email-templates/assets/13064427/796e6b96-8922-4c15-a854-a4beb76e4f5d)

### Adding Templates

- To add a new template, create a `.txt` file in the `Templates` folder or within a subfolder. The script will automatically recognize new templates.

### Template Folders

- The script supports organizing templates in subfolders within the `Templates` folder. This is useful for categorizing templates by purpose, recipient, etc. Remember, folders can only be one level deep.

## Customization

You can customize the shortcut key or modify how templates are loaded by editing the `EmailTemplates.ahk` file. Please refer to the [AutoHotkey documentation](https://www.autohotkey.com/docs/) for guidance on script customization.

## Contributing

Contributions are welcome! Feel free to fork the repository and submit pull requests. If you find any issues or have suggestions for improvement, please open an issue.

## License

This project is licensed under the MIT License.
