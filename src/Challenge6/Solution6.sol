//SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

interface IChallenge6 {
    function count() external view returns (uint256);
    function mintFlag(uint256 code) external;
}

contract Solution6 {
    function solve(address challenge6) external {
        uint256 count = IChallenge6(challenge6).count();
        IChallenge6(challenge6).mintFlag{gas:201617}(count << 8);
    }

    function name() external pure returns (string memory) {
        return "BG CTF Challenge 6 Solution";
    }

}