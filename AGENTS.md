# Agent instructions (Tin documentation)

This repository is the documentation of Tin: the language reference, the tooling, the runtime and
compiler guides, the design notes (`design/`) and the architecture. The language and its toolchain
live in [usetin/tin](https://github.com/usetin/tin); the benchmarks in usetin/bench; the programs
written in Tin in usetin/tit, usetin/tinhub and usetin/tinland.

## Check

```sh
git clone git@github.com:usetin/tin.git ../tin   # or anywhere: TIN=/path/to/tin
make check     # or: TIN_ROOT=../tin sh tools/ci/run.sh ../tin/bin/tinc
```

The check is `tools/ci/docs_check.tin` (the rules in `tools/ci/docscheck`): every page is edition 1
(the forms edition 1 removed are listed there), every fenced block names its language, and every
fenced Tin block compiles with the tin checkout's compiler. Attributes after the language word
(`body`, `error`, `old-syntax`, `file=NAME`) change how a block is compiled; a `<!-- tin-prelude`
comment above a fence holds declarations the reader does not need.

## Rules

- `STDLIB.md` and `COVERAGE.md` are generated: `STDLIB.md` from the comments in the tin repository's
  `toolchain/std/` and `packages/` (`sh tools/ci/tin.sh tools/gen/gendoc.tin` there), `COVERAGE.md`
  from `design/coverage.md`. Regenerate, never hand-edit, and land the change with its source.
- `ERRORS.md` is the contract the compiler's diagnostics are checked against (in the tin repository:
  `tools/gen/genfixes.tin` makes `toolchain/compiler/fixes.tin` from the page, and
  `tools/ci/diagnostics_check.tin` requires every example to print what the page shows). A new
  diagnostic lands here and in the compiler together.
- Keep links inside this repository relative (`design/x.md`, `../LANGUAGE.md` from `design/`).
- The pages say "Linux is production, macOS is development"; keep that distinction.
