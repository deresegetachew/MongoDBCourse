# $mul

syntax

```js
    { $mul: { <field1>: <number1>, ... } }
```

**The field to update must contain a numeric value.**

To specify a `<field>` in an embedded document or in an array, use dot notation.

If the field does not exist in a document, `$mul` creates the field and sets the value to zero of the same numeric type as the multiplier.

`$mul` is an atomic operation within a single document.

|                    | 32-bit integer           | 64 bit integer | Float |
| ------------------ | ------------------------ | -------------- | ----- |
| **32-bit integer** | 32-bit or 64-bit integer | 64-bit integer | Float |
| **64-bit integer** | 64-bit integer           | 64-bit Integer | Float |
| **Float**          | Float                    | Float          | Float |

> Integer operations of any type that exceed the maximum value for a 64-bit integer produce an error.

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
