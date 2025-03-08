// Check the FundMe.Sol inside others/ for tests

//SPDX-License-Identifier: Bananana 

pragma solidity ^0.8.18;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

contract FundMe {

    uint256 public minimumUsd = 5e18;

    address[] public funders;

    function fund() public payable{
    
    // Allow users to send $
    // Have minimum 0.50$ sent
    // 1. How to send eth to this contract 

    require(msg.value > 100, "Minimum 100 Banans"); // 1e18 = 1 ETH = 1,000,000,000,000,000,000

    // The address array has been made above - With the code below the senders address will be populated in the array
    funders.push(msg.sender);


    }

    function getPrice() public view returns(uint256) {
        // Contract address - 0x694AA1769357215DE4FAC081bf1f309aDC325306
        // ABI - 

        address priceFeedAddress = 0x694AA1769357215DE4FAC081bf1f309aDC325306;
        AggregatorV3Interface priceFeed = AggregatorV3Interface(priceFeedAddress);
        (,int256 price,,,) = priceFeed.latestRoundData();

        // Price of ETH in usd
        return uint256(price * 1e10);

    }

    function getConversionRate(uint256 ethAmount) public view returns(uint256) {
        //1 ETH ?
        // 2000_00000000000000
        uint256 ethPrice = getPrice();

        // 2000_00000000000000 * 1_000000000000000000 / 1e18
        // $2000 = 1ETH
        uint256 ethAmountInUsd = (ethPrice * ethAmount)/1e18;
        return ethAmountInUsd;

    }



}
