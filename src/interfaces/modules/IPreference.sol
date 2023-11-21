// SPDX-License-Identifier: UNLICENSED
pragma solidity =0.8.15;

import "../ICLTBase.sol";

interface IPreference {
    error InvalidCaller();
    error InvalidThreshold();
    error InvalidModesLength();
    error InvalidMode();
    error InvalidPricePreferenceDifference();
    error InvalidTimePreference();
    error StrategyIdsCannotBeEmpty();
    error StrategyIdCannotBeZero();
    error DuplicateStrategyId(bytes32 strategyId);
    error TimePreferenceConstraint();
    error BothTicksCannotBeZero();
    error RebaseStrategyDataCannotBeZero();
    error OnlyRebaseInactivityCannotBeSelected();
    error RebaseInactivityCannotBeZero();

    struct ExecutableStrategiesData {
        bytes32 strategyID;
        uint256 mode;
        bytes32[3] actionNames; // Array to hold multiple valid modes
    }

    function checkInputData(ICLTBase.StrategyPayload memory data) external returns (bool);

    event Executed(ExecutableStrategiesData[] strategyIds);
}
