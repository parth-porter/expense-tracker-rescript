// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Edit from "../components/Edit/Edit.bs.js";
import * as Curry from "rescript/lib/es6/curry.js";
import * as Js_int from "rescript/lib/es6/js_int.js";

function deleteTransaction(transaction_setter, transactionNumber, transactions) {
  var transactionCopy = transactions.slice();
  transactionCopy.forEach(function (x, index) {
        if (Js_int.equal(x.id, transactionNumber)) {
          transactionCopy.splice(index, 1);
          return ;
        }
        
      });
  return Curry._1(transaction_setter, (function (param) {
                return transactionCopy;
              }));
}

function editTransaction(editWindowToggle, transactionNumber, transactions) {
  transactions.forEach(function (x, index) {
        if (Js_int.equal(x.id, transactionNumber)) {
          return Edit.setIndex(index);
        }
        
      });
  Curry._1(editWindowToggle, (function (prev) {
          return !prev;
        }));
  
}

export {
  deleteTransaction ,
  editTransaction ,
  
}
/* Edit Not a pure module */
