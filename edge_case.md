## Edge Cases

This api works well when given all valid parameters, but relies on the base level error catching when given invalid params.

For example, when looking for books in a library id that doesn't exist(localhost:3000/libraries/1000/books), it simply returns an empty array.  Which isn't exactly an error, but a bit unhelpful.

In the lend action, if the given borrower_id doesn't exist, or if that borrower is not in good standing (still has books past their due date) then the native 404 not found rails message is returned.
```json
{
    "status": 404,
    "error": "Not Found",
    "exception": "#<ActiveRecord::RecordNotFound: Couldn't find Borrower with 'id'=8 [WHERE \"borrowers\".\"id\" NOT IN (SELECT \"borrowers\".\"id\" FROM \"borrowers\" LEFT OUTER JOIN \"lendable_books\" ON \"lendable_books\".\"borrower_id\" = \"borrowers\".\"id\" WHERE (lendable_books.due_date < '2023-11-20'))]>"
}
```

I did, however manually write an error message for when a book isn't available for a given borrower.

`render json: {"error": "unable to find available book for library member"}`

The return endpoint, along with the others could use some manually created, descriptive error messages to help the end user navigate the api.

## Race Condition

As far as race conditions, it is possible for two users to try and check out the same book at the same time.  That is not something I am accounting for in this basic api.