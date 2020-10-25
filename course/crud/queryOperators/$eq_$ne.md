# $eq

Specifies equality condition. The $eq operator matches documents where the v**alue of a field equals the specified value**.

``` {<field>: {$eq: <value>} ```

Specifying the $eq operator is equivalent to using the form ```{ field: <value> }``` except when the ```<value>``` is a regular expression.

## :zap: Examples :

> lets first populate our database with some data.
>
>
```
db.inventory.insertMany([
{ _id: 1, item: { name: "ab", code: "123" }, qty: 15, tags: [ "A", "B", "C" ] },
{ _id: 2, item: { name: "cd", code: "123" }, qty: 20, tags: [ "B" ] },
{ _id: 3, item: { name: "ij", code: "456" }, qty: 25, tags: [ "A", "B" ] },
{ _id: 4, item: { name: "xy", code: "456" }, qty: 30, tags: [ "B", "A" ] },
{ _id: 5, item: { name: "mn", code: "000" }, qty: 20, tags: [ [ "A", "B" ], "C" ] }
])
```

> get all documents where qty is equal to 20 <br>
> ``` db.inventory.find( { qty: { $eq: 20 } } ) ``` <br>
> ``` db.inventory.find( { qty: 20 } ) ```

<br>

> get all documents where item name equals "ab" <br>
> ```db.inventory.find( { "item.name": { $eq: "ab" } } )``` <br>
> ```db.inventory.find( { "item.name": "ab" } )```

<br>

> get all documents where tags array contains "B" <br>
> ```db.inventory.find( { tags: { $eq: "B" } } )```<br>
> ```db.inventory.find( { tags: "B" } )```

<br>

> get all documents  where the tags array equals **exactly**  ["A","B"] <br>
> ```db.inventory.find( { tags: { $eq: [ "A", "B" ] } } )```

<br>

> get all documents where their item name includes the letter "a" (**Regular Express match**) <br><br>
> **This Will work**
>
>```
>   db.inventory.find( { "item.name": /a/ })
>   db.inventory.find( { "item.name": { $regex: /a/ }} )```
>```
>
> **This wont work**
>
>```
>   db.inventory.find( { "item.name": { $eq: /a/ } })
>// this is explicit query using $eq and it will only match for a regular expression  >`/a/` in item.name <br>
>```  

<br>
