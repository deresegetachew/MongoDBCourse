# Journaling

## write ahead log (WAL)

In computer science  write-ahead Logging is a family of techniques for providing atomicity and durability (to of the ACID properties) in data base systems.
The changes are first recorded in the sequenced append only log, which must be written to stable storage, before the changes are written to the database.

### Why do we need WAL give me an example

Imagine a program that is in the middle of performing some operation when the machine it is running on loses power. Upon restart, that program might need to know whether the operation it was performing succeeded, succeeded partially, or failed. If a write-ahead log is used, the program can check this log and compare what it was supposed to be doing when it unexpectedly lost power to what was actually done. On the basis of this comparison, the program could decide to undo what it had started, complete what it had started, or keep things as they are.

### How does that relate with Journaling

To provide durability in the event of a failure, MongoDB uses write ahead Logging (WAL) to on disk **journal** files.

Journaling writes data first to the journal and then to the core data files. MongoDB enables journaling by default for 64-bit builds of MongoDB version 2.0 and newer.

Journal files are pre-allocated and exist as files in the data directory.
MongoDB creates a subdirectory named journal under the dbPath directory.

WiredTiger journal files for MongoDB have a maximum size limit of approximately 100 MB.
Once the file exceeds that limit, WiredTiger creates a new journal file.

WiredTiger automatically removes old journal files to maintain only the files needed to recover from last checkpoint.

[Journaling](https://docs.mongodb.com/manual/core/journaling/) <br>
[write-ahead logging](https://martinfowler.com/articles/patterns-of-distributed-systems/wal.html) <br>
[how mongodb journaling works](https://www.mongodb.com/blog/post/how-mongodbs-journaling-works)
