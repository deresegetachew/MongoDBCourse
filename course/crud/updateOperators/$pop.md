# $pop

Syntax

```js
{ $pop: { <field>: <-1 | 1>, ... } }
```

The `$pop` operator removes the first or last element of an array.
Pass `$pop` a value of -1 to remove the first element of an array and 1 to remove the last element in an array.

The `$pop` operation fails if the `<field>` is not an array.

If the `$pop` operator removes the last item in the `<field>`, the `<field>` will then hold an empty array.

>## :zap: Examples:
>
> lets first populate our database with some data
>
> ```js  
>   db.colors.deleteMany({})
> ```
>
> ```js
>   db.colors.insertMany([{_id:1,value:["red","green","blue"}])
> ```
>
> remove the color red  from value array
>
> ```js
>   db.colors.update({_id:1},{$pop:{value:-1}})
> ```
>
> remove the color blue from value array
>
>  ```js
>   db.colors.update({_id:1},{$pop:{value: 1}})
> ```  
>
> exercise : what happens if the array was nested ?
