#!/usr/bin/env bash
# Pi-hole: A black hole for Internet advertisements
# (c) 2015, 2016 by Jacob Salmela
# Network-wide ad blocking via your Raspberry Pi
# http://pi-hole.net
# Updates the Pi-hole web interface
#
# Pi-hole is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 2 of the License, or
# (at your option) any later version.

source /usr/local/include/pihole/piholeInclude

rerun_pihole "$0" "$@"

WEB_INTERFACE_GIT_URL="${webInterfaceGitUrl}"
WEB_INTERFACE_DIR="${webRootAdmin}/admin"

main() {
    prerequisites
    if ! is_repo; then
        make_repo
    fi
    update_repo
}

prerequisites() {

    # web interface must already exist. this is a (lazy)
    # check to make sure pihole is actually installed.
    if [ ! -d "$WEB_INTERFACE_DIR" ]; then
        echo "$WEB_INTERFACE_DIR not found. Exiting."
        exit 1
    fi

    if ! type "git" > /dev/null; then
        apt-get -y install git
    fi
}

is_repo() {
    # if the web interface directory does not have a .git folder
    # it means its using the master.zip archive from the install
    # script.
    if [ ! -d "$WEB_INTERFACE_DIR/.git" ]; then
        return 1
    fi
    return 0
}

# removes the web interface installed from the master.zip archive and
# replaces it with the current master branch from github
make_repo() {
    # remove the non-repod interface and clone the interface
    rm -rf $WEB_INTERFACE_DIR
    git clone "$WEB_INTERFACE_GIT_URL" "$WEB_INTERFACE_DIR"
}

# pulls the latest master branch from github
update_repo() {
    # pull the latest commits
    cd "$WEB_INTERFACE_DIR"
    git pull
}

main
