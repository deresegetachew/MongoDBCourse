# $unset

Syntax

```js
{ $unset: { <field1>: "", ... } }
````

The `$unset` operator deletes a particular field.

When used with `$` to match an array element, `$unset` replaces the matching element with `null` rather than removing the matching element from the array. This behavior keeps consistent the array size and element positions.

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
> remove history score for donald
>
> ```js
> db.students.update({name:'donald'},{$unset:{"score.history":""}})
> ```
