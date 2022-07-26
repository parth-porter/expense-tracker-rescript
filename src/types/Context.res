type t = {
  transactions: array<Transaction.structure>,
  transaction_setter: (array<Transaction.structure> => array<Transaction.structure>) => unit,
  transaction_number: int,
  transaction_number_setter: (int => int) => unit
}
