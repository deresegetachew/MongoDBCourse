# Embedded Data Models

![Data model!](/resources/data-model-denormalized.svg)

In MongoDB, you can embed related data in a single document. This is known as  **denormalized models**.

e.g. a student model  with grades embedded.

```js
    _id:00001,
    name: 'josh',
    grades:{
        english: 45,
        maths: 66,
        science: 60
    }
```

This embedded document model allows applications to store the related piece of information in the same records. As a result, the application requires only few queries and updates to complete common
operations.

we use embedded documents to represent both

- **one-to-one relations**
- **one-to-many()**

Embedded Documents provide better results in cases:

- where we have “contains” relationships between entities
- where we have one-to-many relationships between entities, where the "many" or child documents alway appear with or are viewed in the context of the parent document

Embedding provides better performance for read operations, as well as the ability to request and retrieve related data in a single database operation. Embedded data models make it possible to update related data in a single atomic write operation.

> mongodb supports no more than 100 levels of nesting BSON documents and the maximum BSON document size is 16 megabyets.
