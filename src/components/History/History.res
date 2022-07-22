%%raw(`import './History.component.css';`)

@react.component
let make = (~allTransactions: array<Transaction.t>, ~transactionHandler) => {
  <div className="history-component">
    <h3 className="history-title"> {"Transaction History"->React.string} </h3>
    <hr />
    <div className="history-parent">
      {allTransactions
      ->Belt.Array.map((transaction: Transaction.t) => {
        let bgColor = transaction.isPositive ? "history-item-positive" : "history-item-negative"

        <div key={transaction.id->Belt.Int.toString} className="history-item">
          <div className="history-item-text">
            <p className="history-item-description"> {transaction.description->React.string} </p>
            <p className="history-item-amount">
              {TypeConversions.float_to_RString(transaction.amount)}
            </p>
            <div className={`history-item-end-strip ${bgColor}`}>
              <button id={transaction.id->Belt.Int.toString} className="history-item-button" 
              onClick={event => HistoryHandling.deleteTransaction(~transactionHandler=transactionHandler, ~transactionNumber=transaction.id, ~transactions={allTransactions})}>
              {"X"->React.string}
              </button>
            </div>
          </div>
        </div>
      })
      ->React.array}
    </div>
  </div>
}
