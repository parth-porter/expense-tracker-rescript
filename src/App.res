%%raw(`import './App.css';`)

@react.component
let make = () => {
  let (initialStateTransactions, initalTxnNumber) = LocalStorage.localDataWrapper()
  let (transactions, setTransactions) = React.useState(_ => initialStateTransactions)
  let (numberOfTransactions, setNumberOfTransactions) = React.useState(_ => initalTxnNumber)

  React.useEffect2(() => {
    LocalStorage.setDataToLocal("transactions-local", Js.Json.stringifyAny(transactions))
    LocalStorage.setDataToLocal(
      "transactions-number-local",
      Js.Json.stringifyAny(numberOfTransactions),
    )
    None
  }, (numberOfTransactions, transactions))

  <div className="App">
    <div className="top-bar"> <h1> {ComponentHeadings.overallHeader} </h1> </div>
    <div className="all-content">
      <Balance allTransactions={transactions} />
      <History allTransactions={transactions} transactionHandler={setTransactions} />
      <Form
        onSubmitHandler={setTransactions}
        numberOfTransactions={numberOfTransactions}
        transactionNumberHandler={setNumberOfTransactions}
      />
    </div>
    <div className="footer"> <p> {ComponentHeadings.footerText} </p> </div>
  </div>
}
