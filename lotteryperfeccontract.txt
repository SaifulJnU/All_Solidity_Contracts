// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;


contract Lottery{


  address public manager;
  address payable[] players;

  constructor(){
      manager=msg.sender;
  }

  function alreadyPlayer() view private returns(bool) {

      for(uint i=0; i<players.length; i++)
      {
          if(players[i]==msg.sender) return true;
      }

      return false;

  }


  function enter() public payable{
      require(manager != msg.sender, "manager can not play");
      require(alreadyPlayer()==false, "Player already exist");
      require(msg.value >= 1 ether, "less then 1 ether");
      players.push(payable(msg.sender));
      
  }

  function getAllPlayers() view public returns(address payable[] memory){
         return players;
  } 
  
  function random() view private returns(uint){
     return uint(sha256(abi.encodePacked(block.difficulty,block.number,players)));
  }


  function pickWinner() public{
      require(msg.sender==manager,"you are not manager");
      uint index = random() % players.length;
      address contractaddress = address(this);
      players[index].transfer(contractaddress.balance);
      
      players = new address payable[](0);

  }




}