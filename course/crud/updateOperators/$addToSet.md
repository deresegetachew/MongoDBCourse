# $addToSet

Syntax:

```js
    { $addToSet: { <field1>: <value1>, ... } }
```

- The ```$addToSet``` operator adds a value to an array unless the value is already present, in which case ```$addToSet``` does nothing to that array.

- `$addToSet` only ensures that there are no duplicate items added to the set and does not affect-  existing duplicate elements. `$addToSet` does not guarantee a particular ordering of elements in the modified set.

- If you use `$addToSet` on a field that is absent in the document to update, `$addToSet` creates the array field with the specified value as its element.

- If you use `$addToSet` on a field that is not an array, the operation will fail.

> ## :zap: Examples:
> lets first populate our database with some data
>
> ``` db.colors.deleteMany({}) ```
>
> ```js
>   db.colors.insertMany([{_id:1,value:["red","green","blue"]}
> ```
>
> add to set "green"
>
>```js
>   db.colors.update({_id:1},{$addToSet:{value:"green"}})  
>```
>
> add to set array ["yellow","green"]
>
>```js
> db.colors.update({_id:1},{$addToSet:{value:["yellow","green"]}})
>```
>
> ```js
>   db.colors.update({_id:1},{$addToSet:{value:{$each:["yellow","green"]}}})
> ```
>
> add
