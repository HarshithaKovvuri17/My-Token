# MyToken (MTK) - ERC-20 Smart Contract

## 📌 Project Overview
MyToken is a functional **ERC-20 cryptocurrency token** built on the Ethereum blockchain. It was developed using the Solidity programming language and deployed using RemixIDE. This project demonstrates the core functionality of decentralized digital assets, including transferring tokens, tracking balances, and managing allowances.

## 🪙 Token Details
* **Name:** MyToken
* **Symbol:** MTK
* **Decimals:** 18
* **Total Supply:** 1,000,000 MTK (minted upon deployment)
* **Standard:** ERC-20

## 🚀 Features Implemented
This smart contract implements the mandatory ERC-20 standard functions:
* [cite_start]**`transfer`**: Allows users to send tokens to other addresses[cite: 18].
* [cite_start]**`approve`**: Allows a user to approve a third party (spender) to use their tokens[cite: 22].
* [cite_start]**`transferFrom`**: Enables a spender to transfer tokens on behalf of an owner (used for allowances)[cite: 26].
* [cite_start]**`balanceOf`**: Returns the token balance of a specific address[cite: 12].
* [cite_start]**`allowance`**: Checks the remaining amount a spender is allowed to use[cite: 13].
* [cite_start]**Events**: Emits `Transfer` and `Approval` events for blockchain transparency[cite: 15, 16].
* [cite_start]**Validation**: Includes checks for zero addresses and sufficient balances to prevent errors[cite: 18, 26].

## 🛠️ Technology Stack
* **Language:** Solidity (v0.8.x)
* **Development Environment:** Remix IDE
* **Network:** Remix VM (Local Blockchain)

## ⚙️ How to Run & Deploy
1.  **Open Remix IDE:** Go to [https://remix.ethereum.org/](https://remix.ethereum.org/).
2.  **Create File:** Create a new file named `MyToken.sol` in the `contracts` folder.
3.  **Compile:**
    * Click the **Solidity Compiler** tab.
    * Select Compiler version `0.8.26` (or newer).
    * Click **Compile MyToken.sol**.
4.  **Deploy:**
    * Go to the **Deploy & Run Transactions** tab.
    * Select **Remix VM** as the environment.
    * In the **Deploy** input box next to `_totalSupply`, enter the value with 18 decimals:
        `1000000000000000000000000`
    * Click **Deploy**.

## 📖 Usage Examples

### 1. Transferring Tokens
To send tokens to a friend:
1.  Call the `transfer` function.
2.  **Address:** Paste the recipient's wallet address.
3.  **Amount:** Enter the amount (e.g., `1000000000000000000` for 1 MTK).
4.  Click **transact**.

### 2. Checking Balance
1.  Copy any wallet address.
2.  Paste it into the `balanceOf` function field.
3.  Click the button to see the current holding.

### 3. Approving a Spender
1.  Call the `approve` function.
2.  **Spender:** Enter the address you want to authorize.
3.  **Value:** Enter the limit they can spend.
4.  Click **transact**.

## 🧠 Lessons Learned
* **Smart Contract Basics:** Learned how state variables and mappings store data on the blockchain.
* **Events:** Understood the importance of emitting events (`Transfer`) so off-chain applications can track activity.
* **Security:** Learned why checking for `address(0)` and sufficient balance is critical for preventing lost funds.
* **Standardization:** Gained an appreciation for why the ERC-20 standard exists to ensure compatibility across the ecosystem.

## 📄 License
This project is licensed under the MIT License.
