# Tin documentation: the pages and the design notes.
#
#   make check    every page and every ```tin block, with a tin checkout (TIN, default ../tin)
#
# TIN points at a checkout of usetin/tin (the compiler, runtime, std and packages); it is built from
# its checked-in seed when needed.
TIN ?= ../tin

.PHONY: check

check:
	TIN_ROOT=$(abspath $(TIN)) sh tools/ci/run.sh $(abspath $(TIN))/bin/tinc
