// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

/**
 * I'm a bit confused about the difference between "approved" and "whitelisted"
 * and what we're using each for
 * 
 */
contract Whitelist {
  address[] public approvedStrats;
  address[] public approvedRecipients;

  function approveStrat() public {
    // adds a strat to approvedStrats list
  }

  function unapproveStrat() public {
    // removes strat from approvedStrats
    // how to do this effieciently with an array?
  }

  function approveRecipient() public {
    // adds a recipient to approvedRecipients list
  }

  function unapproveRecipient() public {
    // removes recipient from approvedRecipients
    // how to do efficiently with array?
  }
}