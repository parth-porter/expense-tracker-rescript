%%raw(`import './App.css';`)

@react.component
let make = () => {
  let (initialStateTransactions, initalTxnNumber) = LocalStorage.localDataWrapper()
  let (transactions, setTransactions) = React.useState(_ => initialStateTransactions)
  let (numberOfTransactions, setNumberOfTransactions) = React.useState(_ => initalTxnNumber)
  let (editStatus, setEditStatus) = React.useState(_ => false)

  React.useEffect2(() => {
    LocalStorage.setDataToLocal("transactions-local", Js.Json.stringifyAny(transactions))
    LocalStorage.setDataToLocal(
      "transactions-number-local",
      Js.Json.stringifyAny(numberOfTransactions),
    )
    None
  }, (numberOfTransactions, transactions))

  <div className="App">
    {editStatus
      ? <Edit
          editToggle={setEditStatus}
          transactions={transactions}
          setTransactions={setTransactions}
        />
      : <> </>}
    <div className="top-bar"> <h1> {AppStatic.overallHeader} </h1> </div>
    <div className="all-content">
      <Balance allTransactions={transactions} />
      <History
        allTransactions={transactions}
        transactionHandler={setTransactions}
        editTxnToggle={setEditStatus}
      />
      <Form
        onSubmitHandler={setTransactions}
        numberOfTransactions={numberOfTransactions}
        transactionNumberHandler={setNumberOfTransactions}
        onSubmitClick={FormUtils.onSubmitClick}
      />
    </div>
    <div className="footer"> <p> {AppStatic.footerText} </p> </div>
  </div>
}
