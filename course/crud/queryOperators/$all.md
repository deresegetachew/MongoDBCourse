# $all

Syntax

```js
{ <field>: { $all: [ <value1> , <value2> ... ] } }
```

The $all operator selects the documents where

- **the value of a field is an array**
- that contains **all** the specified elements.

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

> - get all documents where the value of tags field is an array that includes  appliance, school, and book:
>
> ```js
>   db.inventory.find({"tags":{"$all":["appliance","school","book"]}})
> ```
>
> this is equivalent to
>
> ```js
>   db.inventory.find({$and:[{tags:"appliance"},{tags:"school"},{tags:"book"}]})
> ```
>
> - find documents where the value of tags field is an array that includes ["appliance"], i.e. this time it is nested array we are searching for
>
> ```js
> db.inventory.find({"tags":{$all:[["appliance" ]]}})
> ```
