//SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
contract IntoFunction{

      function sum(uint _x, uint _y) public pure returns(uint){
          return _x+_y;
      }
      
      //external works like public means we can call it (accessable)
      //pure prevent to use the state variable
      function sub(uint _x, uint _y) external pure returns(uint){
          uint first=_x;
          uint second=_y;
          return first-second;
      }


}