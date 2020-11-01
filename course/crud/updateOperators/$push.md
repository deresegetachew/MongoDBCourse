# $push

Syntax:

```js
    { $push: { <field1>: <value1>, ... } }
```

The `$push` operator appends a specified value to an array.
To specify a `<field>` in an embedded document or in an array, use dot notation.

If the field is absent in the document to update, `$push` adds the array field with the value as its element.

If the field is not an array, the operation will fail.

If the value is an array, `$push` appends the whole array as a single element. To add each element of the value separately, use the `$each` modifier with `$push`.

```js
    { $push: { <field1>: { <modifier1>: <value1>, ... }, ... } }
```

| Modifier  | Description                                                                                                                                                                                                    |
| --------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| $each     | Appends multiple values to the array field.                                                                                                                                                                    |
| $slice    | Limits the number of array elements. Requires the use of the `$each` modifier.                                                                                                                                 |
| $sort     | Orders elements of the array. Requires the use of the $each modifier.                                                                                                                                          |
| $position | Specifies the location in the array at which to insert the new elements. Requires the use of the `$each` modifier. Without the `$position` modifier, the `$push` appends the elements to the end of the array. |

The processing of the push operation with modifiers occur in the following order, regardless of the order in which the modifiers appear:

1. Update array to add elements in the correct position.
2. Apply sort, if specified.
3. Slice the array, if specified.
4. Store the array.

>## :zap: Examples:

> lets first populate our database with some data
>
> ```js
>   db.students.remove({})
> ```
>
> ```js
>   db.students.insertMany([
>   {
>       "_id":1,
>       "quizzes":[{"wk":1,"score":10},{"wk":2,"score":8},{"wk":3,"score":5},{"wk":4,"score":6}]
>   }
> ])
> ```
>
> add the following quiz results to the students quizzes array `[{wk:5,score:8},{wk:6,score:7},{wk:7,score:6}]` and sort the quizzes by score Descending
>
>
> ```js
>   db.students.update({_id:1},{
>       $push: {
>           quizzes:{
>               $each:[{wk:5,score:8},{wk:6,score:7},{wk:7,score:6}],
>               $sort: {score: -1}
>            }
>       }
> })
> ```
>
>
> ```js
> db.students.remove({})
> ```
>
>
> ```js
>   db.students.insertMany([
> {
>      "_id":1,
>      "quizzes":[{"wk":1,"score":10},{"wk":2,"score":8},{"wk":3,"score":5},{"wk":4, "score":6}]
>  }
>])
> ```
>
> add the following quiz results to the students quizzes array `[{wk:5,score:8},{wk:6,score:7},{wk:7,score:6}]` and sort the quizzes by score Descending and only keep the top 3
>
>
> ```js
>   db.students.update({_id:1},{
>       $push: {
>           quizzes:{
>               $each:[{wk:5,score:8},{wk:6,score:7},{wk:7,score:6}],
>               $sort: {score: -1},
>               $slice: 3
>            }
>       }
> })
>
