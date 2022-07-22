let float_to_RString = (input: float) : React.element => {
    input->Js.Float.toFixedWithPrecision(~digits=2)->React.string
}

let string_to_float = (input: string): float => {
    let holder1 = input->Belt.Float.fromString


    let holder2 = switch holder1 {
    | Some(n) => n
    | None => 0.0
    }

    let holder3 = holder2->Js.Float.toFixedWithPrecision(~digits = 2)->Belt.Float.fromString

    switch holder3 {
    | Some(n) => n
    | None => 0.0
    }
}