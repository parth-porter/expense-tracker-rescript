# Expense Tracker Project

This project was bootstrapped with [Create React App](https://github.com/facebook/create-react-app).
And was built using [ReScript](https://rescript-lang.org/)

## Deployment (up-to-date)

http://expense-tracker-parth-v2.herokuapp.com/

## To Start a Localhost Implementation

In the project directory, you can run

### `npm start`

### `npm run re:start`

to start the local server and the reScript Compiler

## Structure

1. App.js
   - This is the entry point into the App. It contains the calls to the various components and also state declarations.
   - The basic object in the app is a `transaction` which contains - `id` : `int` : A Unique ID to differentiate transactions - `description` : `string`: The description of the transaction - `amount` : `float` : Contains the amount of the transaction - `isPositive` : `float` : a helper field determined using the value of amount to allow differentiating between income and expenses easily.
2. components directory
   - This contains the other components of the App, which are named in a self-explanatory manner
     1. Balance
     2. Edit
     3. Form
     4. History
   - Each of these components contain a css file for handling their styles aswell.
   - All components (except Edit) are refactored for readability and the edit component is a work in progress. (The Edit component is functional, just not refactored)
3. static directory
   - This contains all the static content used by various components and are named corresponding to the component they are used in.
4. types directory
   - This contains types used in various components, declared seperately to avoid recursive declarations.
5. utils directory
   - This contains the helper functions used in the components.

## Functional - Requirements

- [x] User should be able to add and view income with remarks.
- [x] User should be able to add and view expense with remarks.
- [x] User should be able to see the total income and total expense.
- [x] User should be able to see the net balance
- [x] User should be able to view the expense after re-loading the page.(v2)

## Non Functional Requirements

- [x] Responsive for mobile and desktop view

## Additional Functionality

- [x] User can delete a transaction.
- [x] User can edit a transaction.
