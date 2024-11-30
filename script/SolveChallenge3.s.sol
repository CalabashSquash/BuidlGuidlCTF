// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {Challenge3} from "../src/Challenge3/Challenge3.sol";
import {Solution3} from "../src/Challenge3/Solution3.sol";
import {NFT} from "src/NFT/NFT.sol";

contract SolveChallenge3 is Script {
    Challenge3 public challenge3;
    NFT public nft;

    function setUp() public {
        nft = new NFT();
        challenge3 = new Challenge3(address(nft));
    }

    function run() public {
        vm.startBroadcast();
        setUp();

        new Solution3(address(challenge3));

        require(nft.ownerOf(3) == msg.sender, "Didn't get NFT");

        vm.stopBroadcast();
    }
}
