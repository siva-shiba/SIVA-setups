#!/bin/bash

# Sublime Textのリポジトリキーを追加
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/sublimehq-archive.gpg > /dev/null

# Sublime Textのリポジトリを追加
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list

sudo apt-get update
sudo apt-get install sublime-text -y

mkdir -p ~/.config/sublime-text/Packages/User/
cat << EOF > ~/.config/sublime-text/Packages/User/"Package Control.sublime-settings"
{
    "installed_packages":
    [
		"CodeMap",
		"ConvertToUTF8",
		"DoxyDoxygen",
		"LSP",
		"LSP-copilot",
		"LSP-pyright",
		"MarkdownEditing",
		"OmniMarkupPreviewer",
		"Package Control",
		"SublimeCodeIntel",
		"SublimeLinter",
		"SublimeLinter-flake8",
		"SublimeLinter-pydocstyle",
    ]
}
EOF