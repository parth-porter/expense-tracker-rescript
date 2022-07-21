let getAllBalances = (allTransactions: array<Transaction.t>): Balances.balanceStructure => {
  //returns totalBalance, totalIncome, totalExpense as a tuple

  let allBalances : Balances.balanceStructure = {balance: 0., income: 0., expense: 0.}

  Js.Array2.forEach(allTransactions, (transaction) => {
    if(transaction.amount > 0.){
        allBalances.income = allBalances.income +. transaction.amount
    }
    else{
        allBalances.expense = allBalances.expense -. transaction.amount
    }

    allBalances.balance = allBalances.balance +. transaction.amount;
  })

  allBalances
}
