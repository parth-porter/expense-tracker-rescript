%%raw(`import './balance-component-styles.css';`)

@react.component
let make = (~allTransactions: array<Transaction.t>) => {
  let allBalances = BalanceInformation.getAllBalances(allTransactions)

  <div className="balance-component">
    <div className="balance-total">
      <div className="balance-total-content">
        <p> {"YOUR BALANCE"->React.string} </p>
        <h1 id="balance-amount-display">
          {TypeConversions.float_to_RString(allBalances.balance)}
        </h1>
      </div>
    </div>

    <div className="balance-combined">
      <div className="balance-combined-inner-white">
        <div className="balance-combined-income">
          <p> {"INCOME"->React.string} </p>
          <p className="income-amount"> {TypeConversions.float_to_RString(allBalances.income)} </p>
        </div>
        
        <div className="balance-combined-expenses">
          <p> {"EXPENSES"->React.string} </p>
          <p className="expense-amount">
            {TypeConversions.float_to_RString(allBalances.expense)}
          </p>
        </div>
      </div>
    </div>
  </div>
}
