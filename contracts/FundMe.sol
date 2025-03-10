// Check the FundMe.Sol inside others/ for tests

//SPDX-License-Identifier: Bananana 

pragma solidity ^0.8.18;

import {PriceConverter} from "./PriceConverter.sol";


contract FundMe {

    ////////////////////////////////
    //// Variable assigments  //////
    ////////////////////////////////

    // Attach functions in PriceConverter.sol into the uin256 variable
    using PriceConverter for uint256;

    uint256 public minimumUsd = 1e18;

    address[] public funders;
    mapping(address => uint256 amountFunded) public addressToAmountFunded;

    address public owner;

    // This ensures that deployer of the contract is only availbale to call the functions in t
    // Contract logic section 
    constructor() {
        owner = msg.sender ;
    }

    ////////////////////////////////
    //// Contract logic section ////
    ////////////////////////////////


    function fund() public payable{
        msg.value.getConversionRate();

        require(msg.value.getConversionRate() > minimumUsd, "You need to fund more than 50 ETH");

        // The address array has been made above - With the code below the senders address will be populated in the array
        funders.push(msg.sender);

        // Adding Amount funded to the array 
        addressToAmountFunded[msg.sender] += msg.value;
    }

    // Withdraw all the funds reset mapping to 0 
    function withdraw() public onlyOwner {

        // Setting the caller of this function only to deployer (owner)
        require (msg.sender == owner, "Only Owner Bastard !");

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

        // transfer - Method for sending funds back to sender - Autorevert doesnt need to take into account fail case
        // payable(msg.sender).transfer(address(this).balance);
        
        // send - Method for sending funds back to sender - Need to add a fail condition also here
        // bool sendSuccess = payable(msg.sender).send(address(this).balance);
        // require(sendSuccess, "Failed to send back ETH");

        // call - Method for sending funds back to sender - Lower Command
        (bool callSucces,)=payable(msg.sender).call{value: address(this).balance}("");
        require (callSucces, "Call failed");

    }

    // Creating a modifier 

    modifier onlyOwner() {
        require(msg.sender == owner, "U NO OWNER FCKFCK!"); // First execute this
        _; // Then execute the function
    }

}
