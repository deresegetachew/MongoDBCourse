# POS System features we will build

Our (Point of Sale) POS system will handle the following concerns

## Customer

information's we are interested in:

- customer name
- their tin No if they have one
- what kind of customer they are we categorize customer types as business / person
   |

## Order

information's we are interested in:

- a unique identifier for our order
- the order details ,
  - the products ordered, their name , product id , quantity , unit price, unit price after discount if applicable
  - discounts applied to a product
  - products sales tax
- the total cost of the order
- the sales tax
- the time it was processed at
- the person that served them if applicable
- the customer details (name if applicable and customer type)
- promotion applied to the sales order
  
## Product

information's we are interested in :

- a unique identifier of our product
- the product suppliers detail
- product detail name and description
- the products price
- the products image
- product tags so that we can easily search and show them by category
- stock availability at different locations

## POS Machine

- Serial Number
- Users that can login to our POS
- wether it is currently available or not

## Locations

This are our shop locations

- our shop Name, Address
- clerks and servers at that location
- pos machines that work at this location

## Supplier

information's we are interested in:

- supplier detail address , name  

## Users and their Roles

- this can be either Admin or Clerks, admins can do everything clerks can only operate a POS at a location they are assigned
