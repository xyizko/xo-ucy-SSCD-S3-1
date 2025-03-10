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
    3. Using immutable and constant has an impact on gas costs

12. Section 3 - Vid 25 
    1. Custom errors are another method of saving on gas costs 

13. S3V26
    1. Fallback function - When a contract receives ether and has no receive function

14. Regarding which function will be triggerred if msg.data is empty 

Firstly these are the different values and msg. functions 

Breakdown of msg.* Variables
Variable	Description
msg.sender	The address that sent the transaction (caller).
msg.value	The amount of Ether (in wei) sent with the transaction.
msg.data	The raw data (bytes) sent with the transaction (used in fallback()).
msg.sig	The first 4 bytes of msg.data (function identifier).
msg.gas (deprecated)	Gas available for the transaction (only for older versions).

- So the above is talking about the various values the msg.something can have 

```sh 
// Explainer from: https://solidity-by-example.org/fallback/
    // Ether is sent to contract
    //      is msg.data empty?
    //          /   \
    //         yes  no
    //         /     \
    //    receive()?  fallback()
    //     /   \
    //   yes   no
    //  /        \
    //receive()  fallback()

```