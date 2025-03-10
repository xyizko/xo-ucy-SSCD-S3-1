# FundMe.sol Notes 

1. Good practice to first write out all the proposed functionality 
2. Then determine 
    - Who will acess it ? 
3. The ability of a function to hold funds is by adding the `payable` kw. This makes the button look red in the UI
    - This makes the contract behave like a wallet 
    - `msg.value` - Will add th ability 
     - https://docs.soliditylang.org/en/latest/cheatsheet.html#block-and-transaction-properties - Location of the Block and Transaction Properties

4. Regarding Reverts 
    - The gas WILL be used since the execution occurred in the EVM
    - Also any state variable changes are also not executed since the tx didnt go through    

5. Getting the interface for AggregateV3 
    - https://github.com/smartcontractkit/chainlink/blob/develop/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol
        - These are just the names of the functions with no logic 

6. Regarding math - Always Multiply before Divide - Whole Numbers only being used 

7 From - Section3-v20 
    - Three method of sending crypto to the sender
    - These being convered when learning about fundme loops, trying to send the funds back to sender

8. Reagarding call being the preferred way to sending or reciving tokens 

```solidity 
// call - Method for sending funds back to sender - Lower Command
        (bool callSucces,)=payable(msg.sender).call{value: address(this).balance}("");
        require (callSucces, "Call failed");
```
- This method is returns two objects 
    - a boolean object - 
    - a bytes object 

9. Constructors - Immediately called when the contract executes
    - Executed Once 
    - Used for settingup state variables 
    - Or in the currect code example to set who can call the `withdraw` function 

10. Regarding modifier 

```solidity 
// Creating a modifier 

    modifier onlyOwner() {
        require(msg.sender == owner, "U NO OWNER FCKFCK!"); // First execute this
        _; // Then execute the function
    }

```
- note the `_;` represent the rest of the function. If this is above `require` , that would mean to first execute the function and THEN the modifier directive. So this is a mistake and defeats the need for the modifier. So the ordering is important , always first the required functionality and then `_;`

11. Section 3 - VID 24 
    1. Regarding gas optimizations 
    2. Regarding usag of Constant and Immutable KW - 