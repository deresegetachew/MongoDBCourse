# Normalized Data models

![Data model!](/resources/normalized.svg)

Normalized data models describe relationships using references between documents

Normalized data models can best be used in the following circumstances:

- when embedding would result in duplication of data but would not provide sufficient read performance advantages to outweigh the implications of the duplication.
- To represent complex many-to-many relationships.
- To model large hierarchical data sets.

Normalized data models do not provide good read performance.

even not covered in this training to join collections,
MongoDB provides the aggregation stages:

- `$lookup` (Available starting in MongoDB 3.2)
- `$graphLookup` (Available starting in MongoDB 3.4)
