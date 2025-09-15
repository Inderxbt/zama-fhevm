// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import { FHE, FHEVMConfigStruct } from "./FHE.sol";
import "./FHEVMConfig.sol";

/// @title SepoliaConfig
/// @notice Initializes the FHEVM with Sepolia-specific configuration
contract SepoliaConfig {
    
    /// @dev Deploys the contract and applies Sepolia configuration to FHE
    constructor() {
        _initializeSepolia();
    }

    /// @dev Internal helper to configure FHE with Sepolia addresses
    function _initializeSepolia() internal {
        FHEVMConfigStruct memory cfg = FHEVMConfig.sepoliaConfig();
        FHE.setCoprocessor(cfg);
        FHE.setDecryptionOracle(FHEVMConfig.sepoliaOracle());
    }
}
