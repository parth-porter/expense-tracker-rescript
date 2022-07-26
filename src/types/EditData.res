type input = {
    mutable index: int
}
let onSubmitEdit = (inputs, transactions, input1, input2, setTransactions) => {
        let transactionsCopy:array<Transaction.structure> = Js.Array.copy(transactions)

        let amountNew = TypeConversions.string_to_float(input2)

        let editedTransaction:Transaction.structure = {
            id: transactionsCopy[inputs.index].id,
            description: input1,
            amount: amountNew,
            isPositive: amountNew > 0. 
        }

        transactionsCopy[inputs.index] = editedTransaction

        setTransactions(_ => transactionsCopy)
    }