type localDataType =
  | LocalArray
  | LocalInt

let getDataFromLocal = (dataField: string) => {
  let localDataOption = Dom_storage2.getItem(Dom_storage2.localStorage, dataField)

  switch localDataOption {
  | Some(n) => n
  | None => ""
  }
}

let setDataToLocal = (dataField: string, data: option<string>) => {
  let dataExtracted = switch data {
  | Some(n) => n
  | None => ""
  }

  Dom_storage2.setItem(Dom_storage2.localStorage, dataField, dataExtracted)
}

