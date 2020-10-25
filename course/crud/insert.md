# Insert Documents

- if _id field is omitted when we insert a document, MongoDB driver automatically generates an ObjectId for the_id field. This also applies to documents inserted through update operations.

- All write operations in MongoDB are **atomic** on the **level of a single document**.

| Insert method                           | Description                                                        | Multi Document Transaction | Creates Collection On Successful write |
| --------------------------------------- | ------------------------------------------------------------------ | :------------------------: | :------------------------------------: |
| ```db.collection.insertOne()```         | Inserts a single document into a collection.                       |  :ballot_box_with_check:   |        :ballot_box_with_check:         |
| ```db.collection.insertMany()```        | Inserts multiple Documents into a collection                       |  :ballot_box_with_check:   |        :ballot_box_with_check:         |
| ```db.collection.insert()```            | inserts a single document or multiple documents into a collection. |  :ballot_box_with_check:   |        :ballot_box_with_check:         |
|                                         |
| ```db.collection.update()```            | when used with ```usert:true``` option                             |  :ballot_box_with_check:   |                                        |
| ```db.collection.updateOne()```         | when used with ```usert:true``` option                             |  :ballot_box_with_check:   |                                        |
| ```db.collection.updateMany()```        | when used with the ```upsert: true```option.                       |  :ballot_box_with_check:   |                                        |
| ```db.collection.findAndModify()```     | when used with the ```upsert: true```option.                       |  :ballot_box_with_check:   |                                        |
| ```db.collection.findOneAndUpdate()```  | when used with the ```upsert:true```option.                        |  :ballot_box_with_check:   |                                        |
| ```db.collection.findOneAndReplace()``` | when used with the ```upsert:true```option.                        |  :ballot_box_with_check:   |                                        |

## db.collection.insertOne()

```
db.collection.insertOne(
   <document>,
   {
      writeConcern: <document>
   }
)
```

| Parameter      | Type     | Description                                                                                                                                                                                                                                                                                                                                                        |
| -------------- | -------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `document`     | document | A document to insert into the collection.                                                                                                                                                                                                                                                                                                                          |
| `writeConcern` | document | **Optional**. A document expressing the write concern. Omit to use the default write concern (i.e. w:1). <br> <br> Do not explicitly set the write concern for the operation if run in a transaction. To use write concern with transactions, see [Transactions and Write Concern](https://docs.mongodb.com/manual/core/transactions/#transactions-write-concern). |

Returns: A document containing:

- A boolean acknowledged as true if the operation ran with write concern or false if write concern was disabled.
- A field insertedId with the _id value of the inserted document.

> **:zap: Hands On**: <br>
> execute the commands below and see what is the response of the operation; make sure you are on `training_db` <br>
>
> ``` db.products.insertOne({item:'Iphone8' , qty:5}) ``` <br>
>
> ```db.products.insertOne({_id:002,item:'fastCharger', qty: 14})``` <br>
>
> ```db.products.insertOne({_id:002,item:'Iphone9', qty: 99})``` <br>
>
> ```db.products.insertOne({item:"Samsung Galaxy 10", qty:5},{writeConcern:{w:"majority"}})``` <br>
>
> pause 1 of the secondary replica containers ```docker pause mongodb3``` and run the command below; you will get an error; what error did you get ?
>
>```db.products.insertOne({item:"hwawi  M10", qty:5},{writeConcern:{w:3,wtimeout:50}})```

## db.collection.insertMany()

```
db.collection.insertMany(
   [ <document 1> , <document 2>, ... ],
   {
      writeConcern: <document>,
      ordered: <boolean>
   }
)
```

| Parameter      | Type     | Description                                                                                                                                                                                                                                                                                                                |
| -------------- | -------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `document`     | document | An array of documents to insert into the collection.                                                                                                                                                                                                                                                                       |
| `writeConcern` | document | **Optional**. A document expressing the write concern. Omit to use the default write concern (i.e. w:1).                                                                                                                                                                                                                   |
| `ordered`      | boolean  | **Optional**. A boolean specifying whether the `mongod` instance should perform an ordered or unordered insert. Defaults to `true`.  <br><br>Excluding Write Concern errors  ***ordered operations* stop after an error**, while **unordered operations continue to process any remaining write operations in the queue**. |

Returns: A document containing:

- A boolean **acknowledged** as true if the operation ran with write concern or false if write concern was disabled
- An array of _id for each successfully inserted documents

> **:zap: Hands On**: <br>
> execute the commands below and see what is the response of the operation; make sure you are on `training_db` <br>
>
> - ```db.alphabets.insertMany([{'letter':'A'},{'letter':'B'}, {'letter':'c'},{'letter':'d'}])``` what did you get ? <br>
>
> - ``` db.alphabets.deleteMany({}) ``` //clean the collection for the next example
>
> - ```db.alphabets.insertMany([{_id:001,letter:'A'},{_id:001, letter:'B'},{_id:002, letter:'C'}],{ordered:true})```  you should get an error bc of duplicate Ids but check which items were inserted ```db.alphabets.find({})```
>
> - ``` db.alphabets.deleteMany({}) ``` //clean the collection for the next example
>
> - ```db.alphabets.insertMany([{_id:001,letter:'A'},{_id:001, letter:'B'},{_id:002, letter:'C'}],{ordered:false})```  you should get an error bc of duplicate Ids but check which items were inserted ```db.alphabets.find({})```
>
## db.collection.insert()

```
db.collection.insert(
   <document or array of documents>,
   {
     writeConcern: <document>,
     ordered: <boolean>
   }
)
```

| Parameter      | Type              | Description                                                                                                                                                                                                                                                                                                                                                                              |
| -------------- | ----------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `document`     | document or array | A document or array of documents to insert into the collection.                                                                                                                                                                                                                                                                                                                          |
| `writeConcern` | document          | **Optional**. A document expressing the write concern. Omit to use the default write concern.                                                                                                                                                                                                                                                                                            |
| `ordered`      | boolean           | **Optional**. If `true`, perform an ordered insert of the documents in the array, and if an error occurs with one of documents, MongoDB will return without processing the remaining documents in the array.<br><br>If `false`, perform an unordered insert, and if an error occurs with one of documents, continue processing the remaining documents in the array. Defaults to `true`. |  |
<!--
# db.collection.update()

```
db.collection.update(
   <query>,
   <update>,
   {
     upsert: <boolean>,
     multi: <boolean>,
     writeConcern: <document>,
     collation: <document>,
     arrayFilters: [ <filterdocument1>, ... ],
     hint:  <document|string>        // Available starting in MongoDB 4.2
   }
)
```

- Modifies an existing document or documents in a collection.
- The method can modify specific fields of an existing document or documents or replace an existing document entirely.
- by default updates a single document , if `multi:true` option is included it updates all documents that match the query criteria.

| Parameter    | Type                 | Description                                                                                                                                                |
| ------------ | -------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------- |
| query        | document             | The selection criteria for the update. The same query selectors as in the find() method are available.                                                     |
| update       | document or pipeline | The modification to apply                                                                                                                                  |
| upsert       | boolean              | **Optional**. if set to true, creates a new document when no document matches the query criteria. **the default value is false.**                          |
| multi        | boolean              | **Optional**. if set to true, updates multiple documents that meet the query criteria. if set to false updates on document, **the default value is false** |
| writeConcern | document             | **Optional** A document expressing the write concern. Omit to use the default write concern w: 1.                                                          |
| arrayFilters | array                | **Optional**:  An array of filter documents that determine which array elements to modify for an update operation on an array field.                       |

> **Access Control:** requires the following privileges on the specified collection.
>
> - update
> - find
> - insert
>
> default Role **readWrite** provides the required privileges.
<br><br><br>
<br>
> **:zap: Hands on** -->
