// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {Challenge5} from "../src/Challenge5/Challenge5.sol";
import {Solution5} from "../src/Challenge5/Solution5.sol";
import {NFT} from "src/NFT/NFT.sol";

contract SolveChallenge5 is Script {
    Challenge5 public challenge5;
    NFT public nft;

    function setUp() public {
        nft = new NFT();
        challenge5 = new Challenge5(address(nft));
    }

    function run() public {
        vm.startBroadcast();
        setUp();

        Solution5 sol5 = new Solution5(address(challenge5));
        sol5.solve();

        require(nft.ownerOf(5) == msg.sender, "Didn't get NFT");

        vm.stopBroadcast();
    }
}
