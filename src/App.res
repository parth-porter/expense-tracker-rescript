%%raw(`import './App.css';`)
@module("./logo.svg") external logo: string = "default"
let initialState: array<Transaction.t> = []

@react.component
let make = () => {
  let (transactions, setTransactions) = React.useState(_ => initialState)
  let (numberOfTransactions, setNumberOfTransactions) = React.useState(_ => 0);

  // let addTransactionsToState = (description, amount, isPositive) => {
  //   setTransactions(prev => prev->Js.Array2.concat([{description, amount, isPositive}]))
  // }

  <div className="App">
    <h1> {"Expense Tracker"->React.string} </h1>
    <Balance allTransactions={transactions} />
    <History allTransactions={transactions} />
    <Form onSubmitHandler={setTransactions} numberOfTransactions={numberOfTransactions} transactionNumberHandler={setNumberOfTransactions}/>
  </div>
}
