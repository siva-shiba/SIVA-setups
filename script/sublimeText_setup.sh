#!/bin/bash

# Sublime Textのリポジトリキーを追加
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/sublimehq-archive.gpg > /dev/null

# Sublime Textのリポジトリを追加
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list

# インストール
sudo apt-get update
sudo apt-get install sublime-text sublime-merge -y

# パッケージの依存関係をインストール
pip install flake8 pydocstyle


# パッケージのインストール
mkdir -p ~/.config/sublime-text/Packages/User/
cat << EOF > ~/.config/sublime-text/Packages/User/"Package Control.sublime-settings"
{
    "installed_packages":
    [
        "AutoDocstring",
        "CodeMap",
        "ConvertToUTF8",
        "Dockerfile Syntax Highlighting",
        "LSP",
        "LSP-copilot",
        "LSP-pyright",
        "Markdown Extended",
        "MarkdownEditing",
        "OmniMarkupPreviewer",
        "Package Control",
        "Singularity Definition File Syntax",
        "SublimeCodeIntel",
        "SublimeLinter",
        "SublimeLinter-flake8",
        "SublimeLinter-pydocstyle",
    ]
}
EOF

# 設定の上書き
## tabの代わりにスペースをデフォルトで使用
cat << EOF > ~/.config/sublime-text/Packages/User/Preferences.sublime-settings
{
    "ignored_packages":
    [
        "Vintage",
    ],
    "font_size": 14,
    "index_files": true,
    "translate_tabs_to_spaces": true,
}
EOF


# github copilotの設定を促す
echo "copilotの設定をしてください"
echo "参考はこちら : https://github.com/TerminalFi/LSP-copilot"
echo "クリップボードに6桁のIDを保存しました"
echo "ブラウザを操作してください"
subl --command copilot_sign_in