# fhEVM Counter on Sepolia

A minimal example of deploying a smart contract with **fully homomorphic encryption (FHE)** on [Zama’s fhEVM](https://zama.ai).

## Contracts
- **`FHEVMConfig.sol`** — Provides Sepolia config + Oracle address  
- **`SepoliaConfig.sol`** — Initializes coprocessor and Oracle at deployment  
- **`FHECounter.sol`** — Encrypted counter with increment/decrement functions  

## Deploy on Remix
1. Open [Remix IDE](https://remix.ethereum.org).  
2. Create the following files:  
   - `FHE.sol` → from official [fhEVM repo](https://github.com/zama-ai/fhevm)  
   - `FHEVMConfig.sol` → from this repo  
   - `SepoliaConfig.sol` → from this repo  
   - `FHECounter.sol` → from this repo  
3. Compile with **Solidity `^0.8.24`**.  
4. Deploy `FHECounter` to the **Sepolia testnet**.  
5. Done 🎉  

## Usage
- **`getCount()`** → returns encrypted `bytes32` value  
- **`increment` / `decrement`** → update counter with encrypted values  

You’ll need the [@fhevm/js](https://www.npmjs.com/package/@fhevm/js) SDK to interact with encrypted inputs/outputs.  

### Example (JavaScript)
```js
import { FHEVM } from "@fhevm/js";

// Create FHEVM instance
const fhevm = await FHEVM.create();

// Encrypt a number
const { encrypted, proof } = fhevm.encrypt32(1);

// Call increment
await counter.increment(encrypted, proof);
