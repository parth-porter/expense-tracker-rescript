

@react.component
let make = (~onSubmitHandler, ~numberOfTransactions, ~transactionNumberHandler) => {

    let (input1, setInput1) = React.useState(_ => "")
    let (input2, setInput2) = React.useState(_ => "")

    let onSubmitClick = () => {
        let amountTemp = input2 -> Belt.Int.fromString;
        let amountFloat = switch amountTemp {
        | Some(n) => n
        | None => 0
        }

        let objectCreated: Transaction.t = {
            id: numberOfTransactions,
            description: input1,
            amount: amountFloat,
            isPositive: (amountFloat > 0 ? true : false)
        }

        onSubmitHandler(prev => {
            prev -> Js.Array2.concat([objectCreated])
        })

        setInput1(_ => "")
        setInput2(_ => "")

        transactionNumberHandler(prev => prev + 1)
    }
  

    let handleInput1 = e => {
        let newValue = ReactEvent.Form.target(e)["value"]
        setInput1(newValue)
    }

    let handleInput2 = e => {
        let newValue = ReactEvent.Form.target(e)["value"]
        setInput2(newValue)
    }



    <div className="form-component">
    <h3>{"Form Component" -> React.string}</h3>
        <label>{"Description" -> React.string}</label><br/>
        <input type_="text" value={input1} onChange={handleInput1}/><br/>
        <br/>
        <label>{"Amount" -> React.string}</label><br/>
        <input type_ = "number"  value={input2} onChange={handleInput2}/>
        <br/>
        <button onClick={_ => onSubmitClick()} >{"Submit" -> React.string}</button>
    <hr/>
    </div>
}