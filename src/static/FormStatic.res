let heading = "Transaction Entry"->React.string

let input1Label = "Description" ->React.string
let input1Placeholder = "Describe the transaction"
let input1RegEx="[a-zA-Z]+"
let input1TooltipText="Username should only contain alphabets"

let input2Label = "Amount" -> React.string
let input2Placeholder = "Enter +ve for Income and -ve for Expense"
let input2RegEx="[+-]?([0-9]*[.])?[0-9]+"
let input2TooltipText="Amount should only contain numbers"

let buttonText = "Submit" ->React.string