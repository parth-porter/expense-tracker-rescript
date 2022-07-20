@react.component
let make = (~allTransactions: array<Transaction.t>) => {

  let allAmount = Js.Array2.map(allTransactions, x => x.amount)

  let allIncome = Js.Array2.map(allTransactions, x => {
    x.amount > 0 ? x.amount : 0
  })

  let allExpenses = Js.Array2.map(allTransactions, x => {
    x.amount < 0 ? x.amount : 0
  })

  let totalBalance = Belt.Array.reduce(allAmount, 0, (acc, value) => acc + value)

  let totalIncome = Belt.Array.reduce(allIncome, 0, (acc, value) => acc + value)

  let totalExpense = Belt.Array.reduce(allExpenses, 0, (acc, value) => acc - value)


  


  


    // Js.Array.forEach(allTransactions, (transaction:Transaction.t) => {
    //     balanceObject.balanceAmount =  balanceObject.balanceAmount + transaction.amount;
    //     if(transaction.isPositive){
    //         balanceObject.incomeAmount =  balanceObject.incomeAmount + transaction.amount;
    //     }
    //     else{
    //         balanceObject.expenseAmount =  balanceObject.expenseAmount - transaction.amount;
    //     }
    // })

  <div>
    <h3> {"Balance Component"->React.string} </h3>
    <ul>
      <li> {("Balance: " ++ Js.Int.toString(totalBalance))->React.string} </li>
      <li> {("Income: " ++ Js.Int.toString(totalIncome))->React.string} </li>
      <li> {("Expense: " ++ Js.Int.toString(totalExpense))->React.string} </li>
    </ul>
    <hr />
  </div>
}
