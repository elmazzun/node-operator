#!/bin/bash

check() {
    if ! go version &> /dev/null; then
        echo "Go not installed, installing it..."
        curl -fsSLo- https://s.id/golang-linux | bash
        echo 'GOROOT="$HOME/go"' >> ~/.bashrc
        echo 'GOPATH="$HOME/go/packages"' >> ~/.bashrc
        echo 'PATH=$PATH:$GOROOT/bin:$GOPATH/bin' >> ~/.bashrc
    fi

    if ! operator-sdk &> /dev/null; then
        echo "operator-sdk not installed, installing it..."
        pushd /tmp
        readonly URL=https://github.com/operator-framework/operator-sdk/releases/download/v1.31.0
        curl \
            -LO \
            ${URL}/operator-sdk_linux_amd64
        chmod +x operator-sdk_linux_amd64
        sudo mv \
            operator-sdk_linux_amd64 \
            /usr/local/bin/operator-sdk
        popd
    fi
}
