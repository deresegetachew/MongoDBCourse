# $slice

**Syntax:**

```js
    db.collection.find(
        <query>,
        { <arrayField>: { $slice: <number> } }
    );
```

**or**

```js
    db.collection.find(
    <query>,

    { <arrayField>: { $slice: [ <number>, <number> ] } }

    );
```

The `$slice` projection operator specifies the number of elements in an array to return in the query result.

- `$slice:<number>`

Specifies the number of elements to return in the `<arrayField>`. For `<number>`: Specify a positive number n to return the first n elements.Specify a negative number n to return the last n elementsIf the `<number>` is greater than the number of array elements, the query returns all array elements.

- `$slice: [ <number to skip>, <number to return> ]`

For the `<number to skip>`:

> - Specify a positive number n to skip n elements from the start of the array; i.e. 0th index position. Based on a zero-based array index, 1 indicates the starting position of the 2nd element, etc. If n is greater than the number of array elements, the query returns an empty array for the `<arrayField>`.
>- Specify a negative number n to skip backward n elements from the start of the array; i.e. 0th index position Based on a zero-based array index (i.e. the first element is at index 0), -1 indicates the starting position of the last element, etc. If the absolute value of the negative number is greater than the number of array elements, the starting position is the start of the array.
  
For the `<number to return>`, you must specify a positive number n to return the next n elements, starting after skipping the specified number.

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

>
> get  all documents and return  tags and qty with a length of 2 and 1 respectively
>
> ```js
>   db.inventory.find({},{tags:{$slice:2},qty:{$slice:1}})
> ```
