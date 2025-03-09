// Testing sagfemath openzeppellin which was active before solidty 0.8 

//SPDX-License-Identifier: Booty 

pragma solidity ^0.6.0;

contract SafeMathTester {

    event smellPanty(string);

    uint8 public bigNumber = 255;

    function setNumber() public {
        bigNumber = 255;
    }

    function add() public {
        bigNumber = bigNumber + 1; 
    }

    function lickPussy() public {
        emit smellPanty("LickHerAss");
    }
}