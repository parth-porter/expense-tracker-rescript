%%raw(`import './App.css';`)

@scope("JSON") @val external parseIntoMyData: string => array<Transaction.t> = "parse"
@scope("JSON") @val external parseIntoInt: string => int = "parse"

let localTransactionValueOption = Dom_storage2.getItem(Dom_storage2.localStorage,"transactions-local")
let localTransactionValue = switch localTransactionValueOption{
  | Some(n) => n
  | None => ""
}

let initialStateTransactions: array<Transaction.t> = localTransactionValue !== "" ? parseIntoMyData(localTransactionValue) : []

let localTransactionNumberOption = Dom_storage2.getItem(Dom_storage2.localStorage,"transactions-number-local")
let localTransactionNumber = switch localTransactionNumberOption{
  | Some(n) => n
  | None => ""
}

let initialStateNumber: int = localTransactionValue !== "" ? parseIntoInt(localTransactionNumber) : 0

@react.component
let make = () => {
  let (transactions, setTransactions) = React.useState(_ => initialStateTransactions)
  let (numberOfTransactions, setNumberOfTransactions) = React.useState(_ => initialStateNumber)

  React.useEffect1(() => {
    let transactionStringOption = Js.Json.stringifyAny(transactions)
    let transactionString = switch transactionStringOption {
    | Some(n) => n
    | None => ""
    }
    Dom_storage2.setItem(Dom_storage2.localStorage, "transactions-local", transactionString)
    None
  }, [transactions])

React.useEffect1(() => {
    let transactionNumberOption = Js.Json.stringifyAny(numberOfTransactions)
    let transactionNumber = switch transactionNumberOption {
    | Some(n) => n
    | None => ""
    }
    Dom_storage2.setItem(Dom_storage2.localStorage, "transactions-number-local", transactionNumber)
    None
  }, [numberOfTransactions])




  <div className="App">
    <div className="top-bar">
      <h1> {"Expense Tracker"->React.string} </h1>
    </div>
    <div className="all-content">
      <Balance allTransactions={transactions} />
      <History allTransactions={transactions} />
      <Form
        onSubmitHandler={setTransactions}
        numberOfTransactions={numberOfTransactions}
        transactionNumberHandler={setNumberOfTransactions}
      />
    </div>
  </div>
}
