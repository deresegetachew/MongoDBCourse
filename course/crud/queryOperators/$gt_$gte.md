# $gt

``` {field: {$gt: value} } ```

$gt selects those documents where the value of the field is greater than (i.e. >) the specified value.

- For most data types, comparison operators only perform comparisons on fields **where the BSON type matches the query value’s type**.

- MongoDB supports limited cross-BSON comparison through Type Bracketing.

## :zap: Examples:

> lets first populate our database with some data
>
> ``` db.inventory.deleteMany({}) ```
>
```
db.inventory.insertMany([
{ _id: 1, item: { name: "ab", code: "123" }, qty: 15, tags: [ "A", "B", "C" ],carrier:{fee:2} },
{ _id: 2, item: { name: "cd", code: "123" }, qty: 20, tags: [ "B" ],carrier:{fee:1} },
{ _id: 3, item: { name: "ij", code: "456" }, qty: 25, tags: [ "A", "B" ],carrier:{fee:6} },
{ _id: 4, item: { name: "xy", code: "456" }, qty: 30, tags: [ "B", "A" ],carrier:{fee:4} },
{ _id: 5, item: { name: "mn", code: "000" }, qty: 20, tags: [ [ "A", "B" ], "C" ],carrier:{fee:5} }
])
```

> get all documents where qty is greater than 20 <br>
> ```db.inventory.find( { qty: { $gt: 20 } } )```
> get all documents where carrier fee is greater than 2 <br>
> ``` db.inventory.find({"carrier.fee":{$gt:2}}) ```

# $gte

Syntax:
```{field: {$gte: value} }```

$gte selects the documents where the value of the field is greater than or equal to (i.e. >=) a specified value (e.g. value.)

For most data types, comparison operators only perform comparisons on fields where the BSON type matches the query value’s type.

>## :zap: Examples:
>
> get all documents where qty is greater or equal to  20 <br>
> ```db.inventory.find( { qty: { $gt: 20 } } )```
> get all documents where carrier fee is greater or equal to 2 <br>
> ``` db.inventory.find({"carrier.fee":{$gt:2}}) ```
