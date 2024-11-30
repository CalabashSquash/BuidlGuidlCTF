// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {Challenge2} from "../src/Challenge2/Challenge2.sol";
import {Solution2} from "../src/Challenge2/Solution2.sol";
import {NFT} from "src/NFT/NFT.sol";

contract SolveChallenge2 is Script {
    Challenge2 public challenge2;
    NFT public nft;

    function setUp() public {
        nft = new NFT();
        challenge2 = new Challenge2(address(nft));
    }

    function run() public {
        vm.startBroadcast();
        setUp();

        new Solution2(address(challenge2), address(nft));

        require(nft.ownerOf(2) == msg.sender, "Didn't get NFT");

        vm.stopBroadcast();
    }
}
