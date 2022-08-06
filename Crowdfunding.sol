// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8;

contract CrowdFinding{

 address public owner;
 uint public minValue;
 uint public goal;
 uint public timePeriod;
 uint public amountRaised;
 uint public noOfFunders;

 mapping(address=>uint)funders;

 constructor(){
     minValue = 1000 wei;
     goal = 30000 wei;
     timePeriod = block.timestamp + 3660;
     owner = msg.sender;
 }

 function contributions() public payable{
     require(block.timestamp < timePeriod, "time over");
     require(msg.value >= minValue, "check the min value");
     
     if(funders[msg.sender] == 0)
     {
         noOfFunders++;
     }
     funders[msg.sender] += msg.value;
     amountRaised += msg.value; 

 }

  receive( ) payable external{
      contributions();
  }

  function getRefund() public {
    require(timePeriod<block.timestamp,"still funding running");
    require(amountRaised<goal,"fund was successful");
    require(funders[msg.sender]>0,"not a funder");

    payable(msg.sender).transfer(funders[msg.sender]);
    amountRaised-=funders[msg.sender];
    funders[msg.sender]=0;
  }

  struct Requests{
   
   string descriptions;
   uint amount;
   uint nuOfVoters;
   address payable reciever;
   mapping(address=>bool) votes;
   bool completed;

  }
  mapping(uint=>Requests) public AllRequests;
  uint public numOfReq;

  function createRequest(string memory _description, uint _amount, address payable _reciever) public {
         
         require(msg.sender==owner,"you are not owner");

         Requests storage newRequests = AllRequests[numOfReq];
         numOfReq++;

         newRequests.descriptions = _description;
         newRequests.amount = _amount;
         newRequests.reciever = _reciever;
         newRequests.nuOfVoters = 0;
         newRequests.completed = false;
  }
 function votingForRequest(uint _noOfreq) public{
        require(funders[msg.sender]>0," not a funder");
        Requests storage thisRequest = AllRequests[_noOfreq];
        require(thisRequest.votes[msg.sender]==false, "already voted");
        thisRequest.votes[msg.sender]=true;
        thisRequest.nuOfVoters++;
 }

 function makePayments(uint _noOfreq) public{
      require(msg.sender == owner,"not a owner");
      Requests storage thisRequest = AllRequests[_noOfreq];
      require(thisRequest.completed ==  false, "Already completed");
      require(thisRequest.nuOfVoters >= noOfFunders/2," your are not favor in voting");
       
       thisRequest.reciever.transfer(thisRequest.amount);
       thisRequest.completed = true;

 }


}