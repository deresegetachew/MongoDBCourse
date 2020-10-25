## Collection & Documents

Mongodb stores data records as documents (BSON documents),which are gathered together in collections.

MongoDb stores **Documents** In **Collections**. <br>
MongoDb Stores **Data records** in **Document**.

![on Read and on write Schema!](../../resources/overview-of-mongodb.png)

if you are coming from relational databases the relatively comparative view would be the diagram below. Unlike relational databases though we don't use documents collections , documents and fields as schemas.

** starting mongodb 3.2 we can enforce document validation rules for a collection during update and insert operations.

![on Read and on write Schema!](../../resources/mongoDb-vs-relationalDb.jpg)

## _Id field

Each document in mongodb must have a unique identifier
across the database. This field is the **_id** field.

it is reserved field name that is used by mongodb.
it is a mandatory document field.

this field can be assigned manually , but if nto assigned manually mongodb will create it automatically.
