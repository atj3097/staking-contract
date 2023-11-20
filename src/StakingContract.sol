// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "lib/openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";
import "lib/openzeppelin-contracts/contracts/token/ERC20/IERC20.sol";


/*
Stake Together
A contract owns 1,000,000 cloud coins.
Anyone who stakes cloud coin into the contract starting on the beginDate and holds it for 7 days will
receive a reward proportional their portion of the total stake at the expiration.
For example, suppose Alice stakes 5,000 cloud coin, but the total amount staked at expiration is 25,000 cloud coin.
Alice will then be entitled to 200,000 of the rewards, because she accounted for 20% of all the users.
Warning: it’s very easy to accidentally compute the rewards in such a way that a malicious actor can abuse the system.
Think carefully about the corner cases!
*/

contract StakingContract {

        ERC20 public stakingToken;

        constructor(ERC20 _stakingToken) {
                stakingToken = _stakingToken;
        }


}