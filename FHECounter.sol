// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {FHE, euint32, externalEuint32} from "./FHE.sol";
import "./SepoliaConfig.sol";

contract CounterFHE is SepoliaConfig {
    euint32 private counter;

    /// @notice Returns the current encrypted counter value
    function currentCount() external view returns (euint32) {
        return counter;
    }

    /// @notice Increase counter by encrypted input
    /// @param encValue Encrypted external uint32
    /// @param proof Zero-knowledge proof for validity
    function increase(externalEuint32 encValue, bytes calldata proof) external {
        euint32 value = FHE.fromExternal(encValue, proof);
        counter = FHE.add(counter, value);

        _updatePermissions(counter);
    }

    /// @notice Decrease counter by encrypted input
    /// @param encValue Encrypted external uint32
    /// @param proof Zero-knowledge proof for validity
    function decrease(externalEuint32 encValue, bytes calldata proof) external {
        euint32 value = FHE.fromExternal(encValue, proof);
        counter = FHE.sub(counter, value);

        _updatePermissions(counter);
    }

    /// @dev Grants necessary permissions for the updated counter
    function _updatePermissions(euint32 updated) internal {
        FHE.allowThis(updated);
        FHE.allow(updated, msg.sender);
    }
}
