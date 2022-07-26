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
          editToggle={setEditStatus} transactions={transactions} setTransactions={setTransactions}
        />
      : <> </>}
    <div className="top-bar"> <h1> {AppStatic.overallHeader} </h1> </div>
    <div className="all-content">

      <ContextTxn.TxnContext.Provider
        value={{
          transactions: transactions,
          Context.transaction_setter: setTransactions,
          transaction_number: numberOfTransactions,
          transaction_number_setter: setNumberOfTransactions
        }}>

        <Balance />
        <History editTxnToggle={setEditStatus} />
        <Form onSubmitClick={FormUtils.onSubmitClick}/>

      </ContextTxn.TxnContext.Provider>
      
    </div>
    <div className="footer"> <p> {AppStatic.footerText} </p> </div>
  </div>
}
