# Avalock // Golden Key

## Avalanche Track 2

### Presentation/Pitch Ideas

### Video Demo:
- [ ] Youtube demo
- [ ] Video capture of Figma
- [ ] Video capture of Remix/Smart contract/Cloud
- [ ] Voiceover of process + still or video capture of Lucidspark

---

## Storyline

### Background
According to AgeUK, more than 800,000 older people in England and Wales reported being victims of fraud in the past year alone. People are now nearly three times more likely to be a victim of fraud than to be burgled and nearly 19 times more likely to be a victim of fraud than to be mugged. [(1)](#references)

Banking services are moving away from High Streets and into the digital space, leaving older generations technologically behind and most vulnerable to digital scams.

---

## Solution
**Avalock** - A smart contract built on a custom Avalanche L1.

**Golden Key** - A mobile application designed to improve security and accessibility for users.

Wireframe User Interface: https://bit.ly/3CwPP2t

Our mobile app, designed with a user-friendly wireframe in Figma, features a simple transaction interface tailored for elderly users, ensuring ease of use while enhancing financial security. The streamlined design prioritizes clarity and accessibility, displaying clear transaction summaries, recipient details, and approval steps to help users fully understand where their money is going. To prevent mistakes and fraud, the app incorporates confirmation prompts, scam warnings, and multi-signature approvals, requiring trusted contacts to verify large or unusual transactions. Additionally, the interface integrates time-delayed withdrawals, allowing users to cancel suspicious transfers before they are processed, giving them an extra layer of protection against scams. By combining intuitive design with smart contract-backed security, our solution empowers elderly users to navigate Web3 safely and confidently.

---

## Process & Tech Stack

### Avalanche L1 

Avalanche L1 is an ideal choice for a Web3 mobile app that protects elderly users from financial fraud due to its scalability, interoperability, and cross-chain security. Unlike Ethereum, which can be slow and expensive, Avalanche processes transactions in under two seconds with significantly lower gas fees. This makes it perfect for elderly users who need fast approvals for multi-signature transactions and quick response times when freezing accounts to prevent fraud. The high throughput ensures that security features like time-delayed withdrawals and scam detection work instantly and affordably, making blockchain-based protection accessible to more users.

Interoperability is another clear advantage. Since Avalanche’s C-Chain is EVM-compatible, the app can easily connect with existing Ethereum wallets like MetaMask, allowing users and guardians to approve transactions across different blockchains. 

This combination of speed, affordability, and interoperability makes Avalanche the best foundation for a Web3 security-focused mobile app, ensuring that elderly users can confidently navigate the blockchain space without fear of fraud.

### Vyper 

We chose Vyper v4 for our smart contract because of its Pythonic syntax, security, and efficiency, making it an ideal choice for fraud prevention in a Web3 mobile app for elderly users. Unlike Solidity, Vyper is built specifically for smart contracts, with a simple and auditable structure that reduces vulnerabilities like reentrancy attacks and overflow errors. With Vyper modules, we can efficiently import external code, keeping the contract modular and maintainable. Additionally, Vyper’s native support in Remix allows us to deploy and test contracts securely using MetaMask, ensuring seamless integration across multiple networks. 


1. **Remix Solution 1** - The first version of the solution was compiled and deployed using Remix IDE.
2. **Docker Infrastructure Solution 2** - Scalable and containerized deployment.
3. **Avacloud/Core Solution 3** - Integration with Avacloud for enhanced blockchain functionality.

---

## References

(1) **"Older Person Becomes Fraud Victim Every 40 Seconds | Press Release"** - Age UK.
[Read More](https://www.ageuk.org.uk/latest-press/articles/2019/july/older-person-becomes-fraud-victim-every-40-seconds/). Accessed 9 Feb. 2025.

