// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract MimicingERC20
{

    address public tokenOwner;

    constructor(uint256 initialMintingAmt){
        tokenOwner = msg.sender;
        mintTokens(msg.sender, initialMintingAmt);
    }

    modifier onlyOwner() {
        require(msg.sender == tokenOwner, "Only owner can call this function");
        _;
    }

    string public tokenName = "FRANKLIN TOKEN 2";
    string public tokenSymbol = "FK2";
    uint256 public tokenTotalSupply;

    mapping(address => uint256) public tokenBalanceMap;

    

    function mintTokens(address to, uint256 amt) onlyOwner public 
    {
        tokenTotalSupply+=amt;
        tokenBalanceMap[to]+=amt;

    }

    function burnTokens(uint256 amt) public
    {
        if(tokenBalanceMap[msg.sender]-amt<0){
            revert();
        }
        tokenBalanceMap[msg.sender]-=amt;
        tokenTotalSupply-=amt;
    }

    function transferTokens(address to, uint256 amt) payable public 
    {
        if(tokenBalanceMap[msg.sender]-amt<0){
            revert();
        }
        tokenBalanceMap[msg.sender]-=amt;
        tokenBalanceMap[to]+=amt;
    }
}

