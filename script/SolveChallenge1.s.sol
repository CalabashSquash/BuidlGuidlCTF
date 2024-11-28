// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {Challenge1} from "../src/Challenge1/Challenge1.sol";
import {Solution1} from "../src/Challenge1/Solution1.sol";
import {NFT} from "src/NFT/NFT.sol";

contract SolveChallenge1 is Script {
    Challenge1 public challenge1;
    NFT public nft;

    function setUp() public {
        nft = new NFT();
        challenge1 = new Challenge1(address(nft));
    }

    function run() public {
        vm.startBroadcast();
        setUp();

        Solution1 solution1 = new Solution1(address(challenge1), address(nft));

        vm.stopBroadcast();
    }
}
