# $lt  and $lte

syntax:

```
{field: {$lt: value} }
```

```
{
    field: {$lte:value}
}
```

$lt selects the documents where the value of the field is less than (i.e. <) the specified value.

 $lte selects the documents where the value of the field is less than or equall (i.e. <=) the specified value.

> ## :zap: Examples:

> lets first populate our database with some data
>
> ``` db.inventory.deleteMany() ```
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

> find item who has a carrier fee less than 4 <br>
> ``` db.inventory.find({"carrier.fee":{$lt:4}}) ``` <br>
>
> find item who has a carrier fee less than or equal than 6 <br>
> ``` db.inventory.find({"carrier.fee":{$lte:6}}) ``` <br>
>
> find in stock quantity where it is less than 5 <br>
> ``` db.inventory.find({"inStock.qty":{$lt:5}}) ``` // what is wrong with the response you got ? <br>
>
> find in stock quantity at whareouse:A where it is less than 5 <br>
> ``` db.inventory.find({"inStock.qty":{$lt:4},"inStock.warehouse":{$eq:'AA'}}) ``` <br> // what is wrong with this answer
