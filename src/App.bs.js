// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Form from "./components/Form/Form.bs.js";
import * as React from "react";
import * as Balance from "./components/Balance/Balance.bs.js";
import * as $$History from "./components/History/History.bs.js";
import LogoSvg from "./logo.svg";

import './App.css';
;

var logo = LogoSvg;

var initialState = [];

function App(Props) {
  var match = React.useState(function () {
        return initialState;
      });
  var transactions = match[0];
  return React.createElement("div", {
              className: "App"
            }, React.createElement("h1", undefined, "Expense Tracker"), React.createElement(Balance.make, {
                  allTransactions: transactions
                }), React.createElement($$History.make, {
                  allTransactions: transactions
                }), React.createElement(Form.make, {
                  onSubmitHandler: match[1]
                }));
}

var make = App;

export {
  logo ,
  initialState ,
  make ,
  
}
/*  Not a pure module */
