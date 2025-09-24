// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Eligibility{
    uint public minAge = 18;
    address owner;

    constructor(){
        owner = msg.sender;
    }

    function checkEligibility(uint age) view public returns (bool) {
        if (age >= minAge) {
            return true;
        }
        else{
            return false;
        }
    }

    function updateMinAge(uint newMinAge) public{
        require(msg.sender == owner, "Only owner can update minAge");
        minAge = newMinAge;
    }
}