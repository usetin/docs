#!/bin/sh
# Runs the docs check: tools/ci/run.sh [COMPILER]. TIN_ROOT is a tin checkout (default ../tin); its
# compiler is built from the checked-in seed when it is missing.
set -e
cd "$(dirname "$0")/../.." || exit 1
tin_root=${TIN_ROOT:-../tin}
tin_root=$(cd "$tin_root" && pwd)
compiler=${1:-$tin_root/bin/tinc}
case $compiler in /*) ;; *) compiler=$PWD/$compiler ;; esac
if [ ! -x "$compiler" ]; then
	make -s -C "$tin_root" bin/tinc
	compiler=$tin_root/bin/tinc
fi
mkdir -p bin/ci
TIN_ROOT=$tin_root "$compiler" -o bin/ci/docs_check tools/ci/docs_check.tin
TIN_ROOT=$tin_root bin/ci/docs_check "$compiler"
