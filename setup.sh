#!/bin/sh

uid="BenSabry/UnboundRedis"
url="https://github.com/$uid/archive/refs/heads/main.zip"
tmp="/tmp/$uid"
dir="$tmp"

#region core functions
download() {
    echo "Downloading $1"
    {(
        local url=$1
        local path=$2

        rm -rf $path
        mkdir -p $path
        cd $path

        wget "$url"

        zipfile="$(ls "$path/"*.zip | head -1)"
        unzip $zipfile -d "$path"
        rm $zipfile

        extracted="$(ls -d "$path/"* | head -n 1)"
        mv "$extracted"/* "$path"
        rmdir "$extracted"

    )} &> /dev/null
}
executable() {
    if [ -n "$2" ]; then
        find "$2" -type f -name "$1" -exec chmod +x {} \;
    else
        echo "executable(): exception, path argument can not be empty."
    fi
}
copy() {
    local src="$1"
    local dst="$2"

    # check if source exists
    if [ ! -e "$src" ]; then
        echo "Source $src does not exist."
        return 1
    fi

    # if it's a file
    if [ -f "$src" ]; then
        # if destination file exists
        if [ -e "$dst" ]; then
            # overwrite its content, not the file itself
            cat "$src" > "$dst"
        else
            # copy the file itself
            cp "$src" "$dst"
        fi

    # if it's a directory
    elif [ -d "$src" ]; then
        # make sure destination path exists
        mkdir -p "$dst"
        # iterate over directory content
        for item in "$src"/*; do
            # recursively call the function with child item
            copy "$item" "$dst/$(basename "$item")"
        done

    else
        echo "Source $src is neither a file nor a directory."
        return 1
    fi
}
#endregion

#region logic functions
srcroot="$dir/content"
dstroot="/"

presetup() {
    download $url $tmp

    executable "*" "$srcroot/etc/init.d"
    executable "*" "$srcroot/etc/periodic"
    executable "*" "$srcroot/root/scripts"
    executable "*" "$dir/scripts"

    copy "$srcroot" "$dstroot"
}
setup() {
    for item in "$dir"/scripts/*; do
        "$item"
    done
}
postsetup() {
    copy "$srcroot" "$dstroot"

    # register and run init.d services
    for item in "$srcroot/etc/init.d"/*; do
        if [ -f "$item" -a -e "$item" ]; then
            local name="$(basename "$item")"
            rc-update add "$name" default
            service "$name" restart
        fi
    done

    rm -rf "$tmp"
}
#endregion

presetup
setup
postsetup

echo "Setup completed"
