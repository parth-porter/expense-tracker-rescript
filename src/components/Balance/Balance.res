%%raw(`import './balance-component-styles.css';`)

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

  <div className="balance-component">
            <div className="balance-total">
                <div className="balance-total-content">
                <p>{"YOUR BALANCE" -> React.string}</p>
                <h1 id="balance-amount-display">{(totalBalance)->Belt.Int.toString->React.string}</h1>

                </div>
                
            </div>
            <div className="balance-combined">
                <div className="balance-combined-inner-white">
                <div className="balance-combined-income">
                    <p>{"INCOME"->React.string}</p>
                    <p className="income-amount">{(totalIncome)->Belt.Int.toString->React.string}</p>
                </div>
                <div className="balance-combined-expenses">
                    <p>{"EXPENSES"-> React.string}</p>
                    <p className="expense-amount">{(totalExpense)->Belt.Int.toString->React.string}</p>
                </div>

                </div>
                
            </div>
        </div>
}
