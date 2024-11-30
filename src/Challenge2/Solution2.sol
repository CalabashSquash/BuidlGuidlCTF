//SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

contract Solution2 {
    constructor(address challenge2, address nft) {
        (bool success, bytes memory data) = challenge2.call(abi.encodeWithSignature("justCallMe()"));
        require(success, "Call to challenge contract not successful");
        require(data.length == 0, "justCallME should not return any data");
    }
}
