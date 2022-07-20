let add = (a, b) => a + b

@react.component
let make = () => {
  let (count, setCount) = React.useState(_ => 0)

  <>
    <div>
      <h3> {count->Belt.Int.toString->React.string} </h3>
      <button onClick={_ => setCount(prev => prev + 1)}> {"Add"->React.string} </button>
    </div>
  </>
}
