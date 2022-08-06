// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Ownable{

address public owner;

constructor(){
  owner=msg.sender;
}

modifier OnlyOwner{
require(msg.sender==owner, "your are not owner");
_;

}

function setOwner(address _newOnwer) public OnlyOwner{
  require(_newOnwer != address(0), "Invalid address");
  owner=_newOnwer;
}

function OnlyOwnerCanAccess() public OnlyOwner{

}

function AnyoneCanAccess() public {

}


}