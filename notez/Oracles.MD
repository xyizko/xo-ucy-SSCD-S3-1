# Regarding Oracles 

1. Contracts deterministic cannot access externa data 
    - Important for maintaining consensus
    - Introducing external data will cause problems for attaining consensus across nodes

2. Oracle provides external information 
3. Explanation of chainlink oracles 

4. Get the ETH Seploia Feed Address from - https://docs.chain.link/data-feeds/price-feeds/addresses?network=ethereum&page=1#sepolia-testnet
    - Contact from SEPOLIA/USD = `0x694AA1769357215DE4FAC081bf1f309aDC325306`
    - Tested by deploying and it works as intended
    - Deployed contract - https://sepolia.etherscan.io/address/0x2Fb1DF8C3FF60B2654C7ED2DBb89e2C520183330
        - Note now you have find a way to interact with this contract to get the price
    - VRF - Verifiable Randomness Function
    - Note Chainlink Keep is now known as Chainlink Automation