//SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

interface INFT {
    function ownerOf(uint256 tokenId) external view returns (address);
}
