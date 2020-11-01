# $pull

```js
    { $pull: { <field1>: <value|condition>, <field2>: <value|condition>, ... } }
```

The `$pull` operator removes from an existing array **all** instances of a value or values that match a specified condition.

To specify a `<field>` in an embedded document or in an array, use dot notation.

- If you specify a `<condition>` and the array elements are embedded documents, `$pull` operator applies the `<condition>` as if each array element were a document in a collection.

- If the specified `<value>` to remove is an array, `$pull` removes only the elements in the array that match the specified `<value>` exactly, including order.

- If the specified `<value>` to remove is a document, `$pull` removes only the elements in the array that have the exact same fields and values. The ordering of the fields can differ.

>## :zap: Examples:
> lets first populate our database with some data
>
> ```js  
>   db.store.deleteMany({})
> ```
>
> ```js
>   db.store.insertMany([{
>    _id: 1,
>        fruits: ["apples", "pears", "oranges", "grapes", "bananas"],
>            vegetables: ["carrots", "celery", "squash", "carrots"]
>},
>{
>    _id: 2,
>        fruits: ["plums", "kiwis", "oranges", "bananas", "apples"],
>            vegetables: ["broccoli", "zucchini", "carrots", "onions"]
>}])
> ```
>
> update all documents in the collection to remove "apples" and "oranges" from the array fruits and remove "carrots" from the array vegetables:
>
> ```js
>   db.stores.update(
>    { },
>    { $pull: { fruits: { $in: [ "apples", "oranges" ] }, vegetables: "carrots" } },
>    { multi: true }
>)
>
> ```
>
> ```js
>  db.profiles.remove({})
> ```
>
> ```js
> db.profiles.insert({ _id: 1, votes: [ 3, 5, 6, 7, 7, 8 ] })  
>```
>
> remove all items  from votes array that are greater than or equal 6.
>
> ```js
>  db.profiles.update( { _id: 1 }, { $pull: { votes: { $gte: 6 } } } )
> ```
>
>```js
> db.survey.remove({})
> ```
>
> ```js
> db.survey.insertMany([
>  {
>   _id: 1,
>   results: [
>      { item: "A", score: 5 },
>      { item: "B", score: 8, comment: "Strongly agree" }
>   ]
>}
>{
>   _id: 2,
>   results: [
>      { item: "C", score: 8, comment: "Strongly agree" },
>      { item: "B", score: 4 }
>   ]
>}
> ])
> ```
>
> remove from results array all elements that contain both a score field equal to 8 and an item field equal to 'B'
>
>  ```js
> db.survey.update(
>   { },
>   { $pull: { results: { score: 8 , item: "B" } } },
>   { multi: true }
>)
> ```
>
> nested documents in an array
>
>```js
>   db.survey.remove({})
>```
>
>
>  ```js
>  db.survey.insertMany([
>    {
>        _id: 1,
>        results: [
>            { item: "A", score: 5, answers: [{ q: 1, a: 4 }, { q: 2, a: 6 }] },
>            { item: "B", score: 8, answers: [{ q: 1, a: 8 }, { q: 2, a: 9 }] }
>        ]
>    },
>    {
>        _id: 2,
>        results: [
>            { item: "C", score: 8, answers: [{ q: 1, a: 8 }, { q: 2, a: 7 }] },
>            { item: "B", score: 4, answers: [{ q: 1, a: 0 }, { q: 2, a: 8 }] }
>        ]
>    }])
> ```
>
> remove from results array all elements that contain for q:2 a greater or equal to 8
>
> ```js
>       db.survey.update(
>           { },
>           { $pull: { results: { answers: { $elemMatch: { q: 2, a: { $gte: 8 } } } } >           }  
>       },
>       { multi: true }
    >)
> ```
> >
