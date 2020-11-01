# $each

Syntax:

```js
    { $addToSet: { <field>: { $each: [ <value1>, <value2> ... ] } } }
```

The `$each` modifier is available for use with the **`$addToSet`** operator and the **`$push`** operator.

usage with `$addToSet`

```js
    { $addToSet: { <field>: { $each: [ <value1>, <value2> ... ] } } }
```

usage with `$push`

```js
   { $push: { <field>: { $each: [ <value1>, <value2> ... ] } } }
```
