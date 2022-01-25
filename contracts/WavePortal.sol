// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

import "hardhat/console.sol";
// import "./WaveHelper.sol";

contract WavePortal {
    uint256 totalWaves;
    
    constructor() {
        console.log("Beep beep bootleepbeep, response: why dont you ask me later");
    }

    struct Wave {
        string test;
    }

    Wave[] public waves;

    mapping (uint => address) wavesToOwner;
    mapping (address => uint) ownerWaveCount;

    function wave() public {
        totalWaves += 1;
        ownerWaveCount[msg.sender]++;
        console.log("%s has waved!", msg.sender);
    }

    function getTotalWaves() public view returns (uint256) {
        console.log("We have %d total waves!", totalWaves);
        return totalWaves;
    }

    function getTotalWavesByOwner(address _owner) external view returns(uint[] memory) {
        uint[] memory result = new uint[](ownerWaveCount[_owner]);
        uint counter = 0;
        for (uint i = 0; i < waves.length; i++) {
            if (wavesToOwner[i] == _owner) {
                result[counter] = i;
                counter++;
            }
        }
        console.log("%s has waved %d times!", msg.sender, result.length);
        return result;
    }
}