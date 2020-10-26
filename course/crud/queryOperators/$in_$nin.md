# $in and $nin

The $in operator selects the documents where the value of a field **equals** any value in the specified array.

**syntax:**

```{ field: { $in: [<value1>, <value2>, ... <valueN> ] } }```

$nin operator selects documents where:

- the field value is not in the specified array or
- the field does not exist.

``` { field: { $nin: [<value1>,<value2>...<valueN>] } } ```

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

> get all documents where in stock quantity is 2 or 4 <br>
> ```db.inventory.find({"inStock.qty":{$in:[2,4]}})``` <br>
>
> get all documents where in stock quantity is **not** in 2 or 4 <br>
> ```db.inventory.find({"inStock.qty":{$nin:[2,4]}})```<br>
>
> get all documents where carrier fee is any of the following [2,4] <br>
> ```db.inventory.find({"carrier.fee":{$in:[2,4]}})``` <br>
>
> get all documents  that have tags ["formal", "children","school]<br>
> ``` db.inventory.find({"tags":{$in:["formal","children","school"]}}) ```<br>
>
> get all documents  that **do not** have tags ["formal", "children","school]<br>
> ``` db.inventory.find({"tags":{$nin:["formal","children","school"]}}) ```<br>
>
> get all items that have run out in warehouseA <br>
>``` db.inventory.find({"inStock":{$in:[{"warehouse":"AA",qty:0}]}}) ```<br>
>```db.inventory.find({"inStock":{$in:[{qty:0,"warehouse":"AA"}]}})``` // this one will not work, order matterss <br>
>
> get  all items that have the letter 'L' in their tags  <br>
> ```db.inventory.find({"tags":{"$in":[/l/]}})```<br>
>
> get all items that start with letter 'C' in their tags <br>
> ```db.inventory.find({"tags":{"$in":[/^C/]}})```
