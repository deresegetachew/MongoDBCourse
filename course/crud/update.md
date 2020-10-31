# Update Documents

update operations are made up two parts:

- the **query part**
- **the expression** to update it with. ``<update operator>:{<field>:value}``

To update documents mongodb gives us two modifiers:

- ```db.collection.update()```

- ```db.collection.findAndModify()```

# Update Operators

## Field Operators

| Name                                                               | Description                                                                                                                                   |
| ------------------------------------------------------------------ | --------------------------------------------------------------------------------------------------------------------------------------------- |
| [```$currentDate```](/course/crud/updateOperators/$currentDate.md) | sets the value of a field to current date , either as a Date or a TimeStamp                                                                   |
| [```$inc```](/course/crud/updateOperators/$inc.md)                 | Increments the value of the field by the specified amount                                                                                     |
| ```$min```                                                         | Only updates the field if the specified value is less than the existing field value                                                           |
| ```$max```                                                         | Only updates the field if the specified value is greater than the existing field value                                                        |
| [```$mul```](/course/crud/updateOperators/$mul.md)                 | Multiplies the value of the field by the specified amount.                                                                                    |
| [```$rename```](/course/crud/updateOperators/$rename.md)           | Renames a Field.                                                                                                                              |  |
| [```$set```](/course/crud/updateOperators/$set.md)                 | Sets the value of a field in a document                                                                                                       |
| [```$setOnInsert```](/course/crud/updateOperators/$setOnInsert.md) | Sets the value of a field if an update results in an insert of a document. Has no effect on update operations that modify existing documents. |
| [```$unset```](/course/crud/updateOperators/$unset.md)             | Removes the specified field from a document.                                                                                                  |

## Array Operators

| Name                  | Description                                                                                                                          |
| --------------------- | ------------------------------------------------------------------------------------------------------------------------------------ |
| ```$```               | Acts as a placeholder to update the first element that matches the query condition                                                   |
| ```$[]```             | Acts as a placeholder to update all elements in an array for the documents that match the query condition                            |
| ```$[<identifier>]``` | Acts as a placeholder to update all elements that match the arrayFilters condition for the documents that match the query condition. |
| ```$addToSet```       | Adds elements to an array if they do not already exist in the set                                                                    |
| ```$pop```            | Removes the first or last item of an array.                                                                                          |
| ```$pull```           | Removes all array elements that match a specified query.                                                                             |
| ```$push```           | Adds an item to an array.                                                                                                            |
| ```$pullAll```        | Removes all matching values from an array.                                                                                           |
| modifiers             |
| ```$each```           | Modifies the ```$push``` and ```$addToSet``` operators to append multiple items for array updates.                                   |
| ```$slice```          | Modifies the $push operator to limit the size of updated arrays.                                                                     |
| ```$sort```           | Modifies the $push operator to reorder documents stored in an array.                                                                 |
