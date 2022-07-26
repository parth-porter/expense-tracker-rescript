%%raw(`import './balance-component-styles.css';`)

@react.component
let make = () => {
  let {transactions, _} = React.useContext(ContextTxn.TxnContext.context)
  let allBalances = BalanceUtils.getAllBalances(transactions)

  <div className="balance-component">
    <div className="balance-total">
      <div className="balance-total-content">
        <p> {BalanceStatic.topHeading} </p>
        <h1 id="balance-amount-display">
          {TypeConversions.float_to_RString(allBalances.balance)}
        </h1>
      </div>
    </div>
    <div className="balance-combined">
      <div className="balance-combined-inner-white">
        <div className="balance-combined-income">
          <p> {BalanceStatic.subHeadingLeft} </p>
          <p className="income-amount"> {TypeConversions.float_to_RString(allBalances.income)} </p>
        </div>
        <div className="balance-combined-expenses">
          <p> {BalanceStatic.subHeadingRight} </p>
          <p className="expense-amount">
            {TypeConversions.float_to_RString(allBalances.expense)}
          </p>
        </div>
      </div>
    </div>
  </div>
}
