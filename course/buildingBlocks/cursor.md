# Cursors

what does the word mean :

1.**a movable indicator** on a computer screen identifying the point that will be affected by input from the user.

When reading collections in mongodb `db.collection.find()`  the result returned is a Cursor object which fetches documents in batches (20 documents). A cursor object is a pointer to the result set of a query.

So, when we make a query against a database, instead of returning the entire result set, which could be several hundreds or thousands of items depending on the size of the database, a cursor is returned.
A reference point to a batch of data from the larger set of data. You can then iterate over this cursor to get to specific items in the result set.

**:zap: Example**

```js
    db.alphabets.remove({})
```

```js
    db.alphabets.insertMany([
        {value:'a'},
        {value:'b'},
        {value:'c'},
        {value:'d'},
        {value:'e'},
        {value:'f'},
        {value:'g'},
        {value:'h'},
        {value:'i'},
        {value:'j'},
        {value:'k'},
        {value:'l'},
        {value:'m'},
        {value:'n'},
        {value:'o'},
        {value:'p'},
        {value:'q'},
        {value:'r'},
        {value:'s'},
        {value:'t'},
        {value:'u'},
        {value:'v'},
        {value:'w'},
        {value:'x'},
        {value:'y'},
        {value:'z'},
        {value:'1'},
        {value:'2'},
        {value:'3'},
        {value:'4'},
        {value:'5'},
        {value:'6'},
        {value:'7'},
        {value:'8'},
        {value:'9'}
])
```

try running

```js
    db.alphabets.find()
```

did you get all documents back ?

To get all documents you can run.

```js
    var _alphabetCursor = db.alphabets.find();
    _alphabetCursor.forEach(printjson)
```

mongodb cursor object has a lot of utility methods  some of the most commonly used once are :

| Name                   | Description                                                                                                                                                                         |
| ---------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `cursor.close`         | Close a cursor and free associated server resources.                                                                                                                                |
| `cursor.isColsed()`    | Returns true if the cursor is closed.                                                                                                                                               |
| `cursor.count()`       | Modifies the cursor to return the number of documents in the result set matching the query rather than the documents themselves. This does not take  limit/skip into considerations |
| `cursor.explain()`     | Reports on the query execution plan for a cursor.                                                                                                                                   |
| `cursor.hasNext()`     | Returns true if the cursor has documents and can be iterated.                                                                                                                       |
| `cursor.hint()`        | Forces MongoDB to use a specific index for a query.                                                                                                                                 |
| `cursor.isExhausted()` | Returns true if the cursor is closed and there are no objects remaining in the batch.                                                                                               |
| `cursor.limit()`       | Constrains the size of a cursor’s result set.                                                                                                                                       |
| `cursor.map()`         | Applies a function to each document in a cursor and collects the return values in an array.                                                                                         |
| `cursor.next()`        | Returns the next document in a cursor.                                                                                                                                              |
| `cursor.pretty()`      | Configures the cursor to display results in an easy-to-read format.                                                                                                                 |
| `cursor.size()`        | Returns a count of the documents in the cursor after applying skip() and limit() methods.                                                                                           |
| `cursor.skip()`        | Returns a cursor that begins returning results only after passing or skipping a number of documents.                                                                                |
| `cursor.sort()`        | Returns results ordered according to a sort specification.                                                                                                                          |
| `cursor.toArray`       | Returns an array that contains all documents returned by the cursor.                                                                                                                |

if we were to do pagination of our alphabets collection where on each find we only want 5 letters where our alphabets are sorted ascending, it would be something like this:

```js
    function printAlphabets(pageNumber, nPerPage) {
        print( "Page: " + pageNumber );

        db.alphabets.find( {})
                    .sort( { value : 1 } )
                    .skip( pageNumber > 0 ? ( ( pageNumber - 1 ) * nPerPage ) : 0)
                    .limit( nPerPage )
                    .forEach( letter => {
                    print( tojson(letter));
                    } );
        }
```

After defining the function you can run

```js
    printAlphabets(1,5)

    printAlphabets(3,5)
```
