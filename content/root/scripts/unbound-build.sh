#!/bin/sh
echo ""
echo "$(date) $0 $@"

url="https://nlnetlabs.nl/downloads/unbound/unbound-latest.tar.gz"
path="/tmp/UnboundBuild"
build="$path/extracted"

echo "Downloading $url"
{(
    rm -rf $path
    mkdir -p $path
    cd $path

    wget $url
    tar xzf "$(ls $path/*.tar.gz | head -1)"
    mv "$(ls -d $path/*/ | head -n 1)" $build
)} &> /dev/null

# configure
echo "Configuring build options"
(
    cd $build

    ./configure \
        CFLAGS="-O2" \
        --build=x86_64-alpine-linux-musl \
        --host=x86_64-alpine-linux-musl \
        --prefix=/usr \
        --exec-prefix=/usr \
        --sysconfdir=/etc \
        --localstatedir=/var \
        --with-chroot-dir= \
        --with-conf-file=/etc/unbound/unbound.conf \
        --with-rootkey-file=/var/lib/unbound/root.key \
        --with-pidfile=/etc/unbound/unbound.pid \
        --enable-cachedb \
        --with-libhiredis \
        --with-libevent \
        --enable-checking \
        --disable-option-checking \
        --disable-maintainer-mode \
        --disable-silent-rules \
        --disable-rpath \
        --enable-tfo-client \
        --enable-tfo-server \
        &> /dev/null

    # build
    echo "Building unbound from source"
    make &> /dev/null

    # stop unbound service
    echo "Stopping unbound"
    service unbound stop &> /dev/null

    # install
    echo "Installing new built unbound"
    make install &> /dev/null
)

# generate unbound keys
echo "Generating unbound-control keys"
unbound-control-setup &> /dev/null

echo "Generating unbound-anchor key"
unbound-anchor -a /var/lib/unbound/root.key &> /dev/null

# start unbound service
echo "Starting unbound"
service unbound restart

# clean
echo "Removing installation leftovers"
rm -rf $tmp &> /dev/null

echo "Completed installting new version"
