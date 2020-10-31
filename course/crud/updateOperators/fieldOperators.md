# update field operators

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
        ],
supplier: {
    nme: 'abcd',
    country: 'turkey',
}
},
{
   _id: ObjectId("5234cc8a687ea597eabee676"),
   code: "abc",
   tags: [ "appliance", "school", "book" ],
   qty: [
          { size: "6", num: 100, color: "green" },
          { size: "6", num: 50, color: "blue" },
          { size: "8", num: 100, color: "brown" }
        ],
        supplier: {
    nme: 'abcd',
    country: 'turkey',
}
},
{
   _id: ObjectId("5234ccb7687ea597eabee677"),
   code: "efg",
   tags: [ "school", "book",["appliance"] ],
   qty: [
          { size: "S", num: 10, color: "blue" },
          { size: "M", num: 100, color: "blue" },
          { size: "L", num: 100, color: "green" }
        ],
        supplier: {
    nme: 'abcd',
    country: 'turkey',
}
},
{
   _id: ObjectId("52350353b2eff1353b349de9"),
   code: "ijk",
   tags: [ "electronics", "school" ],
   qty: [
          { size: "M", num: 100, color: "green" }
        ],
        supplier: {
    nme: 'abcd',
    country: 'turkey',
}
}])
```
>
> rename `supplier.nme` field to `supplier.name`

```js
    db.inventory.updateMany({},{$rename:{"supplier.nme":"supplier.name"}})
```

> add lastUpdatedField to the documents and set currentDate as its value

```js
    db.inventory.updateMany({},{$currentDate:{lastUpdatedField:{$type: "timestamp"}}})
```

> increment the quantity count of document 'efg' of size 'M' and color 'blue' by 5

```js
  db.inventory.update({"code":"efg","qty.size":'M'},{$inc:{"qty.$.num":5}})
```

> halve the quantity count of document 'abc' of size 6 and color 'blue'

```js
    db.inventory.updateMany({"code":"abc","qty.size":'6'},{$mul:{"qty.$.num":NumberDecimal(0.5)}})
```

> **what if there were more than one array elements that full filled the above query condition will they both get updated ?** <br>
> add expiry date field to each document and set it to 100 Days from now

```js
```

> change size 'L' of document 'efg' to size 'XL'
        db.inventory.update({code:"efg"},{$set:{"qty.size":'XL'}})

```js
```

> insert or update the following documents, if it is inserted make sure to set 'insertedBy: <you name>' if it already exists and it is modified just update it
>
> ```js
>  {
>   _id: ObjectId("5234cc8a687ea597eabee676"),
>   code:"efg",
>   tags:[ "school", "book",["appliance"] ],
>   qty: [
>       { size: "S", num: 20, color: "blue" },
>       {size: "M", num: 60, color: "blue" },
>       {size: "L" , num: 50 , color: "green"}
>   ]
> },
> {
>   _id: ObjectIc("52350353b2eff1353b378de9"),
>   code: "zdf",
>   tags:["book","appliance"],
>   qty: []
> }
> ```

```js
```

> Remove tags value school from document 'efg'
>
