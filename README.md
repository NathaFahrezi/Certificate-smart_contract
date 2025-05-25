# 🧾 Certificate Contract

Smart contract for storing and verifying digital certificates on the Ethereum blockchain.  
This repository is focused on the **Solidity smart contract** and deployment setup using **Hardhat**.

---

## ⚙️ Features

- Save certificate metadata and IPFS hash securely on-chain
- Prevents duplicate certificate entries (based on hash)
- Retrieve and verify certificates from public blockchain
- Designed for integration with a frontend DApp (see: `certificate-dapp`)

---

## 📁 Project Structure

```bash
certificate-contract/
├── contracts/
│   └── DigitalCertificateStorage.sol     # Smart contract
├── scripts/
│   └── deploy.js                         # Deployment script
├── test/
│   └── DigitalCertificateStorage.test.js # (Optional) tests
├── .env                                  # Env variables (ignored by git)
├── hardhat.config.js                     # Hardhat config
├── package.json
└── README.md

---

*🙌 Credits*
Developed by Nathafhrz
Part of final project – Certificate Storage DApp
Powered by Ethereum & IPFS – 2025
