module TxnContext = {
  let defaultTxnObj: Context.t = {
    transactions: [],
    transaction_setter: _ => { () },
    transaction_number: -1,
    transaction_number_setter: _ =>{ () }
  }
  let context = React.createContext(defaultTxnObj)

  module Provider = {
    let provider = React.Context.provider(context)

    @react.component
    let make = (~value, ~children) => {
      React.createElement(provider, {"value": value, "children": children})
    }
  }
}
