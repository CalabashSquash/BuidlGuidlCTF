//SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

interface INFT {
    function ownerOf(uint256 tokenId) external view returns(address);
}

contract Solution1 {
    constructor(address challenge1, address nft) {
        (bool success,bytes memory data) = challenge1.call(
            abi.encodeWithSignature("registerTeam(string,uint8)", "Calabash", 1)
        );
        require(success, "Call to challenge contract not successful");
        require(data.length == 0, "registerTeam should not return any data");

        require(INFT(nft).ownerOf(1) == address(this), "Didn't get NFT");
    }
}