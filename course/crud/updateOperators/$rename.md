# $rename

syntax:

```js
    {$rename: { <field1>: <newName1>, <field2>: <newName2>, ... } }
```

The `$rename` operator updates the name of a field

To specify a `<field>` in an embedded document, use dot notation.

If the document already has a field with the `<newName>`, the $rename operator removes that field and renames the specified `<field>` to `<newName>`.

If the field to rename does not exist in a document, $rename **does nothing** (i.e. no operation).

For fields in embedded documents, the `$rename` operator can rename these fields as well as move the fields in and out of embedded documents. **$rename does not work if these fields are in array elements.**

> lets first populate our database with some data
>
> ``` db.students.deleteMany({}) ```

```js
    db.students.insertMany([
        {
            name:'john',
            age:5,
            grade: 3,
            score: {
                maths: 80,
                english: 45,
                history: 67
            }
        },
        {
            name:'angela',
            age:8,
            grade: 4,
            score: {
                maths: 40,
                english: 65,
                history: 87
            }
        },
        {
            name:'john',
            age:12,
            grade: 7,
            score: {
                maths: 40,
                english: 45,
                history: 87
            }
        }
    ])
```

>
> rename grade to level
>
> ```js
>   db.students.updateMany({},{$rename:{'grade':'level'}})
> ```
