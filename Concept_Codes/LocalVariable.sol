// SPDX-License-Identifier: MIT

pragma solidity ^0.8.9;

contract LocalVariale{
      
      //Local variable:
      //These are not connect with blockchain node so no gas fee at all for using local variable
      //We have to declare local variable inside or the parameter of a funciton
      //If we declare it in the paremeter then we can use underscore in be starating of the variable name
      //These variable's value are gone when the function call is done
      
      uint public x;  //statevariable with gas fee

      function localvar() public returns(uint, uint) {
          uint k=10;  // local with no gas fee. We use local just for some calculation because it is not connected with blockcahin

          k+=1;
          x=k;
          return (k,x);
      }



}

