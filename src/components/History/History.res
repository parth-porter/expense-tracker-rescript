%%raw(`import './History.component.css';`)

@react.component
let make = (~allTransactions: array<Transaction.t>) => {
  // Belt.Array.forEach(allTransactions,(transaction) => {
  //             Js.Console.log(transaction.description)
  //         })

  <div className="history-component">
    <h3> {"History Component"->React.string} </h3>
    {allTransactions->Belt.Array.map((transaction: Transaction.t) => {
      let bgColor = transaction.isPositive ? "transaction-income" : "transaction-expense"
      <li className=`${bgColor}`>{(transaction.description ++ " " ++Js.Int.toString(transaction.amount) ++ " " ++ Js.String.make(transaction.isPositive)) -> React.string}</li>
    })->React.array}
    <hr />
  </div>
}
