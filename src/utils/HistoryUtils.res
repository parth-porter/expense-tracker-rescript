let deleteTransaction = (~transactionHandler, ~transactionNumber, ~transactions) => {
    let transactionCopy: array<Transaction.structure> = Js.Array2.copy(transactions)
    Js.Array2.forEachi(transactionCopy, (x: Transaction.structure, index) => {
        if Js.Int.equal(x.id,transactionNumber) {
            let _ = Js.Array2.spliceInPlace(transactionCopy, ~pos=index, ~remove=1, ~add=[])
            
        }
    })

    transactionHandler(_ => transactionCopy)
}

let editTransaction = (~editWindowToggle, ~transactionNumber, ~transactions) => {
    Js.Array2.forEachi(transactions, (x: Transaction.structure, index) => {
        if Js.Int.equal(x.id,transactionNumber) {
            Edit.setIndex(~inputIndex = index)
        }
    })
    let _ = editWindowToggle(prev => !prev)
}