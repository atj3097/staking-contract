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

        struct Stake {
                address owner;
                uint256 amount;
        }

        struct StakingPool {
                uint256 id;
                uint256 totalStaked;
                uint256 beginDate;
                uint256 endDate;
                uint256 reward;
                uint256 totalReward;
                uint256 totalStakers;
                mapping(address => Stake) stakes;
        }

        ERC20 public stakingToken;
        uint256 public tokenBalance;
        uint256 public beginDate;


        constructor(ERC20 _stakingToken,
                uint256 _tokenBalance,
                uint256 _beginDate) {
                stakingToken = _stakingToken;
                tokenBalance = _tokenBalance;
                beginDate = _beginDate;
        }

        function stakeTokens(uint256 _id, uint256 amount) public {
                StakingPool storage stakingPool = stakingPools[_id];
                Stake storage stake = Stake(msg.sender, amount);
                stakingPool.stakes[msg.sender] = stake;
                stakingPool.totalStaked += amount;
                stakingPool.totalStakers += 1;
                stakingToken.transferFrom(msg.sender, address(this), amount);
        }


}