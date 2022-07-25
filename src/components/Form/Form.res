%%raw(`import './form-component-styles.css';`)

let initalInputs: FormData.inputs = {
  input1: "",
  input2: "",
}

@react.component
let make = (~onSubmitHandler, ~numberOfTransactions, ~transactionNumberHandler) => {
  let (formInputs, setFormInputs) = React.useState(_ => initalInputs)

  let onSubmitClick = event => {
    ReactEvent.Form.preventDefault(event)
    FormUtils.onSubmitClick(
      formInputs,
      numberOfTransactions,
      onSubmitHandler,
      transactionNumberHandler,
    )

    setFormInputs(_ => {input1: "", input2: ""})
  }

  <div className="form-component">
    <form onSubmit={event => onSubmitClick(event)}>
      <h3> FormStatic.heading </h3>
      <hr />
      <div className="form-inputs" />
      <label> FormStatic.input1Label </label>
      <br />
      <input
        className="form-input1"
        type_="text"
        pattern=FormStatic.input1RegEx
        placeholder=FormStatic.input1Placeholder
        title=FormStatic.input1TooltipText
        value={formInputs.input1}
        onChange={event => FormUtils.inputEventHandler(event, FormUtils.Input1, setFormInputs)}
        required=true
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
        value={formInputs.input2}
        onChange={event => FormUtils.inputEventHandler(event, FormUtils.Input2, setFormInputs)}
        required=true
      />
      <br />
      
      <button type_="submit" className="button-submit"> {FormStatic.buttonText} </button>
    </form>
  </div>
}
