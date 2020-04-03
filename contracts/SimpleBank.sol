pragma solidity ^0.5.8;

contract SimpleBank {
    uint8 private clientCount;
    mapping (address => uint)  balances;
    address public owner;




    constructor() public{
        owner = msg.sender;
        balances[msg.sender]=0;
    }


    function enroll() public returns (uint) {
        uint val=10;
            balances[msg.sender] = val;
        return balances[msg.sender];
    }
    function newenroll(address acc) private {
        balances[acc]+=0;
    }


    function deposit(uint depositAmount) public returns (uint) {
        balances[msg.sender] += depositAmount;
        return balances[msg.sender];
    }


    function withdraw(uint withdrawAmount) public returns (uint) {
        // Check enough balance available, otherwise just return balance
        if (withdrawAmount <= balances[msg.sender]) {
            balances[msg.sender] -= withdrawAmount;
        }
        return balances[msg.sender];
    }
    function transfer(address to,uint amount) public returns (uint){
        newenroll(to);
        if(amount<=balances[msg.sender]){
            balances[msg.sender]-=amount;
            balances[to]+=amount;
            
            
        }
        return balances[to];
        
    }


    function balance() public view returns (uint) {
        return balances[msg.sender];
    }
    function checkbal(address ch) public view returns(uint){
        return balances[ch];
    }


}


