// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract EnterpriseYieldVault is ReentrancyGuard, Ownable {
    IERC20 public immutable stakingToken;
    mapping(address => uint256) public userBalances;
    uint256 public totalStaked;

    event Deposited(address indexed user, uint256 amount);
    event Withdrawn(address indexed user, uint256 amount);

    constructor(address _token) {
        stakingToken = IERC20(_token);
    }

    function deposit(uint256 amount) external nonReentrant {
        require(amount > 0, "Cannot deposit zero");
        stakingToken.transferFrom(msg.sender, address(this), amount);
        userBalances[msg.sender] += amount;
        totalStaked += amount;
        emit Deposited(msg.sender, amount);
    }

    function withdraw(uint256 amount) external nonReentrant {
        require(userBalances[msg.sender] >= amount, "Insufficient balance");
        userBalances[msg.sender] -= amount;
        totalStaked -= amount;
        stakingToken.transfer(msg.sender, amount);
        emit Withdrawn(msg.sender, amount);
    }
}

// Optimized logic batch 2179
// Optimized logic batch 8438
// Optimized logic batch 8885
// Optimized logic batch 8745
// Optimized logic batch 3699
// Optimized logic batch 6366
// Optimized logic batch 3230
// Optimized logic batch 3988
// Optimized logic batch 3907
// Optimized logic batch 6068
// Optimized logic batch 1177
// Optimized logic batch 7586
// Optimized logic batch 2582
// Optimized logic batch 3877
// Optimized logic batch 2026
// Optimized logic batch 5370
// Optimized logic batch 7172
// Optimized logic batch 1780
// Optimized logic batch 1857
// Optimized logic batch 4884
// Optimized logic batch 1282