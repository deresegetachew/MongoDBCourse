# $slice

The `$slice` modifier limits the number of array elements during a `$push` operation. To project, or return, a specified number of array elements from a read operation.

**To use the `$slice` modifier, it must appear with the `$each` modifier.**
You can pass an empty array [] to the `$each` modifier such that only the `$slice` modifier has an effect.

```js
    {
        $push: {
            <field>: {
            $each: [ <value1>, <value2>, ... ],
            $slice: <num>
            }
        }
}
```

The <num> can be:

| value    | Description                                                             |
| -------- | ----------------------------------------------------------------------- |
| Zero     | To Update array `<field>` to an empty array                             |
| Negative | To update the array `<field>` to contain only the last `<num>` elements |
| Positive | To update the array `<field>` contain only the first `<num>` elements   |

<br>

>## :zap: Examples:
>
>  ```js
>   db.students.remove({})
> ```
>
> ```js
>   db.students.insert({_id:1,scores:[40,50,60]})
>```
>
> add 80 ,78 abd 86 to scores and trim the array to the last five elelments
>
> ```js
> db.students.update(
>       { _id: 1 },
>       {
>          $push: {
>           scores: {
>           $each: [ 80, 78, 86 ],
>           $slice: -5
>           }
>       }
>       }
>   )
>```
>
> keep the last 3 scores only
>
> ```js
>   db.students.update(
>  { _id: 1 },
>  {
>    $push: {
>      scores: {
>         $each: [ ],
>         $slice: -3
>      }
>    }
>  }
>)
> ```
>
>