![Alt Text](https://github.com/aibiassi-054/Avalock/blob/main/Avalock%20system.png)


Environment + Infrastructure Solutions

The high level design is as follows:

![Alt Text](https://github.com/aibiassi-054/Avalock/blob/main/Avalock%20system.png)

The key components of the solution are:
Front End:
Application front end: the user interacts with the front end UI
Wallet Integration: MetaMask and Core Wallet for Identity & transaction signing
API Calls: the application communicates with the wallets via API 
The wallets communicates with the Avalanche network via JSON-RPC; 
![Alt Text](https://github.com/aibiassi-054/Avalock/blob/main/Blockchain%20Infra/Screenshot%202025-02-09%20at%2011.20.03.png)


Avalanche L1 Network:

![Alt Text](https://github.com/aibiassi-054/Avalock/blob/main/Blockchain%20Infra/Screenshot%202025-02-09%20at%2011.03.49.png)
C-Chain (EVM-based): the blockchain network with 2 L1 nodes. Runs smart contracts (like Ethereum)

![Alt Text] (https://github.com/aibiassi-054/Avalock/blob/main/Blockchain%20Infra/Screenshot%202025-02-09%20at%2011.07.55.png)

RPC endpoint: provide external access to interact with the blockchain
Proof-of-Authority (PoA) blockchain
![Alt Text](https://github.com/aibiassi-054/Avalock/blob/main/Blockchain%20Infra/Screenshot%202025-02-09%20at%2011.13.19.png)


Docker Container: hosts the L1 network and blockchain smart contract
Avacloud: the L1 network can be hosted by Avacloud. Avacloud abstracts the avalanche infrastructure (docker containers, foundry smart contracts and avalanche L1 EVM). This simplifies the deployment and maintenance.

![Alt Text](https://github.com/aibiassi-054/Avalock/blob/main/Blockchain%20Infra/Screenshot%202025-02-09%20at%2011.15.41.png)
Smart Contracts:
Technology: Solidity (EVM-compatible)
Frameworks: Foundry
Avalock Smart Contract:

![Alt Text](https://github.com/aibiassi-054/Avalock/blob/main/Blockchain%20Infra/Screenshot%202025-02-09%20at%2011.09.45.png)

