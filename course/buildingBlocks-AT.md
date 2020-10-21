# Atomicity and Transactions

## Atomicity:

In MongoDB, **a write operation is atomic on the level of a single document**, even if the operation modifies multiple embedded documents within a single document.

## Multi-Document Transaction

When a single write operation (e.g. db.collection.updateMany()) modifies multiple documents, the modification of each document is atomic, but the operation as a whole is not atomic.

When performing multi-document write operations, whether through a single write operation or multiple write operations, other operations may interleave.

For situations that require atomicity of reads and writes to multiple documents (in a single or multiple collections), MongoDB supports multi-document transactions:

- In version 4.0, MongoDB supports multi-document transactions on replica sets.

- In version 4.2, MongoDB introduces distributed transactions, which adds support for multi-document transactions on sharded clusters and incorporates the existing support for multi-document transactions on replica sets.
