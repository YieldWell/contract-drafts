// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

/**
 * Not too sure what this contract is for...
 * is this the main contract for handling the moving of funds, ie, acting as our wrapper/middleman
 * user deposits funds here => contract takes funds => deposits funds in strat => withdraws
 * to contract when ready?
 */
contract ApprovedStrat {
  address[] public approvedStrategies;

  function deposit() public {}

  function addStrat() public {}

  function removeStrat() public {}

  function harvest() public {}

  event Deposit();
}