$files = ".bashrc",
         ".bashrc.Msys",
         ".bash_profile",
         ".gitconfig",
         ".git-prompt.sh",
         ".minttyrc",
         ".vim",
         ".vimrc"

function install {
    ForEach ($file in $files) {
        New-Item -Force -Path ~/$file -ItemType SymbolicLink -Value $PSScriptRoot/$file
    }
}

function clean {
    ForEach ($f in $files) {
        $fp = "$HOME\$f"
        if (Test-Path $fp) {
            write-host removing $fp
            (Get-Item $fp).Delete()
        }
    }
}

if ($args[0] -eq "-c") {
    clean
} else {
    install
}

