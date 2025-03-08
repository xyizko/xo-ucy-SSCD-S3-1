// Planning section of the contract 
// Get funds from users 
// Withdraw Funds
// Set minimum funding value in usd 

// SPDX-License-Identifier: MITZ

pragma solidity ^0.8.18;

// Next step in planning is first write out all the required functions in the contract 

contract FundMe {

    // Success Message event
    event Funded(address indexed sender, uint256 amount, string message);

    // Function that actuall used for funding the contract which will be deployed
    function fund() public payable {

        // Allow users to send $ 

        // Have a minimum $ set - Here its 100Wei
        require (msg.value >= 100, "Not Enough"); // 1ETH = 1e18 

        // Success Message event
        emit Funded(msg.sender, msg.value, "Funding Successful");

        // 1. Determing how to sent funds to this contract



    } 

    // function withdraw() public {}
}