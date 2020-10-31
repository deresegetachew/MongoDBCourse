# Query and Projection Operators

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
| [```$ne```](/course/crud/queryOperators/$eq_$ne.md)    | Matches all values that are not equal to a specified value.         |
| [```$nin```](/course/crud/queryOperators/$in_$nin.md)  | Matches none of the values specified in an array.                   |

### Logical Operators :

 | Name                                              | Description                                                                                             |
 | ------------------------------------------------- | ------------------------------------------------------------------------------------------------------- |
 | [```$and```](/course/crud/queryOperators/$and.md) | Joins query clauses with a logical AND returns all documents that match the conditions of both clauses. |
 | [```$not```](/course/crud/queryOperators/$not.md) | Inverts the effect of a query expression and returns documents that do not match the query expression.  |
 | [```$nor```](/course/crud/queryOperators/$nor.md) | Joins query clauses with a logical NOR returns all documents that fail to match both clauses.           |
 | [```$or```](/course/crud/queryOperators/$or.md)   | Joins query clauses with a logical OR returns all documents that match the conditions of either clause. |

### Field operators

| Name                                                    | Description                                            |
| ------------------------------------------------------- | ------------------------------------------------------ |
| [```$exists```](/course/crud/queryOperators/$exists.md) | Matches documents that have the specified field.       |
| [```$type```](/course/crud/queryOperators/$type.md)     | Selects documents if a field is of the specified type. |

### Array

| Name                                                      | Description                                                                                      |
| --------------------------------------------------------- | ------------------------------------------------------------------------------------------------ |
| [```$all```](/course/crud/queryOperators/$all.md)         | Matches arrays that contain all elements specified in the query.                                 |
| [`$elemMatch`](/course/crud/queryOperators/$elemMatch.md) | Selects documents if element in the array field matches all the specified $elemMatch conditions. |
| [`$size`](/course/crud/queryOperators/$size.md)           | Selects documents if the array field is a specified size.                                        |

## Projection Operators :

$project stage

- includes , excludes or adds a new field

``` {$project: {<field1>:<1>,<field2>:<0>,<newField>:<expression>}} ```

example:

```{$project: {name:1,"company.title":1}}``` // we will get _id , name and company.title only <br>
```{$project: {_id:0,"name":1,"age":1}}``` // we will get name and age but not_id<br>
```{$project: {address:0,age:0}}```  // we will get all fields expect address and age<br>
```{$project: {name: 1, newAddress: $address}}``` // we refere to address field of the input document , we will get_id , name  and address renamed as newAddress

| Name       | Description                                                                             |
| ---------- | --------------------------------------------------------------------------------------- |
| $          | Projects the first element in an array that matches the query condition.                |
| $elemMatch | Projects the first element in an array that matches the specified $elemMatch condition. |
| $slice     | Limits the number of elements projected from an array. Supports skip and limit slices.  |
