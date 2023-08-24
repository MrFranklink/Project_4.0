// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract FranklinToken is ERC20, ERC20Burnable, Ownable {
    constructor() ERC20("Franklin Token", "MAI") {
        _mint(msg.sender, 100);
    }

    function customMint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }
    function customBurnTokens(uint amount) public {
        _burn(msg.sender, amount);
    }
    function customTransferTokens(address to, uint256 amount) public {
        _transfer(msg.sender,to,amount);
    }
}

