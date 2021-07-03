// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "../88mph-contracts/contracts/DInterest.sol";

contract PoolFactory {

  struct Pool {
    // address of 88mph pool used
    address strat;
    // the charity receiving funds
    address payable recipient;
    // amount deposited in pool
    uint totalDeposit;
  }

  Pool[] public pools;

  event NewPool(uint poolID, address strat, address payable recipient);

  /**
   * Creates a new pool, where strat is underlying 88mph pool to receive yield on
   * @param strat underlying 88mph pool to receive yield on, must be approved strat
   * @param recipient charity organization receiving funds; must be whitelisted
   */
  function createNewPool(address strat, address payable recipient) public returns (uint poolID) {
    // require strat to be approved
    // require recipient to be approved
    // push a new Pool struct to the array
    pools.push(Pool(strat, recipient, 0));
    poolID = pools.length - 1;
    // emit new pool event
    emit NewPool(poolID, strat, recipient);
  }

  /**
   * Allows users to deposit funds to their chosen pool
   */
  function depositToPool(uint poolID, uint amount) public {
    Pool storage pool = pools[poolID];

    DInterest mphPool = DInterest(pool.strat);
    ERC20 token = ERC20("not sure what address goes here");
    uint depositAmount = amount;
    // change later, not sure what for
    uint maturationTimeStamp = now + 365 days;

    require(token.approve(address(mphPool), depositAmount));
    mphPool.deposit(depositAmount, maturationTimestamp);
  }

  /**
   * 
   */
  function withdrawFromPool(uint poolID) public {
    // withdraw from 88mph strat

    // reinvest original loan
    // pay yield to approved recipient
  }
}