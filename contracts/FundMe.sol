// Check the FundMe.Sol inside others/ for tests

//SPDX-License-Identifier: Bananana 

pragma solidity ^0.8.18;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

contract FundMe {

    uint256 minimumUsd = 1.0;

    function fund() public payable{
    
    // Allow users to send $
    // Have minimum 0.50$ sent
    // 1. How to send eth to this contract 

    require(msg.value > 100, "Minimum 100 Banans"); // 1e18 = 1 ETH = 1,000,000,000,000,000,000
    }

    function getPrice() public {
        // Contract address - 0x694AA1769357215DE4FAC081bf1f309aDC325306
        // ABI - 
    }



}
