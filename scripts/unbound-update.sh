echo ""; 
echo "$(date) $0 $@";

start="..."
end="completed"

tmp="/tmp/unbound"
build="$tmp/build"

# # download
echo "files download $start"
{
    mkdir $tmp

    wget https://nlnetlabs.nl/downloads/unbound/unbound-latest.tar.gz -P $tmp
    tar xzf $tmp/unbound-latest.tar.gz -C $tmp

    mv "$(ls -d $tmp/unbound-* | head -1)" "$build"
} &> /dev/null

# configure
echo "build configure $start"
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
    echo "build make $start"
    make &> /dev/null

    # stop unbound service
    echo "stop unbound service $start"
    service unbound stop &> /dev/null

    # install
    echo "build install $start"
    make install &> /dev/null
)

# generate unbound keys
echo "generate unbound keys $start"
unbound-control-setup
unbound-anchor -a /var/lib/unbound/root.key

# start unbound service
echo "start unbound service $start"
service unbound start

# clean
echo "remove temp files $start"
rm -rf $tmp &> /dev/null

echo "installation $end"
