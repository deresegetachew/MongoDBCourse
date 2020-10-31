
# $

Syntax:

```js
    db.collection.find( { <array>: <condition> ... },{ "<array>.$": 1 } )
    db.collection.find( { <array.field>: <condition> ...},{ "<array>.$": 1 } )
```

- works with arrays
- It limits the contents of an `<array>` to return either:
  - The first element that matches **the query condition on the array**.
  - The first element if no query condition is specified for the array .
  
- it returns the **element** not the document

- The `$` operator projects the first matching array element from each document in a collection based on some condition **from the query statement**.

# $elemMatch

Syntax

```js
    db.collection.find( {<condition> },{ "<array field>": {$elemMatch:{<field>:<condition>}} } )
```

- The $elemMatch projection operator **takes an explicit condition argument**. This allows you to project **based on a condition not in the query**, or if you need to project based on multiple fields in the array’s embedded documents. See Array Field Limitations for an example.

<br><br>

- **Both the `$` operator and the `$elemMatch` operator**project the first matching element**from an array based on a condition.**

<br><br>

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

>the following two examples return the same value but they use different approaches
>
>
```js
    db.inventory.find({"qty.num":{$lte:100}},{"qty.$":1,code:1,tags:1})
```
>
```js
    db.inventory.find({},{qty:{$elemMatch:{num:{"$lte":100}}}})
```
>
>
> get all documents where  it has the 'school' tags, show only available qty of size 6 or size M items, show tags and code feilds in documents in your result set.
>
> ```js
>   db.inventory.find({"tags":"school"},{qty:{$elemMatch:{size:{$in:["6","M"]}}},tags:1,code:1})
> ```
> get all items where qty stock is above 50, show the first quantity you find for each document
>
>  ```js
>    db.inventory.find({"qty.num":{$gt:50}},{"code":1,"qty.$":1})
> ```
