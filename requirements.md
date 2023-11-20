## Take-Home Library Management System Challenge
### Advice for Candidate
We recommend spending no more than 3 hours on this API. There are many ways to create this system, so
feel free to flex your creative muscles. What matters most is not achieving the "perfect" design, but rather
having well-founded justifications for the decisions you make.

Finally, while acknowledging and handling edge cases is an important skill, it is not expected of you to
handle them in this exercise. Instead, write it down along with how you'd like to handle it, and save it in the
project for discussion in the code review session.

Any noted edge case will not be held against you in said review.

### Problem Statement
You are tasked with creating a Library Management System in Ruby on Rails. Your goal is to design and
implement an HTTP API capable of managing a library's collection of books and handling various
operations. Note that this system can support multiple libraries.

Below are the required endpoints to be implemented. Consider that an existing library can adopt this system
and hit the ground running.

- Create Library
  - Description: Creates a new library instance by Name.

- Add Book to Library
  - Description: Creates a book and adds to the library's collection by ISBN, Title, and Author.
    - A book has an ISBN number, which for this exercise is unique to a particular title/author(s).
    - There can be multiple copies per ISBN number.

- Find Books by Title
  - Description: Returns a list of books matching the given partial title.
    - Along with the titles, also return whether they're available or when we expect they'll be returned.
      - If there are multiple copies of a book, return only one in the response; that instance should either be an available copy or the copy that's due back the earliest.
    - The search should be scoped to a library, unless a flag is passed in to do a search across all libraries.
      - If this "global search" flag is used, disregard the singular instance logic above and return all available copies and the library they belong to.

- Register Borrower
  - Description: Registers a new borrower to a specific library, via name and credit card info.
    - Adds a first-time borrower into the system as a recognized user that's able to borrow from this particular library.
    - A person must register at each library they wish to begin borrowing from, and they may be guests of multiple libraries at once.
    - If registering a borrower with the same name and credit card info as an existing one, do not make a duplicate new profile for them - just associate them with the current library.

- Lend Books
  - Description: Lends books to a borrower.
    - Mark those copies as unavailable and sets a due date of 1 week.
    - If a borrower has unpaid fines due to late returns, they are unable to borrow anything until their fines are paid and books are returned.

- Return Books
  - Description: Return books from a borrower to a specific library.
    - The book does not need to be returned to the same library it was borrowed from.
    - The act of returning an overdue book does not automatically pay that book's fine.
    - However, it does stop the fine accrual.

- Get Fine
  - Description: Returns the fine amount for a borrower.
    - Fines accrue every day ($1 per day) past the due date with a maximum fine of $25 per book.
    - The fine amount returned should be the sum across all books for that borrower.

- Pay Fine
  - Description: Allows a borrower to pay off overdue fines.
    - Assume that partial payments are not allowed.

### Bonus
In the above requirements, any mention of Fine is considered a bonus feature. Please ensure that the other
asks have been handled before implementing fines. For example, without the bonus, the only restriction for
borrowing more books is to have no late outstanding returns.

### Submission
Please email us a link to an accessible git repo, which should contain a README file with setup instructions.
The README should also point out the edge_case document mentioned in the advice section above.
If you have any questions, feel free to reach out to your point of contact and we'll get back to you as soon
as possible.