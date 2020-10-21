# Limitations

- The maximum BSON Document size is **16 megabyets**.
  - Why ? it helps ensure that a single document can not use excessive amount of RAM or during transmission excessive amount of bandwidth. To store documents larger than the maximum size , Mongodb provides the GridFS API.
- Nested Depth for BSON Documents
  - MongoDb supports **no more than 100 levels** of nesting for BSON Documents.
  
- Naming restrictions
  - Database names are case **insensitive**
    - On Windows database names can not include ``` \/."$.<>:|? ``` and null character
    - on Linux/Unix systems database names can not contain ```/\. "$``` and null character
  - Collection Names
    - Should being with an underscore or a letter character
    - Can not
      - contain $
      - be an empty string
      - contain null character
      - begin with the system. prefix (reserved for internal use).
  - Field Names
    - Field names cannot contain the null character
    - Top field names can not contain the null character.

> to learn more please refere (<https://docs.mongodb.com/manual/reference/limits/#operations>)
