# $sort

The `$sort` modifier orders the elements of an array during a `$push` operation.

**To use the `$sort` modifier, it must appear with the `$each` modifier**.
You can pass an empty array [] to the `$each` modifier such that only the `$sort` modifier has an effect.

```js
{
    $push: {
        <field>: {
        $each: [ <value1>, <value2>, ... ],
        $sort: <sort specification>
        }
    }
}
```

For `<sort specification>`:

To sort array elements that are not documents, or if the array elements are documents, to sort by the **whole documents**, specify 1 for ascending or -1 for descending.

If the array elements are documents, to sort **by a field** in the documents, specify a sort document with the field and the direction, i.e. { field: 1 } or { field: -1 }.
Do not reference the containing array field in the sort specification
`({"arrayField.field": 1}` is incorrect.

**Trying to use the `$sort` modifier without the `$each` modifier results in an error.**

>## :zap: Examples:
>
>  ```js
>   db.students.remove({})
> ```
>
> ```js
>   db.students.insert({
>   _id:1,
>   "quizzes": [
>       { "id" : 1, "score" : 6 },
>       { "id" : 2, "score" : 9 }
>   ]
>  })
>```
>
>
> add scores {id:3,score:8}, {id:4,score:7},{id:5,score:6} and sort quizzes by score
>
> ```js
>   db.students.update({_id:1},{
>   $push:{
>       quizzes: {
>           $each:[{id:3,score:8},{id:4,score:7},{id:5,score:6}],
>           $sort: {score: 1}
>       }
> }})
> ```
>
> ```js
>   db.students.remove({})
> ```
>
>```js
>   db.students.insert({"_id":1,"tests":[89,70,89,50]})
>```
>
> add two 40 and 60 to test scores  and sort the elements ascending
>
> ```js
>  db.students.update(
>   { _id: 1 },
>   { $push: { tests: { $each: [ 40, 60 ], $sort: 1 } } }
>)
> ```
>
> Update array using sort only, use descending order
>
>
> ```js
>   db.students.update(
>       { _id: 3 },
>       { $push: { tests: { $each: [ ], $sort: -1 } } }
>    )
> ```
>
> >