// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Curry from "rescript/lib/es6/curry.js";
import * as TypeConversions from "./TypeConversions.bs.js";

function onSubmitClick(formInputs, numberOfTransactions, onSubmitHandler, transactionNumberHandler) {
  var amountFloat = TypeConversions.string_to_float(formInputs.input2);
  var objectCreated_description = formInputs.input1;
  var objectCreated_isPositive = amountFloat > 0;
  var objectCreated = {
    id: numberOfTransactions,
    description: objectCreated_description,
    amount: amountFloat,
    isPositive: objectCreated_isPositive
  };
  Curry._1(onSubmitHandler, (function (prev) {
          return prev.concat([objectCreated]);
        }));
  return Curry._1(transactionNumberHandler, (function (prev) {
                return prev + 1 | 0;
              }));
}

function inputEventHandler($$event, inputSelector, setFormInputs) {
  var newValue = $$event.target.value;
  if (inputSelector) {
    return Curry._1(setFormInputs, (function (prev) {
                  return {
                          input1: prev.input1,
                          input2: newValue
                        };
                }));
  } else {
    return Curry._1(setFormInputs, (function (prev) {
                  return {
                          input1: newValue,
                          input2: prev.input2
                        };
                }));
  }
}

export {
  onSubmitClick ,
  inputEventHandler ,
  
}
/* No side effect */
