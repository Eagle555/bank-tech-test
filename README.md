# Bank tech test

## Requirements

- You should be able to interact with your code via a REPL like IRB or the JavaScript console. (You don't need to implement a command line interface that takes input from STDIN.)
- Deposits, withdrawal.
- Account statement (date, amount, balance) printing.
- Data can be kept in memory (it doesn't need to be stored to a database or anything).

## How to use

### For user interface 
```
ruby app.rb
```

### Running tests
```
rspec
```
### Running in console
```
irb -r ./lib/bank.rb
```

## Solution approach
## Step 1 - Test creation

### Expectation 

 - Amount added to the account
 - Amount deducted from the account
 - Amount stored on the account 
 - Transactions to be recorded every time operation is made

## Step 2 - Object Bank

### Project creation with user interface (extra)

- class creation
- methods and variables
- menu with user interface (extra)
- implementation of a choice to use user interface
- implementing functionality to pass the test

## Step 3 - Refactoring

### Separating objects

- history as separate object
- balance as separate object
- transaction verification

### User interface

- app start file

### Functionality

- adding decimal point, for pence processing.

## Step 4 - Test coverage

### Tests

- current failing test
- coverage
- retesting

### Security

- negative numbers
- strings
- recording malicious activity