//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract Donation {

    address public owner;
    address[] public donators;
    uint256 public availableFunds;
    mapping(address => uint256) public addressToAmount;

    constructor() {
        owner = msg.sender;
    }

    function fund() public payable {

        if (addressToAmount[msg.sender] == 0) {
            donators.push(msg.sender);
        }

        addressToAmount[msg.sender] += msg.value;
        
    }

    function getDonators() public view returns (address[] memory){
        return donators;
    }

    function getAmountPerDonator(address userAddress) public view returns (uint) {
        return addressToAmount[userAddress];
    }
    
    function withdraw(uint amount, address payable destAddr) public {

        availableFunds = address(this).balance;
        require(msg.sender == owner, "Only owner can withdraw funds");
        require(amount <= availableFunds, "Requested amount is higher than available funds");

        destAddr.transfer(amount);
    }
}
