%%raw(`import './App.css';`)
@scope("JSON") @val external parseIntoArray: string => array<Transaction.t> = "parse"
@scope("JSON") @val external parseIntoInt: string => int = "parse"

let localDataTransactions = LocalStorage.getDataFromLocal("transactions-local")
let initialStateTransactions = (localDataTransactions != "") ? parseIntoArray(localDataTransactions) : []

let localTxnNumber = LocalStorage.getDataFromLocal("transactions-number-local")
let initalTxnNumber = (localTxnNumber != "") ? parseIntoInt(localTxnNumber) : 0


@react.component
let make = () => {
  let (transactions, setTransactions) = React.useState(_ => initialStateTransactions)
  let (numberOfTransactions, setNumberOfTransactions) = React.useState(_ => initalTxnNumber)


  React.useEffect2(() => {
    LocalStorage.setDataToLocal("transactions-local", Js.Json.stringifyAny(transactions))
    LocalStorage.setDataToLocal("transactions-number-local", Js.Json.stringifyAny(numberOfTransactions))
    None
  }, (numberOfTransactions, transactions))


  <div className="App">
    <div className="top-bar">
      <h1> {"Expense Tracker"->React.string} </h1>
    </div>
    <div className="all-content">
      <Balance allTransactions={transactions} />
      <History allTransactions={transactions} transactionHandler={setTransactions}/>
      <Form
        onSubmitHandler={setTransactions}
        numberOfTransactions={numberOfTransactions}
        transactionNumberHandler={setNumberOfTransactions}
      />
    </div>
    <div className="footer">
    <p>{"Made with <3 and ReScript" -> React.string}</p>
    </div>
  </div>
}
