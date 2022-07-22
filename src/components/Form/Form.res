%%raw(`import './form-component-styles.css';`)

let initalInputs: FormData.inputs = {
  input1: "",
  input2: "",
}

@react.component
let make = (~onSubmitHandler, ~numberOfTransactions, ~transactionNumberHandler) => {
  let (formInputs, setFormInputs) = React.useState(_ => initalInputs)

  let onSubmitClick = (event) => {
    ReactEvent.Form.preventDefault(event)
    FormSubmit.onSubmitClick(
      formInputs,
      numberOfTransactions,
      onSubmitHandler,
      transactionNumberHandler,
    )

    setFormInputs(_ => {input1: "", input2: ""})
  }

  <div className="form-component">
  <form onSubmit={event => onSubmitClick(event)}>
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
      required=true
    />
    <br />
    <br />
    <label> {"Amount"->React.string} </label>
    <br />
    <input
      className="form-input2"
      type_="number"
      step=0.01
      value={formInputs.input2}
      onChange={event => FormSubmit.inputEventHandler(event, FormSubmit.Input2, setFormInputs)}
      required=true
    />
    <br />
    <button type_="submit" className="button-submit">
      {"Submit"->React.string}
    </button>
    </form>
  </div>
}
