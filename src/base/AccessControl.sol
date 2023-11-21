// SPDX-License-Identifier: UNLICENSED
pragma solidity =0.8.15;

import { Owned } from "../../lib/solmate/src/auth/Owned.sol";

abstract contract AccessControl is Owned {
    mapping(address => bool) internal _operatorApproved;

    modifier onlyOperator() {
        require(_operatorApproved[msg.sender]);
        _;
    }

    constructor(address _owner) Owned(_owner) { }

    /// @notice Updates the status of given account as operator
    /// @dev Must be called by the current governance
    /// @param _operator Account to update status
    function toggleOperator(address _operator) external onlyOwner {
        _operatorApproved[_operator] = !_operatorApproved[_operator];
    }

    /// @notice Returns the status for a given operator that can operate readjust & pull liquidity
    function isOperator(address _operator) external view returns (bool) {
        return _operatorApproved[_operator];
    }
}
