# $not

Syntax:

```
    { field: { $not: { <operator-expression> } } }
```

- $not performs a logical NOT operation on the specified `<operator-expression>` and selects the documents that do not match the `<operator-expression>`.
- **This includes documents that do not contain the field.**

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

> get all documents where carrier fee is not greater than 5
>
>  ```js
>   db.inventory.find({"carrier.fee":{$not:{$gt: 5}}})
> ```
>
> <br>
> get all documents where expired is not true
>
> ```js
>  db.inventory.find({"expired":{$not:{$eq:true}}})
> ```
>
> it returns also those documents that do not have the expired field.
><br>
>
> This **won't work** because $not expects an operators expression and not just an expression.
>
> ```js
>   db.inventory.find({"expired":{$not:true}})
> ```
>
> <br>
>
> get all documents where it doesn't have school as tag element
>
> ```js
>   db.inventory.find({"tags":{$not: /school/}})
> ```
