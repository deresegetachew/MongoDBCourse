# $PullAll

Syntax

```js
    { $pullAll: { <field1>: [ <value1>, <value2> ... ], ... } }
```

The `$pullAll` operator removes all instances of the specified values from an existing array. Unlike the `$pull` operator that removes elements by specifying a query, `$pullAll` removes elements that match the listed values.

>## :zap: Examples:

> lets first populate our database with some data
>
> ```js
>   db.survey.remove({})
> ```
>
> ```js
>   db.survey.insert({ _id: 1, scores: [ 0, 2, 5, 5, 1, 0 ] })
> ```
>
> remove instances of values 0 and 5 from the scores array
>
>```js
>    db.survey.update( { _id: 1 }, { $pullAll: { scores: [ 0, 5 ] } } )
>```
