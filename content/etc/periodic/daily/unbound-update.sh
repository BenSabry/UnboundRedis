#!/bin/sh
echo ""
echo "$(date) $0 $@"

URL="https://www.nlnetlabs.nl/projects/unbound/download/#older-versions"
version_file="/etc/unbound/unbound.ver"

fetch_latest_unbound_version() {
    # Fetch the page content
    page_content=$(wget -qO- $URL)

    # Extract the latest version number
    latest_version=$(echo "$page_content" | grep -o 'Unbound [0-9]\+\.[0-9]\+\.[0-9]\+' | head -1 | grep -o '[0-9]\+\.[0-9]\+\.[0-9]\+')

    # Print the latest version
    echo "$latest_version"
}

read_current_unbound_version() {
    # Check if the file exists
    if [ -f "$version_file" ]; then
        current_version=$(cat "$version_file")
        echo "$current_version"
    else
        echo "0.0.0"
    fi
}

latest_version=$(fetch_latest_unbound_version)
current_version=$(read_current_unbound_version)

echo "Current version is: $current_version"

# Check if the versions are the same
if [ "$latest_version" = "$current_version" ]; then
    echo "No new versions found."
else
    echo "New version found:  $latest_version"

    # Run the build script
    ~/scripts/unbound-build.sh

    # Update the version file with the latest version
    echo "$latest_version" > "$version_file"
    echo "Update complete."
fi
