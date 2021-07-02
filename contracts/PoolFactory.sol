// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

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
  function depositToPool(uint poolID) public {
    Pool storage pool = pools[poolID];
    // increase deposit amount
  }

  /**
   * 
   */
  function withdrawFromPool(uint poolID) public {

  }
}