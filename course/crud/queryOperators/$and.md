# $and

Syntax

```
{ $and: [ { <expression1> }, { <expression2> } , ... , { <expressionN> } ] }
```

$and performs a logical AND operation on an array of one or more expressions (e.g. `<expression1>`, `<expression2>`, etc.) and selects the documents that **satisfy all the expressions in the array**.

The $and operator uses short-circuit evaluation. If the first expression
(e.g. `<expression1>`) evaluates to false, MongoDB will not evaluate the remaining expressions.

> MongoDB provides an implicit AND operation when specifying a comma separated list of expressions.
> ## :zap: Examples:

> lets first populate our database with some data
>
> ``` db.inventory.deleteMany({}) ```
>
```js
db.inventory.insertMany([
{ _id: 1, item: { name: "ab", code: "123" }, inStock:[{warehouse:"AA", qty: 5}, {warehouse:"BB",qty:10}], tags: [ "school", "clothing", "children" ],carrier:{fee:2} },
{ _id: 2, item: { name: "cd", code: "123" }, inStock:[{warehouse:"AA", qty: 1} ,{warehouse:"BB",qty: 20}], tags: [ "adult" ],carrier:{fee:1} },
{ _id: 3, item: { name: "ij", code: "456" }, inStock:[{warehouse:"AA", qty:0},{warehouse:"BB",qty: 25}], tags: [ "school", "men" ],carrier:{fee:6} },
{ _id: 4, item: { name: "xy", code: "456" }, inStock:[{warehouse:"AA",qty: 30},{warehouse:"BB",qty:0}], tags: [ "woman", "+18" ],carrier:{fee:4} },
{ _id: 5, item: { name: "mn", code: "000" }, inStock:[{warehouse:"BB",qty: 20},{warehouse:"AA",qty:4}], tags: [ [ "office", "formal" ], "suite" ],carrier:{fee:5} },
{ _id: 6, item: { name: "mn", code: "000" }, inStock:[{warehouse:"AA",qty: 5},{warehouse:"BB",qty:5}], tags: [ [ "formal", "anyPlace" ], "dress" ],carrier:{fee:5} }
])
```

> get all documents where in carrier fee quantity is greater than 2  and   inStock quantity is at least 5 in any of the warehouse locations <br>
>
> ```js
>   db.inventory.find({$and: [{"carrier.fee":{$gt:2}},{"inStock.qty":{$gt:5}}]})
> ```
>
> <br>
>
> get all documents where it has 'suite; in tags and its name starts with 'm'; and its carrier fee is between 4 and 6 <br>
> <br>
>
> ```js
> db.inventory.find({
>        $and:[
>           {"tags":{$in:["suite"]}},
>           {"item.name": {$regex:/m/} },
>           {"$and":[
>                 {"carrier.fee":{$gt:4}},
>                  {"carrier.fee":{$lt:6}}
>               ]
>           }
>           ]
>  })
> ```
