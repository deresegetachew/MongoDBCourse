# $nor

Syntax

```js
    { $nor: [ { <expression1> }, { <expression2> }, ...  { <expressionN> } ] }
```

$nor performs a logical **NOR** operation on an array of one or more query **expression** and selects the documents **that fail all the query expressions in the array**.

> ## :zap: Examples:
> lets first populate our database with some data
>
> ``` db.inventory.deleteMany({}) ```
>
```js
db.inventory.insertMany([
{ _id: 1, item: { name: "ab", code: "123" }, inStock:[{warehouse:"AA", qty: 5}, {warehouse:"BB",qty:10}], tags: [ "school", "clothing", "children" ],carrier:{fee:2} },
{ _id: 2, item: { name: "cd", code: "123" }, expired:false ,inStock:[{warehouse:"AA", qty: 1} ,{warehouse:"BB",qty: 20}], tags: [ "adult" ],carrier:{fee:1} },
{ _id: 3, item: { name: "ij", code: "456" }, inStock:[{warehouse:"AA", qty:0},{warehouse:"BB",qty: 25}], tags: [ "school", "men" ],carrier:{fee:6} },
{ _id: 4, item: { name: "xy", code: "456" }, expired:false ,inStock:[{warehouse:"AA",qty: 30},{warehouse:"BB",qty:0}], tags: [ "woman", "+18" ],carrier:{fee:4} },
{ _id: 5, item: { name: "mn", code: "000" }, inStock:[{warehouse:"BB",qty: 20},{warehouse:"AA",qty:4}], tags: [ [ "office", "formal" ], "suite" ],carrier:{fee:5} },
{ _id: 6, item: { name: "mn", code: "000" }, expired:true ,inStock:[{warehouse:"AA",qty: 5},{warehouse:"BB",qty:5}], tags: [ [ "formal", "anyPlace" ], "dress" ],carrier:{fee:5} }
])
```

> get all documents where carrier fee is  less than 3 and doesn't have expired field or is false  using $nor
>
>  ```js
>   db.inventory.find({$nor:[{"carrier.fee":{$gt:3}},{"expired":true}]})
> ```
>
> <br>
> get all documents where carrier fee is greater than 3 and expired field is false and it, only get those documents that include expired field
>
> ```js
> db.inventory.find({$nor:[{"carrier.fee":{$lte:3}},{expired:{$exists:false}},{expired:true}]})
> ```
