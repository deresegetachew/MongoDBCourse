# Replication

it is a means of grouping of mongod processes that maintain the same data set.

Replication provides **redundancy** and **increases data availability**. With multiple copies of data on different database servers, replication provides a level of fault tolerance against the loss of a single database server.

In some cases, replication can provide **increased read capacity as clients can send read operations to different servers**. Maintaining copies of data in different data centers can increase data locality and availability for distributed applications. You can also maintain additional copies for dedicated purposes, such as disaster recovery, reporting, or backup.

<!-- ![on Read and on write Schema!](../resources/replicareadwrite.svg) -->
<img src="../../resources/replicareadwrite.svg" width="400" height="350">
<img src="../../resources/replicawithtwosecondaries.svg" width="450" height="300">
<br>

**Important Points**

- The minimum number of nodes to form a replica set is three
- There can only be one primary
- The primary node receives **all write operations**.
- The secondaries replicate the primary’s oplog and apply the operations to their data sets such that the secondaries’ data sets reflect the primary’s data set.
- By default, clients read from the primary; however, clients can specify a read preference to send read operations to secondaries.

<img src="../../resources/replicareadPreference.svg" width="400" height="350">

- If the primary is unavailable, an eligible secondary will hold an election to elect itself the new primary.
- Replica set cannot process write operations until the election completes successfully.

<!-- ![on Read and on write Schema!](../resources/replicawithtwosecondaries.svg=50x50) -->

<br>

<!-- ![on Read and on write Schema!](../resources/replicareadPreference.svg) -->
