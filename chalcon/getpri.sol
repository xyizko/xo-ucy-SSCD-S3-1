// Contract to get the spolia price from chainlink contact 

// SPDX-License-Identifer: Boobz

pragma solidity ^0.8.18; 

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

contract getPr {

    function getPrice() external view returns (uint256) {
    // Chainlink ETH/USD price feed address on Sepolia
    address priceFeedAddress = 0x694AA1769357215DE4FAC081bf1f309aDC325306;
    AggregatorV3Interface priceFeed = AggregatorV3Interface(priceFeedAddress);

    // Fetch the latest round data from the price feed
    (, int256 price,, ,) = priceFeed.latestRoundData();

    // Convert the price to 18 decimal places
    uint256 priceWith18Decimals = uint256(price) * 1e10;

    // Return the price with 18 decimal places
    return priceWith18Decimals;
}

}