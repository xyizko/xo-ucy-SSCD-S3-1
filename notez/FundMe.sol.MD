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