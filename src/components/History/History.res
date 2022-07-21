%%raw(`import './History.component.css';`)

@react.component
let make = (~allTransactions: array<Transaction.t>) => {
  // Belt.Array.forEach(allTransactions,(transaction) => {
  //             Js.Console.log(transaction.description)
  //         })

  <div className="history-component">
    <h3 className="history-title"> {"Transaction History"->React.string} </h3>
    <hr/>
    <div className="history-parent">
    {allTransactions->Belt.Array.map((transaction: Transaction.t) => {
      let bgColor = transaction.isPositive ? "history-item-positive" : "history-item-negative"
      <div key={transaction.id->Belt.Int.toString} className="history-item">
      <div className="history-item-text">
        <p className="history-item-description">{transaction.description -> React.string}</p>
        <p className="history-item-amount">{transaction.amount -> Belt.Int.toString -> React.string}</p>
        <div className={`history-item-end-strip ${bgColor}`}>
          <button id={transaction.id->Belt.Int.toString} className="history-item-button"></button>
        </div>
      </div>
      
      </div>
    })->React.array}

    </div>
  
    
    
    <hr />
  </div>
}
