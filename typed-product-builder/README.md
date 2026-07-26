# typed-product-builder

A type-level product/record-builder experiment over `generic-lens` and
`generics-sop`.

Internal to lithon and unpublished; APIs change without notice. Not built
for high-performance paths — the representation would need to be
array-backed (à la `ARec`) first — but fine for CLI tooling and run-once
setup code.

The intended combinator grammar (and what hardening for publication would
take) is still being sketched; open an issue if you're curious where it's
headed.
