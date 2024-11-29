//SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

contract Solution3 {
    constructor(address challenge2) {
        (bool success,bytes memory data) = challenge2.call(
            abi.encodeWithSignature("mintFlag()")
        );
        require(success, "Call to challenge contract not successful");
        require(data.length == 0, "mintFlag should not return any data");
    }
}