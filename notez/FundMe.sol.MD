# FundMe.sol Notes 

1. Good practice to first write out all the proposed functionality 
2. Then determine 
    - Who will acess it ? 
3. The ability of a function to hold funds is by adding the `payable` kw. This makes the button look red in the UI
    - This makes the contract behave like a wallet 
    - `msg.value` - Will add th ability 
     - https://docs.soliditylang.org/en/latest/cheatsheet.html#block-and-transaction-properties - Location of the Block and Transaction Properties
    