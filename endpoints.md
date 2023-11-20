## Endpoints

### Create a Library
- Create a library with the given name

`post localhost:3000/libraries/?library[name]=East`
```json
{
    "id": 4,
    "name": "East"
}
```

### Create a Book
 - Create a book/add another copy to a library
`post localhost:3000/libraries/4/books?parent_book[title]=Fantastic Beasts and Where to Find Them&parent_book[author]=J.K. Rowling&parent_book[isbn]=978-1338132311`
```json
{
    "id": 8,
    "title": "Fantastic Beasts and Where to Find Them",
    "author": "J.K. Rowling",
    "availability": "available"
}
```


### View books in a given library
 - Returns a single record of each book title in the given library.  Lists the soonest due date if all copies are checked out, or "available" if there is an available copy.

`get localhost:3000/libraries/1/books/?search=Harry`
```json
[
    {
        "id": 1,
        "title": "Harry Potter and the Sorcerer’s Stone",
        "author": "J.K. Rowling",
        "availability": "2023-11-17"
    },
    {
        "id": 2,
        "title": "Harry Potter and the Chamber of Secrets",
        "author": "J.K. Rowling",
        "availability": "2023-11-23"
    },
    {
        "id": 3,
        "title": "Harry Potter and the Prisoner of Azkaban",
        "author": "J.K. Rowling",
        "availability": "available"
    }
]
```

### View all books in all libraries
  - Returns all available copies of the book and the library the book belongs to.
`get localhost:3000/libraries/1/books/?search=Harry&global_search=true`

```json
[
    {
        "id": 4,
        "author": "J.K. Rowling",
        "title": "Harry Potter and the Order of the Phoenix",
        "status": "available",
        "due_date": null,
        "library_name": "North"
    },
    {
        "id": 5,
        "author": "J.K. Rowling",
        "title": "Harry Potter and the Order of the Phoenix",
        "status": "available",
        "due_date": null,
        "library_name": "North"
    },
    {
        "id": 6,
        "author": "J.K. Rowling",
        "title": "Harry Potter and the Half-Blood Prince",
        "status": "available",
        "due_date": null,
        "library_name": "North"
    }
]
```

### Register new Borrower/add Borrower to another Library
  - Creates new borrower, or if name/card combo already exists, add borrower to given library
`post localhost:3000/libraries/1/borrowers?borrower[name]=Bob Smith&borrower[credit_card]=2834-2394-4581-2949`

```json
{
    "id": 2,
    "name": "Bob Smith",
    "credit_card": "2834-2394-4581-2949",
    "created_at": "2023-11-20T15:59:44.780Z",
    "updated_at": "2023-11-20T15:59:44.780Z"
}
```

### Lend Book to Borrower
  - Assigns book to borrower if borrower is in good standing and book is available at a library they have access to.
`post localhost:3000/libraries/1/books/5/lend?borrower_id=2`

```json
{
    "id": 4,
    "author": "J.K. Rowling",
    "title": "Harry Potter and the Order of the Phoenix",
    "status": "checked_out",
    "due_date": "2023-11-27",
    "library_name": "North"
}
```

### Return Book to Library
  - Returns book, can be returned to a different library than the one it was checked out from.
`post localhost:3000/libraries/1/books/return?borrower_id=2&book_id=4`

```json
{
    "id": 4,
    "author": "J.K. Rowling",
    "title": "Harry Potter and the Order of the Phoenix",
    "status": "available",
    "due_date": null,
    "library_name": "North"
}
```