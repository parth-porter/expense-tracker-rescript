%%raw(`import './history-component-styles.css';`)

@react.component
let make = (
  ~allTransactions: array<Transaction.structure>,
  ~transactionHandler,
  ~editTxnToggle,
) => {
  <div className="history-component">
    <h3 className="history-title"> {HistoryStatic.header} </h3>
    <hr />
    <div className="history-parent">
      {allTransactions
      ->Belt.Array.map((transaction: Transaction.structure) => {
        let bgColor = transaction.isPositive ? "history-item-positive" : "history-item-negative"

        <div key={transaction.id->Belt.Int.toString} className="history-item">
          <div className="history-item-text">
            <p className="history-item-description"> {transaction.description->React.string} </p>
            <p className="history-item-amount">
              {TypeConversions.float_to_RString(transaction.amount)}
            </p>
            <div className={`history-item-end-strip ${bgColor}`}>
              <button
                id={transaction.id->Belt.Int.toString}
                className="history-item-button"
                onClick={event =>
                  HistoryUtils.deleteTransaction(
                    ~transactionHandler,
                    ~transactionNumber=transaction.id,
                    ~transactions={allTransactions},
                  )}>
                <i className="fa-solid fa-trash"></i>
              </button>
              <button 
                id={transaction.id->Belt.Int.toString}
                className="history-item-edit-button"
                onClick={event =>
                  HistoryUtils.editTransaction(
                    ~editWindowToggle={editTxnToggle},
                    ~transactionNumber=transaction.id,
                    ~transactions={allTransactions},
                  )}>
                <i className="fa fa-edit"></i>
      
              </button>
            </div>
          </div>
        </div>
      })
      ->React.array}
    </div>
  </div>
}
