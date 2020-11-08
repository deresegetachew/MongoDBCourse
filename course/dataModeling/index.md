# Data Modeling

Data modeling considers different needs and characteristics of our database engine and application requirements.
when we design a model we consider the different data retrieval patterns required by applications , the write behaviors required by applications and the limitations and behavior of our database system as well.

Below it shows us the difference in data modeling with tabular based databases and mongodb.

## Tabular vs Mongodb  Data Modeling

|                           | Tabular Database                                 | MongoDB                                       |
| ------------------------- | ------------------------------------------------ | --------------------------------------------- |
| steps to create the model | 1- define schema <br> 2- develop app and queries | 1- identify the queries <br> 2- define schema |
| Initial Schema            | 3rd normal form <br> one possible solution       | many possible solutions                       |
| Final Schema              | likely demoralized                               | few changes                                   |
| schema evolution          | difficult and not optimal <br> likely downtime   | easy <br> no downtime                         |
| Query performance         | mediocre and hard to oprimize                    | optimized from the beginning                  |

For example below consider a Blog App and the different ways we can model it.

![modeling bog!](../../resources/modeling_blog.png)

![modeling solutions!](../../resources/modeling_blog_solutions.png)

In this section we will discuss

- Data Models
  ![Embedding vs Referencing!](../../resources/embedding%20vs%20referencing.png)
  - [Embedded](/course/dataModeling/embedded.md)
  - [Normalized](/course/dataModeling/normalized.md)
- [Data Modeling Methodology](/course/dataModeling/methodology.md)
- [Example: real world use case](/course/dataModeling/usecase.md)
- [Data Modeling Patterns](/course/dataModeling/patterns/index.md)
