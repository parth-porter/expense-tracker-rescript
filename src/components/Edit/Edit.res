%%raw(`import './edit-component-styles.css';`)

let inputs: EditData.input = {
  index: -1,
}

let formValues: FormData.inputs = {
  input1: "",
  input2: "",
}

let setIndex = (~inputIndex) => {
  inputs.index = inputIndex
}

@react.component
let make = (~editToggle, ~transactions: array<Transaction.structure>, ~setTransactions) => {
  let (input1, setInput1) = React.useState(_ => transactions[inputs.index].description)
  let (input2, setInput2) = React.useState(_ =>
    Belt.Float.toString(transactions[inputs.index].amount)
  )

  <div className="edit-component">
    <div className="background-popup-window">
      <h3> {"Edit Transaction"->React.string} </h3>
      <form
        onSubmit={_ =>
          EditData.onSubmitEdit(inputs, transactions, input1, input2, setTransactions)}>
        <div className="form-inputs" />
        <label> FormStatic.input1Label </label>
        <br />
        <input
          className="form-input1"
          type_="text"
          pattern=FormStatic.input1RegEx
          title=FormStatic.input1TooltipText
          required=true
          placeholder=FormStatic.input1Placeholder
          value={input1}
          onChange={event => setInput1(_ => ReactEvent.Form.target(event)["value"])}
        />
        <br />
        <br />
        <label> FormStatic.input2Label </label>
        <br />
        <input
          className="form-input2"
          type_="text"
          pattern=FormStatic.input2RegEx
          title=FormStatic.input2TooltipText
          placeholder=FormStatic.input2Placeholder
          required=true
          value={input2}
          onChange={event => setInput2(_ => ReactEvent.Form.target(event)["value"])}
        />
        <br />
        <button type_="submit" className="button-submit"> {FormStatic.buttonText} </button>
      </form>
      <button className="button-submit" onClick={_ => editToggle(prev => !prev)}>
        {"Exit"->React.string}
      </button>
    </div>
  </div>
}
