// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;


contract PureAndView{
    uint public num = 0; //state variable
    
    //Simple function
    function calculate1() public returns(uint){
       return num = 10;
    }

    //function with view
    // view means:
    // 1. It is a read only mode
    // 2. It only can able to read the state variable's value. It can not able to modify the value
    function calculate2() public view returns(uint){
        return num+20;
    }
    
    //function with pure 
    //(pure means: 
    // 1. No interaction with blockchain
    // 2. Can not able to modify(read or write) the state variable
    // 3. It is generally used for any random calculation example: prime checking, random num generate etc
    function calculate3(uint _x, string memory _str) public pure returns(uint, string memory){
       return(_x, _str);
    }

}