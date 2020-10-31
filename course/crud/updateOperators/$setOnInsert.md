# $setOnInsert

Syntax:

```js
db.collection.update(
   <query>,
   { $setOnInsert: { <field1>: <value1>, ... } },
   { upsert: true }
)
```

If an update operation with upsert: true results in an insert of a document, then `$setOnInsert` assigns the specified values to the fields in the document. If the update operation does not result in an insert, `$setOnInsert` does nothing.

> ## :zap: Examples:

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

> add a new student patrick and set his starting grades 10  for math and english
>
>```js
>  db.students.update(
>       {_id:4},
>       {
>           $set:{name:'patrick',age:10,grade:8},
>           $setOnInsert:{"score.maths":10}
>       },
>       {upsert:true})
>```
