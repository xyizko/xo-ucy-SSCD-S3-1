// Check the FundMe.Sol inside others/ for tests

//SPDX-License-Identifier: Bananana 

pragma solidity ^0.8.18;

import {PriceConverter} from "./PriceConverter.sol";


contract FundMe {

    // Attach functions in PriceConverter.sol into the uin256 variable
    using PriceConverter for uint256;

    uint256 public minimumUsd = 1e18;

    address[] public funders;
    mapping(address => uint256 amountFunded) public addressToAmountFunded;

    function fund() public payable{
        msg.value.getConversionRate();

        require(msg.value.getConversionRate() > minimumUsd, "You need to fund more than 50 ETH");

        // The address array has been made above - With the code below the senders address will be populated in the array
        funders.push(msg.sender);

        // Adding Amount funded to the array 
        addressToAmountFunded[msg.sender] = addressToAmountFunded[msg.sender] + msg.value;


    }
}
