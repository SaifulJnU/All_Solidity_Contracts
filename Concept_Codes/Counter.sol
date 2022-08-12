// SPDX-License-Identifier: MIT

pragma solidity ^0.8.9;

contract Counter{
    uint public count;

    function increment() public returns(uint){
        //(return count+1) and (count = count+1 then return count) both are not same
        //return count+1;   
        count = count +1;
        return count;     
    }
    function decrement() public returns(uint){
        //(return count-1) and (count = count-1 then return count) both are not same
        //return count-1;   
        count = count-1;
        return count;     
    }
}