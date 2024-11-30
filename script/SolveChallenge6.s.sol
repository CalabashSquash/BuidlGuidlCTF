// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {Challenge6} from "../src/Challenge6/Challenge6.sol";
import {Solution6} from "../src/Challenge6/Solution6.sol";
import {NFT} from "src/NFT/NFT.sol";

contract SolveChallenge6 is Script {
    Challenge6 public challenge6;
    NFT public nft;

    function setUp() public {
        nft = new NFT();
        challenge6 = new Challenge6(address(nft));
    }

    function run() public {
        vm.startBroadcast();
        setUp();

        // Have to give sufficient gas here because the simulations seem to give different
        // gas amount than the actual broadcast TX
        (new Solution6()).solve{gas:500000}(address(challenge6));

        require(nft.ownerOf(6) == msg.sender, "Didn't get NFT");

        vm.stopBroadcast();
    }
}
