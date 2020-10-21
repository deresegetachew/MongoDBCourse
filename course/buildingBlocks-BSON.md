# BSON

A binary serialization format used **to store documents** and make remote procedure calls in mongodb.

JSON is a subset of types supported by BSON. BSON adds support for data types, such as date and binary which are not supported in JSON. BSON types allow us to store [Key] -> [value + type] pairs.

**BSON Types allow us to query documents not only by value but also by type. using $type operator**

## BSON Types

![BSON Types!](../resources/datatypes.jpg)

BSON Types have an identifier that are used to query documents by types. BSON types have a unique **Number ID** and **String ID**. we use this identifiers using the **$type** operator in queries.

Below you can find the full list of BSON Types and their identifiers:

| Type                       | Number | Alias                 | Notes                      |
| -------------------------- | ------ | --------------------- | -------------------------- |
| Double                     | 1      | “double”              |                            |
| String                     | 2      | “string”              |                            |
| Object                     | 3      | “object”              |                            |
| Array                      | 4      | “array”               |                            |
| Binary data                | 5      | “binData”             |                            |
| Undefined                  | 6      | “undefined”           | Deprecated.                |
| ObjectId                   | 7      | “objectId”            |                            |
| Boolean                    | 8      | “bool”                |                            |
| Date                       | 9      | “date”                |                            |
| Null                       | 10     | “null”                |                            |
| Regular Expression         | 11     | “regex”               |                            |
| DBPointer                  | 12     | “dbPointer”           | Deprecated.                |
| JavaScript                 | 13     | “javascript”          |                            |
| Symbol                     | 14     | “symbol”              | Deprecated.                |
| JavaScript code with scope | 15     | “javascriptWithScope” | Deprecated in MongoDB 4.4. |
| 32-bit integer             | 16     | “int”                 |                            |
| Timestamp                  | 17     | “timestamp”           |                            |
| 64-bit integer             | 18     | “long”                |                            |
| Decimal128                 | 19     | “decimal”             | New in version 3.4.        |
| Min key                    | \-1    | “minKey”              |                            |
| Max key                    | 127    | “maxKey”              |

### ObjectId

- used usually for the _id field in documents
- small, **likely** unique, fast to generate and **ordered**.
- Can be automatically generated using **ObjectId()** or can  be manually created. To manually create it We must supply type information **ObjectId()** with the value
- 12 bytes in length (24 digits)
  - 4 byte timestamp (8 digits)
  - 5 byte random value (10 digits) (Machine ID (MD5 hash of hostname and MAC + processID))
  - 3 byte increment in counter, initialized to a random value (6 digits)
  
    > i.e. 1 byte is 8 bits , 12 bytes are 96 bits , a number takes 4 bit, there fore 96/4 = 24 digits.

   > in your  mongo shell get 3 ObjectIds consecutively. Which parts are similar and which parts of the generated Ids are different ?
  
    ```ObjectId()```
    ```ObjectId()```
    ```ObjectId()```

- In mongoshell we can access the creation time of objectId using ```ObjectId.getTimestamp()``` i.e. the creation time of any document in ISO date format.
- To convert an objectId to string use ```newObjetId.str```
- Sorting on an _id field that stores ObjectId values is roughly equivalent to sorting by creation time.
- Each document stored in a collection **requires** a unique _id field that acts as a primary key, if an inserted document omits the_id field, MongoDb driver automatically generates an ObjectId for the _id field.
  
### Number Types in MongoDB:

   **If a type of a Number is not provided to a value , MongoDB will store it as a Double BSON Value.**

  >The reason for this is Mongodb uses javascript engine and javascript engine doesn't distinguish between integer number and decimal numbers. JavaScript numbers are always stored as double precision 64-bit floating point numbers, following the international IEEE 754 standard.

  [a refresher to number types](#a-refresher-on-number-data-types)

- **32-bit Integer**
  - To save our numbers as 32-bit **integers** we should use **NumberInt()** type information.
- **64-bit Integer**
  - To save our numbers as 64-bit **integers** we should use **NumberLong()** type information.
- **Double**
  - To save our numbers as 128-bit-**decimal**-based floating-point values capable of emulating decimal rounding with exact precision. we should use **NumberDecimal()** type information.

### Date

Internally, Date objects are stored as a signed 64-bit integer representing the number of milliseconds since the Unix epoch (Jan 1, 1970). This results in a representable date range of about 290 million years into the past and future.

BSON Date type is signed. Negative values represent dates before 1970.

 we can use ISODate formats to store dates; which will be stored by mongodb as integers:

- ```new Date()```
- ```ISODate()```

> The most common confusion in JS is the difference between **Date()** and **new Date()**;
> **Date()** will just return a string format **not** an ISO Date; while **new Date()** returns an ISODate format.

### Other Types

- **String**
  - most commonly used datatype to store data. String in MongoDB must be UTF-8.
- **Boolean**
  - Use to store a boolean(true or false) value.
- **Null**
  - used to store Null value
- **Timestamps**
  - handy for recording when a document has been created or modified.
- **Array**
  - used to store list, array or multiple values into one key.
- **Object**
  - Used to embedded documents inside one another.
- **Binary data**
  - this data type is used to store binary data.
- **Min/Max keys**
  - compare a value against the lowest and highest BSON elements

## Hands on :zap:

using mongoshell

- make sure you are on training_database
- Create a document in demo collection
- what is the _id of the document
- what is the timestamp of the document, use the objectId
- create a new ObjectId() and assign it to a variable
- convert the previously created objectId to string
  
- create a document with the field **xyz** and assign it 11.
- create another document with the field **xyz** and assign it 450.3456.
- create another document with the field **xyz** and assign it 450.3456 **as decimal**
- create another document with the field **xyz** and assign it 5,000 as **long integer**
- create another document with the field **xyz** and assign it '123456789'
  
- run ``` db.demo.find({xyz:{$type:'double'}}) ``` which document did  you get ? why ?
- run ``` db.demo.find({xyz:{$type:'int'}}) ``` which document did you get ? why ?
- run ```db.demo.find({xyz:{$type:'long'}})``` which document did you get ? why ?
- run ```db.demo.find({xyz:{$type:'number'}})``` which document did you get ? why ?
- run ```db.demo.find({xyz:{$type:'decimal'}})``` which document did you get ?
- run ```db.demo.find({xyz:{$type:'string'}})``` which document did you get ?

- run ```db.demo.find({xyz:450.3456})``` what did you get ?
  
- run ```db.demo.find({xyz:NumberDecimal("450.3456")})``` what did you get ?
  
- run ```db.demo.find({xyz:NumberInt(11)})``` what did you get ?
  
- run ```db.demo.find({xyz:11})``` what did you get ?

- run ``` db.demo.insert({xyz: Date()}) ```
- run ``` db.demo.insert({xyz: new Date()}) ```
- run ``` db.demo.insert({xyz: new ISODate()}) ```

- now ``` db.demo.find({xyz:{$type:'date'}}) ``` how many documents did you get back ?

## A refresher on Number Data Types

>Long is a data is type used in programming languages, such as Java, C++, and C#. A constant or variable defined as long can store a single 64-bit signed integer.
>So what constitutes a 64-bit signed integer? It helps to break down each word, starting from right to left. An integer is a whole number that does not include a decimal point. Examples include 1, 99, or 234536. "Signed" means the number can be either positive or negative, since it may be preceded by a minus (-) symbol. 64-bit means the number can store 263 or 18,446,744,073,709,551,616 different values (since one bit is used for the sign). Because the long data type is signed, the possible integers range from -9,223,372,036,854,775,808 to 9,223,372,036,854,775,807, including 0.
>In modern programming languages, the standard integer (int) data type typically stores a 32-bit whole number. Therefore, if a variable or constant may potentially store a number larger than 2,147,483,647 (231 ÷ 2), it should be defined as a long instead of an int.

## Reference and Reading

[JSON vs BSON](https://www.geeksforgeeks.org/difference-between-json-and-bson/) <br>
[Float, Double, Long Types](https://www.youtube.com/watch?v=vNeOx1rQ25E)<br>
[Javascript Numbers](https://www.w3schools.com/js/js_numbers.asp) <br>
[For more on BSON to JSON](https://docs.mongodb.com/manual/reference/mongodb-extended-json/)
[Dates in MongoDB](https://www.compose.com/articles/understanding-dates-in-compose-mongodb/#:~:text=Internally%2C%20MongoDB%20can%20store%20dates,or%20as%2064%2Dbit%20integers.&text=If%20you're%20using%20the,your%20date%20as%20an%20integer.)
