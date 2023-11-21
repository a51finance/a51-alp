// SPDX-License-Identifier: GPL-2.0-or-later

pragma solidity >=0.5.0;

import "@uniswap/v3-core/contracts/interfaces/callback/IUniswapV3MintCallback.sol";

/// @title Liquidity management functions
/// @notice Internal functions for safely managing liquidity in Uniswap V3
interface ICLTPayments is IUniswapV3MintCallback {
    struct MintCallbackData {
        address token0;
        address token1;
        uint24 fee;
        address payer;
    }
}
