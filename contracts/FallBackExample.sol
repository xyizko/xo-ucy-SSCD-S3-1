// Fallback function example testing
// Refer official docs - https://docs.soliditylang.org/en/latest/contracts.html

//SPDX-License-Identifier: Banana

pragma solidity ^0.8.7;

contract FallbackExample {
    
    uint256 public result;

    receive() external payable {
        result = 69;
    }
    

}
