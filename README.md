# Golden Key app powered by Avalock

### Background
According to AgeUK, more than 800,000 older people in England and Wales reported being victims of fraud in the past year alone. People are now nearly three times more likely to be a victim of fraud than to be burgled and nearly 19 times more likely to be a victim of fraud than to be mugged. [(1)](#references)

Banking services are moving away from High Streets and into the digital space with older generations being technologically left behind and most vulnerable to these digital scams. These changing conditions affect the older population at a time when their finances are most shifting due to life changes including retirement, reduced income, and increased medical or care expenses. As traditional banking services become less accessible, many elderly individuals are forced to navigate unfamiliar digital financial systems, making them prime targets for online scams, phishing attacks, and fraudulent transactions. Without the right tools and protections in place, they face significant risks of financial loss, which can have devastating consequences on their well-being and security. 

### Applications

In addition to being an app for the elderly population, our app, Golden Key, can be used by other vulnerable populations including older children and young adults. For this younger demographic, the app acts as a financial safety net, allowing parents or guardians to oversee large transactions and prevent unauthorized spending or scams. The app helps young users develop responsible financial habits by introducing them to secure digital transactions, multi-signature approvals, and fraud awareness in a controlled and supportive environment.

## Process & Tech Stack
## Solution

**Wireframe User Interface**

Figma Wireframe: https://www.figma.com/proto/tOQXgFS7mOMQvGb4lBkE26/Golden-Key?node-id=0-1&t=umDGGVMpg2kePz6w-1 

Our mobile app, designed with a user-friendly wireframe in Figma, features a simple transaction interface tailored for elderly users, ensuring ease of use while enhancing financial security. The streamlined design prioritizes clarity and accessibility, displaying clear transaction summaries, recipient details, and approval steps to help users fully understand where their money is going. To prevent mistakes and fraud, the app incorporates confirmation prompts, scam warnings, and multi-signature approvals, requiring trusted contacts to verify large or unusual transactions. Additionally, the interface integrates time-delayed withdrawals, allowing users to cancel suspicious transfers before they are processed, giving them an extra layer of protection against scams. By combining intuitive design with smart contract-backed security, our solution empowers elderly users to navigate Web3 safely and confidently.

**Avalock** - A smart contract built on a custom Avalanche L1.
The Vyper smart contract is designed to protect elderly users from financial fraud by incorporating multi-signature approvals, scam detection, and time-delayed withdrawals, all while leveraging Avalanche L1’s fast transaction finality and low fees to ensure security without high costs. The contract allows users to flag suspicious contracts to warn others of potential scams, ensuring that elderly users do not accidentally send funds to fraudulent addresses. It also includes a guardian approval system, where trusted individuals (such as family members or advisors) must approve high-value transactions before they are executed, preventing unauthorized withdrawals. Additionally, the time-delayed withdrawal mechanism ensures that users have 24 hours to cancel transactions, giving them a safety net in case they suspect fraud or coercion. By leveraging secure smart contract logic in Vyper on Avalanche’s scalable and interoperable blockchain, this contract ensures clarity, safety, and efficiency, making Web3 transactions safer and more accessible for elderly individuals.

**Golden Key** - A mobile application designed to improve security and accessibility for users.
The Golden Key mobile app seamlessly integrates with the Avalock smart contract on Avalanche L1, allowing elderly users to conduct safe blockchain transactions without the complexity of traditional Web3 interfaces. Through a simple, user-friendly dashboard, users can send and receive funds while automatically benefiting from built-in fraud protection mechanisms like multi-signature approvals and time-delayed withdrawals. The app enables users to easily add trusted guardians—such as family members or advisors—who can approve or reject high-risk transactions, ensuring an extra layer of security. By automating real-time scam detection and providing clear transaction details, the app helps users avoid financial mistakes and fraud while maintaining full transparency and control over their assets. With one-click approvals, accessible notifications, and guided transaction flows, Avalock transforms blockchain transactions into a safe, intuitive experience, making Web3 more accessible and secure for elderly individuals


## Tech stack
The high level design is as follows:
![Alt Text](https://github.com/aibiassi-054/Avalock/blob/main/Avalock%20system.png)

1. **Remix Solution 1** - The first version of the solution was compiled and deployed using Remix IDE.
The first version of the smart contract solution was compiled and deployed using Remix IDE which provided a quick, user-friendly environment for testing and deploying the Avalock smart contract. Remix allowed us to also seamlessly connect to MetaMask for deployment on Avalanche L1. Additionally, Remix has a Vyper plug-in that allows for compiling of Vyper scripts. After initial testing, we continued to develop using Docker in order to have all infrastructure in one container.

2. **Docker Infrastructure Solution 2** - Scalable and containerized deployment.

The setup video is here: https://github.com/aibiassi-054/Avalock/blob/main/video4860355459.mp4
More details bellow

3. **Avacloud/Core Solution 3** - Integration with Avacloud for enhanced blockchain functionality.

Details bellow

**Key Components**
The key components of the solution are:
1. Front End:
- Application front end: the user interacts with the front end UI
- Wallet Integration: MetaMask and Core Wallet for Identity & transaction signing
- API Calls: the application communicates with the wallets via API 
The wallets communicates with the Avalanche network via JSON-RPC; 
![Alt Text](https://github.com/aibiassi-054/Avalock/blob/main/Blockchain%20Infra/Screenshot%202025-02-09%20at%2011.20.03.png)

### 2. Avalanche L1 Network:

- Avalanche L1 network
**Avalanche L1** 
Avalanche L1 is an ideal choice for a Web3 mobile app that protects elderly users from financial fraud due to its scalability, interoperability, and cross-chain security. Unlike Ethereum, which can be slow and expensive, Avalanche processes transactions in under two seconds with significantly lower gas fees. This makes it perfect for elderly users who need fast approvals for multi-signature transactions and quick response times when freezing accounts to prevent fraud. The high throughput ensures that security features like time-delayed withdrawals and scam detection work instantly and affordably, making blockchain-based protection accessible to more users.

Interoperability is another clear advantage. Since Avalanche’s C-Chain is EVM-compatible, the app can easily connect with existing Ethereum wallets like MetaMask, allowing users and guardians to approve transactions across different blockchains. 

This combination of speed, affordability, and interoperability makes Avalanche the best foundation for a Web3 security-focused mobile app, ensuring that elderly users can confidently navigate the blockchain space without fear of fraud.

- C-Chain (EVM-based): the blockchain network with 2 L1 nodes. Runs smart contracts (like Ethereum)
![Alt Text](https://github.com/aibiassi-054/Avalock/blob/main/Blockchain%20Infra/Screenshot%202025-02-09%20at%2011.03.49.png)
![Alt Text](https://github.com/aibiassi-054/Avalock/blob/main/Blockchain%20Infra/Screenshot%202025-02-09%20at%2011.07.55.png)
- RPC endpoint: provide external access to interact with the blockchain
![Alt Text](https://github.com/aibiassi-054/Avalock/blob/main/Blockchain%20Infra/Screenshot%202025-02-09%20at%2011.13.19.png)
- Docker Container: hosts the L1 network and blockchain smart contract
- Avacloud: the L1 network can be hosted by Avacloud. Avacloud abstracts the avalanche infrastructure (docker containers, foundry smart contracts and avalanche L1 EVM). This simplifies the deployment and maintenance.
![Alt Text](https://github.com/aibiassi-054/Avalock/blob/main/Blockchain%20Infra/Screenshot%202025-02-09%20at%2011.15.41.png)
### 3. Smart Contracts:
- Technology: Solidity (EVM-compatible)
- Frameworks: Foundry
- Avalock Smart Contract:
![Alt Text](https://github.com/aibiassi-054/Avalock/blob/main/Blockchain%20Infra/Screenshot%202025-02-09%20at%2011.09.45.png)

**Vyper**
We chose Vyper v4 for our smart contract because of its Pythonic syntax, security, and efficiency, making it an ideal choice for fraud prevention in a Web3 mobile app for elderly users. Unlike Solidity, Vyper is built specifically for smart contracts, with a simple and auditable structure that reduces vulnerabilities like reentrancy attacks and overflow errors. With Vyper modules, we can efficiently import external code, keeping the contract modular and maintainable. Additionally, Vyper’s native support in Remix allows us to deploy and test contracts securely using MetaMask, ensuring seamless integration across multiple networks. 


### Future Development

**Avalanche Warp Messaging (AWM)**

Future development of the smart contracts and mobile app could include the creation of a fraud prevention network on Avalanche that automatically flags scam addresses and shares alerts across multiple blockchains. In the Golden Key app, we could introduce cross-chain scam detection, allowing users to receive instant warnings if they try to interact with a suspicious contract or wallet. This feature will help prevent fraud before it happens, making blockchain transactions safer and more secure for all users.

**AI Fraud Detection**
AI fraud detection is possible thanks to Avalanche’s fast processing. This will allow for the ability to quickly analyze transaction history and scam patterns in real time. Each transaction will be assigned a risk score by the smart contract and help users identify potential threats before they send money. In the Golden Key app, suspicious transactions could be paused and require additional guardian approvals adding an extra layer of security and protection for older demographics.



---

## References

(1) **"Older Person Becomes Fraud Victim Every 40 Seconds | Press Release"** - Age UK.
[Read More](https://www.ageuk.org.uk/latest-press/articles/2019/july/older-person-becomes-fraud-victim-every-40-seconds/). Accessed 9 Feb. 2025.

