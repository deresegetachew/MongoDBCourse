# $inc

syntax

```
{ $inc: { <field1>: <amount1>, <field2>: <amount2>, ... } }
```

To specify a <field> in an embedded document or in an array, use dot notation.

**If the field does not exist, $inc creates the field and sets the field to the specified value.**

Use of the $inc operator on a field with a null value will generate an error.

$inc is an **atomic operation** within a single document.

> ## :zap: Examples:
> lets first populate our database with some data
>
> ``` db.inventory.deleteMany({}) ```

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

> Increment the age of  angela by 5
>
> ```js
>  db.students.update({name:'angela'},{$inc:{age:5}})
> ```
