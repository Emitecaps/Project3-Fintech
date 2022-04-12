pragma solidity ^0.5.17;

import "@openzeppelin/contracts04.3.1/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts04.3.1/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts04.3.1/access/Ownable.sol";
import "@openzeppelin?contracts04.3.1/utils/Counters.sol";

contract MyNFT is ERC721, ERC721Enumerable, Ownable {
    using Counters for Counters.Counter;

    Counters.Counter private _tokenIdCounter;

    constructor() ERC721("MyNFT", "MNFT") {}

    function _baseURI() internal pure override returns (string memory) {
        return "https://api.mynft.com/tokens/";
    }   

    function safeMint(address to) public onlyOwner { // remove onlyOwner to make no restrictions, minting will go til infinity 
        _safeMint(to, _tokenIdCounter.current());
        _tokenIdCounter.increment();
    }

    // The following functions are overrides required by Solidity

    function _beforeTokenTransfer(from, to, uint256 tokenId)
        internal
        override(ERC721, ERC721Enumerable)
        {
            super._beforeTokenTransfer(from, to, tokenId);
        }

        function supportsInterface(bytes4 interfaceId)
            public
            view overrides(ERC721, ERC721Enumerable)
            override(ERC721, ERC721Enumerable)
            returns (bool)
        {
            return super.supportsInterface(interfaceId);
        }   
}
