# Building Blocks of MongoDb Database

 1. [Collections and Documents](/course/buildBlocks-collections.md)
 2. [BSON](/course/buildingBlocks-BSON.md)
 3. [Views]()

# Hands On :zap

## lets create a MongoDB

## lets create a Collection

## lets add a document to the collection

## lets query the collection

## lets query the document

## lets add a New field to our document

## Views

Mongodb View is a queryable object whose contents are defined by aggregation pipeline on other collections or views.
MongoDB does not persist the view contents to disk. A view’s content is computed on-demand when a client queries the view.

Write Operations against views are not supported. i.e. they are readonly

## Storage Engines

## Types

## Operators

### Query Operators

### Update Operators

### Aggregate

## Exit Code and Statuses

## Limitations

- The maximum BSON Document size is 16 megabyets.
  - Why ? it helps ensure that a single document can not use excessive amount of RAM or during transmission excessive amount of bandwidth. To store documents larger than the maximum size , Mongodb provides the GridFS API.
- Nested Depth for BSON Documents
  - MongoDb supports no more than 100 levels of nesting for BSON Documents.
- Naming restrictions
  - Database names are case **insensitive**
    - On Windows database names can not include ``` \/."$.<>:|? ``` and null character
    - on Linux/Unix systems database names can not contain ```/\. "$``` and null character
  - Collection Names
    - Should being with an underscore or a letter character
    - Can not
      - contain $
      - be an empty string
      - contain null character
      - begin with the system. prefix (reserved for internal use).
  - Field Names
    - Field names cannot contain the null character
    - Top field names can not contain the null character.

> to learn more please refere (<https://docs.mongodb.com/manual/reference/limits/#operations>)
