@react.component
let make = (~allTransactions: array<Transaction.t>) => {
  // Belt.Array.forEach(allTransactions,(transaction) => {
  //             Js.Console.log(transaction.description)
  //         })

  <div className="history-component">
    <h3> {"History Component"->React.string} </h3>
    {allTransactions->Belt.Array.map((transaction: Transaction.t) => {
      <li>{(transaction.description ++ " " ++Js.Int.toString(transaction.amount) ++ " " ++ Js.String.make(transaction.isPositive)) -> React.string}</li>
    })->React.array}
    <hr />
  </div>
}
