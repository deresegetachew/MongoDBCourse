# $currentDate

Syntax:

```js
{ $currentDate: { <field1>: <typeSpecification1>, ... } }
```

The `$currentDate` operator sets the value of a field to the current date, either as a Date or a timestamp.
The default type is Date.

`<typeSpecification>` can be either:

a boolean true to set the field value to the current date as a Date, or a document `{ $type: "timestamp" }` or `{ $type: "date" }` which explicitly specifies the type.

The operator is **case-sensitive** and accepts only the **lowercase "timestamp" or the lowercase "date"**.

**If the field does not exist, $currentDate adds the field to a document.**

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

>
> set lastAttendance to $currentDate for all students
>
> ```js
>   db.students.updateMany({},{$currentDate:{lastAttendance:{$type:'date'}}})
> ```
