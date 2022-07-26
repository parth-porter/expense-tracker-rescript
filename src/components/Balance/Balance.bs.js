// Generated by ReScript, PLEASE EDIT WITH CARE

import * as React from "react";
import * as ContextTxn from "../Context/ContextTxn.bs.js";
import * as BalanceUtils from "../../utils/BalanceUtils.bs.js";
import * as BalanceStatic from "../../static/BalanceStatic.bs.js";
import * as TypeConversions from "../../utils/TypeConversions.bs.js";

import './balance-component-styles.css';
;

function Balance(Props) {
  var match = React.useContext(ContextTxn.TxnContext.context);
  var allBalances = BalanceUtils.getAllBalances(match.transactions);
  return React.createElement("div", {
              className: "balance-component"
            }, React.createElement("div", {
                  className: "balance-total"
                }, React.createElement("div", {
                      className: "balance-total-content"
                    }, React.createElement("p", undefined, BalanceStatic.topHeading), React.createElement("h1", {
                          id: "balance-amount-display"
                        }, TypeConversions.float_to_RString(allBalances.balance)))), React.createElement("div", {
                  className: "balance-combined"
                }, React.createElement("div", {
                      className: "balance-combined-inner-white"
                    }, React.createElement("div", {
                          className: "balance-combined-income"
                        }, React.createElement("p", undefined, BalanceStatic.subHeadingLeft), React.createElement("p", {
                              className: "income-amount"
                            }, TypeConversions.float_to_RString(allBalances.income))), React.createElement("div", {
                          className: "balance-combined-expenses"
                        }, React.createElement("p", undefined, BalanceStatic.subHeadingRight), React.createElement("p", {
                              className: "expense-amount"
                            }, TypeConversions.float_to_RString(allBalances.expense))))));
}

var make = Balance;

export {
  make ,
  
}
/*  Not a pure module */
