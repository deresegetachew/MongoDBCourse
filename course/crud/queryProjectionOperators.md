# Query and Project Operators

## Query Operators :

### Comparison Operators :

For comparison of different BSON type values, see the specified BSON comparison order.

| Name                                                   | Description                                                         |
| ------------------------------------------------------ | ------------------------------------------------------------------- |
| [```$eq```](/course/crud/queryOperators/$eq_$ne.md)    | Matches values that are equal to a specified value.                 |
| [```$gt```](/course/crud/queryOperators/$gt_$gte.md)   | Matches values that are greater than a specified value              |
| [```$gte```](/course/crud/queryOperators/$gt_$gte.md/) | Matches values that are greater than or equal to a specified value. |
| [```$in```](/course/crud/queryOperators/$in.md)        | Matches any of the values specified in an array                     |
| [```$lt```](/course/crud/queryOperators/$lt_$lte.md)   | Matches values that are less than a specified value.                |
| [```$lte```](/course/crud/queryOperators/$lt_$lte.md)  | Matches values that are less than or equal to a specified value.    |
| ```$ne```                                              | Matches all values that are not equal to a specified value.         |
| ```$nin```                                             | Matches none of the values specified in an array.                   |

### Logical Operators :

 | Name       | Description                                                                                             |
 | ---------- | ------------------------------------------------------------------------------------------------------- |
 | ```$and``` | Joins query clauses with a logical AND returns all documents that match the conditions of both clauses. |
 | ```$not``` | Inverts the effect of a query expression and returns documents that do not match the query expression.  |
 | ```$nor``` | Joins query clauses with a logical NOR returns all documents that fail to match both clauses.           |
 | ```$or```  | Joins query clauses with a logical OR returns all documents that match the conditions of either clause. |

### Field operators

| Name    | Description                                            |
| ------- | ------------------------------------------------------ |
| $exists | Matches documents that have the specified field.       |
| $type   | Selects documents if a field is of the specified type. |

### Array

| Name       | Description                                                                                      |
| ---------- | ------------------------------------------------------------------------------------------------ |
| $all       | Matches arrays that contain all elements specified in the query.                                 |
| $elemMatch | Selects documents if element in the array field matches all the specified $elemMatch conditions. |
| $size      | Selects documents if the array field is a specified size.                                        |

## Projection Operators :

| Name       | Description                                                                             |
| ---------- | --------------------------------------------------------------------------------------- |
| $          | Projects the first element in an array that matches the query condition.                |
| $elemMatch | Projects the first element in an array that matches the specified $elemMatch condition. |
| $slice     | Limits the number of elements projected from an array. Supports skip and limit slices.  |
