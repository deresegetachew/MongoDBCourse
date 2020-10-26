# $type

Syntax

```js
    { field: { $type: <BSON type> } }  
```

- $type selects documents where the value of the field is an instance of the specified BSON type(s).
- Querying by data type is useful when dealing with highly unstructured data where data types are not predictable.

```js
    { field: { $type: [ <BSON type1> , <BSON type2>, ... ] } }
```

- The above query will match documents where the field value is any of the listed types. The types specified in the array can be either numeric or string aliases.

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
>
> get all documents where item.code is string
>
> ```js
>  db.inventory.find({"item.code":{$type:"string"}})
> ```
>
