%%raw(`import './form-component-styles.css';`)

let initalInputs: FormData.inputs = {
  input1: "",
  input2: "",
}

@react.component
let make = (~onSubmitHandler, ~numberOfTransactions, ~transactionNumberHandler) => {
  let (formInputs, setFormInputs) = React.useState(_ => initalInputs)

  let onSubmitClick = () => {
    FormSubmit.onSubmitClick(
      formInputs,
      numberOfTransactions,
      onSubmitHandler,
      transactionNumberHandler,
    )

    setFormInputs(_ => {input1: "", input2: ""})
  }

  <div className="form-component">
    <h3> {"Transaction Entry"->React.string} </h3>
    <hr />
    <div className="form-inputs" />
    <label> {"Description"->React.string} </label>
    <br />
    <input
      className="form-input1"
      type_="text"
      value={formInputs.input1}
      onChange={event => FormSubmit.inputEventHandler(event, FormSubmit.Input1, setFormInputs)}
    />
    <br />
    <br />
    <label> {"Amount"->React.string} </label>
    <br />
    <input
      className="form-input2"
      type_="number"
      value={formInputs.input2}
      onChange={event => FormSubmit.inputEventHandler(event, FormSubmit.Input2, setFormInputs)}
    />
    <br />
    <button onClick={_ => onSubmitClick()} className="button-submit">
      {"Submit"->React.string}
    </button>
  </div>
}
