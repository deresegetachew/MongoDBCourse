# Delete Documents

- we have two operators
  
  - `db.collection.deleteMany({<field>:<value>})`
    - Delete at most a single document that match a specified filter even though multiple documents may match the specified filter.
    - you can also use query operators:
      - `db.collection.deleteMany({<field>:{<operator1>:<value>},...})`
  - `db.collection.deleteOne({<field>:value})`
    - Delete all documents that match a specified filter.
    - you can also use query operators
      - `db.collection.deleteOne({<field>:{<operator1>:<value>},...)`
  - `db.collection.remove()`
    - delete a single document or all documents that match a specified filter.
  
  - `db.collection.findOneAndDelete(filter, options)`

  - ```js
        db.collection.findOneAndDelete(
            <filter>,
            {
                projection: <document>,
                sort: <document>,
                maxTimeMS: <number>,
                collation: <document>
            }
        )
    ```

    - Deletes the first matching document in the collection that matches the filter.
    - The sort option allows for the deletion of the first document sorted by the specified order.
  
  - `db.collection.findAndModify()` if remove option is set to true, it will remove the document specified in the **query** field. the default is false

    ```js
        db.collection.findAndModify({
            query: <document>,
            sort: <document>,
            remove: <boolean>,
            update: <document or aggregation pipeline>,
            new: <boolean>,
            fields: <document>,
            upsert: <boolean>,
            bypassDocumentValidation: <boolean>,
            writeConcern: <document>,
            collation: <document>,
            arrayFilters: [ <filterdocument1>, ... ]
    });
    ```

please play with above operations with the already existing collections you have.
