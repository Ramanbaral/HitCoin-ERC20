//SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "./ICryptoDevs.sol";

contract HitCoin is ERC20, Ownable{
    uint256 public constant tokenPrice = 0.00001 ether;

    uint256 public constant maxTotalSupply = 100_000_000_000_000 * 10**18;

    constructor() ERC20("HitCoin", "HTC"){
        _mint(msg.sender, 50_000_000_000_000 * 10**18);
    }

    /**
    * @dev Mints `amount` number of CryptoDevTokens
    * Requirements:
    * - `msg.value` should be equal or greater than the tokenPrice * amount
    */
    function mint(uint256 amount) public payable {

        uint256 requiredEther = tokenPrice * amount;
        require(msg.value >= requiredEther, "Insufficient Ether");

        uint256 amountWithDecimals = amount * 10**18;
        require(totalSupply() + amountWithDecimals <= maxTotalSupply, "Exceeds the maximum total supply available");

        _mint(msg.sender, amountWithDecimals);

    }

    // Function to receive Ether. msg.data must be empty
    receive() external payable {}

    // Fallback function is called when msg.data is not empty
    fallback() external payable {}
}