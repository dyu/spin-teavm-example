#!/bin/sh

set -e

function follow_symlink() {
    UNAME=`uname`
    case "$UNAME" in
        Darwin)
        /bin/zsh -c "print -lr -- $1(:A)"
        ;;
        *)
        readlink -f "$1"
        ;;
    esac
}

JAVA_HOME=`follow_symlink ../../../dotdirs/sdkman/candidates/java/20-librca` spin build
[ "$1" = "run" ] && spin up
