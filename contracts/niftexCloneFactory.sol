// SPDX-License-Identifier: MIT

pragma solidity ^0.7.0;

import "./NiftexERC20.sol";
import "node_modules/@optionality.io/clone-factory/contracts/CloneFactory.sol";
import "node_modules/@openzeppelin/contracts/access/Ownable.sol";



contract NiftexFactory is Ownable, CloneFactory {

  address public libraryAddress;

  event NiftexCreated(address newNiftexAddress);

  function NiftexFactory(address _libraryAddress) public {
    libraryAddress = _libraryAddress;
  }

  function setLibraryAddress(address _libraryAddress) public onlyOwner {
    libraryAddress = _libraryAddress;
  }

  function createNiftex(string  memory   _name, string  memory  _symbol, uint8 _decimals, address _owner, uint256 _totalSupply, uint256 _totalSupplyCap, bool _transferable) public onlyOwner {
    address clone = createClone(libraryAddress);
    Niftex(clone).init(_name, _symbol,  _decimals,  _owner,  _totalSupply, _totalSupplyCap,  _transferable);
    NiftexCreated(clone);
  }
}
