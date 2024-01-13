pragma solidity ^0.8;

interface IVault {
    function locked() external view returns (bool);
    // 2 solutions
    // 1. read slot
    // password = await web3.eth.getStorageAt(contract.address, 1)
    // 2. find constructor inputs
  
    function unlock(bytes32 password) external;
}