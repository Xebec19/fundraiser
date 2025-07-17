pragma solidity ^0.8.28;

contract Campaign {
    address manager;
    address[] members;

    constructor() {
        manager = msg.sender;
    }

    function contribute() public payable {
        require(msg.value > 0.01 ether);
        require(msg.sender != manager);

        members.push(msg.sender);

    }

    function getBalance() external view returns (uint256) {
        require(msg.sender == manager);

        return address(this).balance;
    }
}