// SPDX-License-Identifier: MIT

pragma solidity ^0.8.9;

contract GlobalVariable{
    //GlobalVariable:
    // in solidity global variabled are some reserve variables(i.e: msg, block) it can be called
    // from any simple functions
    address addrs = msg.sender; //here msg is a global variable
    uint blockNum = block.number; // here block is global variable
    uint time = block.timestamp; // here block is a global variable and timestamp is a property

    function globalVar() public view returns(address, uint, uint){
        return(addrs, blockNum, time);
    }


}