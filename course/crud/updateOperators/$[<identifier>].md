# `$[<identifier>]`

Syntax:

```js
{ <update operator>: { "<array>.$[<identifier>]" : value } },
{ arrayFilters: [ { <identifier>: <condition> } ] }
```

```js
db.collection.updateMany(
   { <query conditions> },
   { <update operator>: { "<array>.$[<identifier>]" : value } },
   { arrayFilters: [ { <identifier>: <condition> } ] }
)
```

The filtered positional operator `$[<identifier>]` identifies the array elements that match the arrayFilters conditions for an update operation,
e.g. `db.collection.update()` and `db.collection.findAndModify()`.

> The `<identifier>` must begin with a lowercase letter and contain only alphanumeric characters.

- If an upsert operation results in an insert, the query must include an exact equality match on the array field in order to use `$[<identifier>]` in the update statement.

> ## :zap: Examples:
> lets first populate our database with some data
>
> ``` db.students.deleteMany({}) ```

```js
    db.students.insertMany([
        {
            name:'john',
            age:5,
            grade: 3,
            score: [{maths: 80},{english: 45},{history: 67}]

        },
        {
            name:'angela',
            age:8,
            grade: 4,
            score:  [{maths: 30},{english: 75},{history: 57}]
        },

        {
            name:'donald',
            age:12,
            grade: 7,
             score:  [{maths: 70},{english: 95},{history: 87},{maths:'80'},{english:78}]
        }
    ])
```
>
> modify  english grades below 50 to be 50 in all documents
>
> ```js
>   db.students.update({}, {$set:{"score.$[element].english": 50}},{arrayFilters:[{"element.english":{$lt:50}}],multi:true})
> ```
>
>
> modify john's history grade to 70
>
> ```js
>   db.students.update({name: "john"},{$set:{"score.$[element].history":70}},{arrayFilters:[{"element.history":67}]})
> ```
>
> create a new collection
>
> ```js
>   db.students2.remove({})
> ```
>
> ```js
> db.students2.insertMany([
>    {
>        "_id": 1,
>        "grades": [
>            { "maths": 80,  "english": 60, "history":45 },
>            { "maths": 85,  "english": 40,"history":35 },
>            { "maths": 85,  "english": 60,"history":55 }
>        ]
>    },
>   {
>        "_id": 2,
>        "grades": [
>            { "maths": 90, "english": 76 , "history":56 },
>            { "maths": 87, "english": 43 , "history":46 },
>            { "maths": 85,  "english": 74, "history":55 }
>        ]
>    }
>])
>
> ```
>
> set passed true if all the subjects have scored above 55
>
> ```js
>   db.students2.update({},{$set:{"grades.$[ele].passed":true}},{arrayFilters:[{"ele.maths":{$gt:55},"ele.english":{$gt:55},"ele.history":{$gt:55}}],multi:true})
> ```
>
> lets create a collection **alumni**
>
> ```js
>   db.alumni.remove({})
> ```
>
>```js
>    db.alumni.insertMany([
>        {
>            "_id": 1,
>            "name": "Christine Franklin",
>            "degrees": [
>                {
>                    "level": "Master",
>                    "major": "Biology",
>                    "completion_year": 2010,
>                    "faculty": "Science"
>                },
>                {
>                    "level": "Bachelor",
>                    "major": "Biology",
>                    "completion_year": 2008,
>                    "faculty": "Science"
>                }
>            ],
>            "school_email": "cfranklin@example.edu",
>            "email": "christine@example.com"
>        },
>    {
>            "_id": 2,
>            "name": "Reyansh Sengupta",
>            "degrees": [
>                {
>                    "level": "Bachelor",
>                    "major": "Chemical Engineering",
>                    "completion_year": 2002,
>                    "faculty": "Engineering"
>                }
>            ],
>            "school_email": "rsengupta2@example.edu"
>        }
>    ])
>```
>
> modify all elements in the degrees array that do not have "level" to level 2: "Bachelor", use `$ne`
>
> ```js
> db.alumni.update(
>   { },
>   { $set : { "degrees.$[degree].level" : 2 } },
>   { arrayFilters : [ {"degree.level" : { $ne: "Bachelor" } } ],
>     multi : true }
>)
> ```
>
> lets create a collection students3
>
>```js
>  db.student3.remove({})
>```
>
> ```js
>   db.student3.insertMany([
>    {
>        "_id": 1,
>        "grades": [
>            { type: "quiz", questions: [10, 8, 5] },
>            { type: "quiz", questions: [8, 9, 6] },
>            { type: "hw", questions: [5, 4, 3] },
>            { type: "exam", questions: [25, 10, 23, 0] },
>
>        ]
>    }
>])
>```
>
> updates the values that are greater than or equal to 8 in the nested grades.questions array if  
> the associated grades.type field is quiz.
>
> ```js
>   db.students3.update(
>   {},
>   { $inc: { "grades.$[t].questions.$[score]": 2 } },
>   { arrayFilters: [ { "t.type": "quiz" } , { "score": { $gte: 8 } } ], multi: true}
>)
> ```
