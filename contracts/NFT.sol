// SPDX-License-Identifier: MIT

pragma solidity ^0.7.0;

import "./token/ERC721/ERC721.sol";
import "./access/Ownable.sol";

/**
 * @title Nudev NFT Contract
 * @dev Extends ERC721 Non-Fungible Token Standard basic implementation
 */
contract NFT is ERC721, Ownable {

    constructor() ERC721("NudevNFT", "NDNFT") {
        
    }

    function mint() public {
        uint mintIndex = totalSupply();
        _safeMint(msg.sender, mintIndex);
    }

    function mint(string memory uri) public {
        uint mintIndex = totalSupply();
        _safeMint(msg.sender, mintIndex);
        _setTokenURI(mintIndex, uri);
    }

    function withdraw() public onlyOwner {
        uint balance = address(this).balance;
        msg.sender.transfer(balance);
    }
}