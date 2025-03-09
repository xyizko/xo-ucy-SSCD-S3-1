// Writing a library of functions 
// Important - for libs 
// 1. Similar to contracts , cant declare any state variables, cant send ether 
// 2. Embdedded in contract if all functions are internal 
// 3. Otherwise needs to be deployed and then linked 

//SPDX-License-Identifier: Banana

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

pragma solidity ^0.8.18;

library PriceConverter {

    // Function to get the the current ETH/USD price via Chainlink Smart Data Feeds
    // Note the Contract that fetches the price across several sources 
    // 0x694AA1769357215DE4FAC081bf1f309aDC325306 - ETH/USD Sepolia 
    function getPrice() internal view returns(uint256) {
        // Contract address - 0x694AA1769357215DE4FAC081bf1f309aDC325306
        // ABI - 

        address priceFeedAddress = 0x694AA1769357215DE4FAC081bf1f309aDC325306;
        AggregatorV3Interface priceFeed = AggregatorV3Interface(priceFeedAddress);
        (,int256 price,,,) = priceFeed.latestRoundData();

        // Price of ETH in usd
        return uint256(price * 1e10);

    }

    // Function that converts ETH to USD and returns the eth amount - Math is required to preserve precision
    function getConversionRate(uint256 ethAmount) internal view returns(uint256) {
        //1 ETH ?
        // 2000_00000000000000
        uint256 ethPrice = getPrice();

        // 2000_00000000000000 * 1_000000000000000000 / 1e18
        // $2000 = 1ETH
        uint256 ethAmountInUsd = (ethPrice * ethAmount)/1e18;
        return ethAmountInUsd;

    }


    // Calling the native version() of the AggregateV3Inerface toget its version
    function getVersion() internal view returns (uint256) {
        address priceFeedAddress = 0x694AA1769357215DE4FAC081bf1f309aDC325306;
        return AggregatorV3Interface(priceFeedAddress).version();
    }

}