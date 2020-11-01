# $position

The `$position` modifier specifies the location in the array at which the `$push` operator inserts elements. Without the `$position` modifier, the `$push` operator inserts elements to the end of the array.

```js
    {
    $push: {
        <field>: {
        $each: [ <value1>, <value2>, ... ],
        $position: <num>
        }
    }
}
```

`<num>` indicates the position in the array, based on a zero-based index:

- A non-negative number corresponds to the position in the array, starting from the beginning of the array. If the value of `<num>` is greater or equal to the length of the array, the `$position` modifier has no effect and `$push` adds elements to the end of the array.
<br>

- A negative number corresponds to the position in the array, counting from (but not including) the last element of the array. For example, -1 indicates the position just before the last element in the array. If you specify multiple elements in the `$each` array, the last added element is in the specified position from the end. If the absolute value of `<num>` is greater than or equal to the length of the array, the $push adds elements to the beginning of the array.

>## :zap: Examples:
>
>  ```js
>   db.students.remove({})
> ```
>
> ```js
>   db.students.insert({"_id":1,"scores":[100]})
> ```
>
> add scores 50,60 and 70 at the beginning of the array
>
>
> ```js
>   db.students.update(
>   { _id: 1 },
>   {
>     $push: {
>        scores: {
>           $each: [ 50, 60, 70 ],
>           $position: 0
>        }
>     }
>   }
>)
> ```
>
> add scores 20 and 30 to the middle of the array
>
> ```js
>   db.students.update(
>   { _id: 1 },
>   {
>     $push: {
>        scores: {
>           $each: [ 20, 30 ],
>           $position: 2
>        }
>     }
>   }
>)
> ```
>
> add 90 two places before the last element
>
> ```js
>   db.students.update(
>   { _id: 1 },
>   {
>     $push: {
>        scores: {
>           $each: [ 90, 80 ],
>           $position: -2
>        }
>     }
>   }
>)
> ```
>