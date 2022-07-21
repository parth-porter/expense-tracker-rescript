let float_to_RString = (input: float) : React.element => {
    input->Belt.Float.toString->React.string
}

let string_to_float = (input: string): float => {
    let holder1 = input->Belt.Float.fromString

    switch holder1 {
    | Some(n) => n
    | None => 0.0
    }
}