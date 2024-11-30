//SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";

// Dummy contract
contract NFT is ERC721 {
    constructor() ERC721("BG-CTF", "CTF") {}

    function mint(address to, uint256 tokenId) external {
        _mint(to, tokenId);
    }
}
