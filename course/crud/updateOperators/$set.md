# $set

Syntax:

```js
{ $set: { <field1>: <value1>, ... } }
```

The $set operator replaces the value of a field with the specified value.

If the field does not exist, `$set` will add a new field with the specified value,

If you specify a dotted path for a non-existent field, $set will create the embedded documents as needed to fulfill the dotted path to the field.

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
            name:'donald',
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
> change the age of john to 14
>
> ```js
>   db.students.update({name:'john'},{$set:{age: 14}})
> ```
>
> for donald set score.physics 66
>
> ```js
>   db.students.update({name:'donald'},{$set:{"score.physics": 66}})
> ```
