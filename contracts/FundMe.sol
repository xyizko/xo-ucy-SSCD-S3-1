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
        addressToAmountFunded[msg.sender] += msg.value;
    }

    // Withdraw all the funds reset mapping to 0 

    function withdraw() public {
        // for loop 
        // [1,2,3,4] indeses
        // 0,1,2,3, indesex 

        // Resetting the array , when withdraw function is called then the for loop will reset 
        for (uint256 funderIndex = 0; funderIndex < funders.length; funderIndex++) {
            address funder = funders[funderIndex];
            addressToAmountFunded[funder] = 0;
        }

        // Reset array - make a new array 
        funders = new address[](0);

        // transfer - Method for sending funds back to sender
        // send - Method for sending funds back to sender
        // call - Method for sending funds back to sender





    }

}
