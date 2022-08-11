//SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
contract Statevariable{

    // state variable:
    // state variables have gas fee as public public function
    // if the state variable declare with public keyword the it will auto
    // generate a getter method means we we access the value of it without 
    // creating any public function
    // it must have to declare inside the conratct and outside the function
    // These are directly connected with blockchain node
    uint public x;   //default zero
    bool public completed;  //defalut false
    string public str;
    address public addrs; 
    bytes32 public str2;
    uint y; //public is required when we need to call the variable to see the value
    // by default it is private
    
    // The all are state variable as we declare it inside the contract and
    // out side the any functions
    // Note: we can not initialize or change the state variable value within the pure or view function
    // for initializing we will use the simple function

}