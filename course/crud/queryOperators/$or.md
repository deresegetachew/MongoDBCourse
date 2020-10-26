# $or

Syntax

```js
{ $or: [ { <expression1> }, { <expression2> }, ... , { <expressionN> } ] }
```

The $or operator performs a logical OR operation on an **array** of two or more `<expressions>` and selects the documents that satisfy **at least one** of the `<expressions>`.

> ## :zap: Examples:

> lets first populate our database with some data
>
> ``` db.inventory.deleteMany({}) ```
>
```
db.inventory.insertMany([
{ _id: 1, item: { name: "ab", code: "123" }, inStock:[{warehouse:"AA", qty: 5}, {warehouse:"BB",qty:10}], tags: [ "school", "clothing", "children" ],carrier:{fee:2} },
{ _id: 2, item: { name: "cd", code: "123" }, inStock:[{warehouse:"AA", qty: 1} ,{warehouse:"BB",qty: 20}], tags: [ "adult" ],carrier:{fee:1} },
{ _id: 3, item: { name: "ij", code: "456" }, inStock:[{warehouse:"AA", qty:0},{warehouse:"BB",qty: 25}], tags: [ "school", "men" ],carrier:{fee:6} },
{ _id: 4, item: { name: "xy", code: "456" }, inStock:[{warehouse:"AA",qty: 30},{warehouse:"BB",qty:0}], tags: [ "woman", "+18" ],carrier:{fee:4} },
{ _id: 5, item: { name: "mn", code: "000" }, inStock:[{warehouse:"BB",qty: 20},{warehouse:"AA",qty:4}], tags: [ [ "office", "formal" ], "suite" ],carrier:{fee:5} },
{ _id: 6, item: { name: "mn", code: "000" }, inStock:[{warehouse:"AA",qty: 5},{warehouse:"BB",qty:5}], tags: [ [ "formal", "anyPlace" ], "dress" ],carrier:{fee:5} }
])
```

> get all documents where in carrier fee quantity is less than 2  or   inStock quantity is at not more than 5 in at list one of the warehouse locations <br>
>
> ```js
>   db.inventory.find({$or: [{"carrier.fee":{$lt:2}},{"inStock.qty":{$lt:5}}]})
> ```
>
> <br>
>
> get all documents where it has 'suite; in tags or its name starts with 'm';
> or  its carrier fee is between 4 and 6 <br>
> <br>
>
> ```js
> db.inventory.find({
>        $or:[
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
