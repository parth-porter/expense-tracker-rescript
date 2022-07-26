type inputSelection = 
    | Input1
    | Input2


let onSubmitClick = (formInputs: FormData.inputs, numberOfTransactions, onSubmitHandler, transactionNumberHandler) => {
    //adds the transaction to the state
        let amountFloat = TypeConversions.string_to_float(formInputs.input2)

        let objectCreated: Transaction.structure = {
            id: numberOfTransactions,
            description: formInputs.input1,
            amount: amountFloat,
            isPositive: (amountFloat > 0. ? true : false)
        }

        onSubmitHandler(prev => {
            prev -> Js.Array2.concat([objectCreated])
        })

        transactionNumberHandler(prev => prev + 1)
}

let inputEventHandler = (event, inputSelector: inputSelection, setFormInputs) => {
    //handles changes in the input fields of the form
    let newValue = ReactEvent.Form.target(event)["value"]
    
    switch inputSelector {
    | Input1 => {setFormInputs(prev => {...prev, FormData.input1: newValue})}
    | Input2 => {setFormInputs(prev => {...prev, FormData.input2: newValue})}
    }
}