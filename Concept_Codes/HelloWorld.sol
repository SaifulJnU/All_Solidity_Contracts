// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

//Basic Contract things:
//1. contract name's first letter conventionlly should be uppercse letter
//2. function name can be camelcase
//3. need to declare license to prevent the warning
//4. must need to declare the version of solidity you are currently working 

contract HelloWorld{
       string str1 = "Hello World";  //state variable without public keyword
       //so to see the value or call the value of the str variable 
       //we need to have a public type function (i.e: get())
       function getStr1() public view returns(string memory){
           return str1;
       }
       //----------------------------------------------------------------
       //state variable with public keyword 
       //so we do not need to have any additional funtion to read or call the value of the str variable.
      string public str2 = "Hello World";

}
