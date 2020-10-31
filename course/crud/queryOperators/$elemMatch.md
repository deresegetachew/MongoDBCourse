# $elemMatch

Syntax

```js
    { <field>: { $elemMatch: { <query1>, <query2>, ... } } }
```

The $elemMatch operator matches documents

- that contain **an array field**
- with **at least one element** that matches **all** the specified **query criteria**.

the difference between  `$all` and `$elemMatch` is

- `$all` queries against elements for equality, to find documents that have an array field that has all those elements.
- `$elemMatch` queries against query expressions to find documents that have an array field that fullfil all the query criteria

> ## :zap: Examples:

> lets first populate our database with some data
>
> ``` db.inventory.deleteMany({}) ```
>
```js
db.inventory.insertMany([{
   _id: ObjectId("5234cc89687ea597eabee675"),
   code: "xyz",
   tags: [ "school", "book", "bag", "headphone", "appliance" ],
   qty: [
          { size: "S", num: 10, color: "blue" },
          { size: "M", num: 45, color: "blue" },
          { size: "L", num: 100, color: "green" }
        ]
},
{
   _id: ObjectId("5234cc8a687ea597eabee676"),
   code: "abc",
   tags: [ "appliance", "school", "book" ],
   qty: [
          { size: "6", num: 100, color: "green" },
          { size: "6", num: 50, color: "blue" },
          { size: "8", num: 100, color: "brown" }
        ]
},
{
   _id: ObjectId("5234ccb7687ea597eabee677"),
   code: "efg",
   tags: [ "school", "book",["appliance"] ],
   qty: [
          { size: "S", num: 10, color: "blue" },
          { size: "M", num: 100, color: "blue" },
          { size: "L", num: 100, color: "green" }
        ]
},
{
   _id: ObjectId("52350353b2eff1353b349de9"),
   code: "ijk",
   tags: [ "electronics", "school" ],
   qty: [
          { size: "M", num: 100, color: "green" }
        ]
}])
```

> get all documents where  size is 6 or 8
>
> ```js
>  db.inventory.find({ qty:{
>   $elemMatch:{
>           size: {$in:["6","8"]}
>       }
> }})
> ```
>
> <br>
>
> get all documents where tags include appliance
>
> ```js
>   db.inventory.find({tags:{$elemMatch:{$eq:"appliance"}}})
> ```
>
> this can also be writtne as
>
> ```js
>   db.inventory.find({tags:{$eq:"appliance"}})
> ```
>
> <br>
> get all documents where size is 6 or 8 and color is blue
>
> ```js
>   db.inventory.find({
>       qty:{
>               $elemMatch:
>               {
>               size:{$in:["6","8"]},
>               color:{$eq:"blue"}
>               }
>           }
> })
> ```
