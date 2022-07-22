

let deleteTransaction = (~transactionHandler, ~transactionNumber, ~transactions) => {
    let transactionCopy: array<Transaction.t> = Js.Array2.copy(transactions)
    Js.Array2.forEachi(transactionCopy, (x: Transaction.t, index) => {
        if Js.Int.equal(x.id: int,transactionNumber) {
            let wtf = Js.Array2.spliceInPlace(transactionCopy, ~pos=index, ~remove=1, ~add=[])
            transactionHandler(_ => transactionCopy)
            Js.Console.log2(transactionCopy, wtf)
        }
    })

    // Js.Console.log(transactionCopy)

    
}