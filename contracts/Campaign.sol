pragma solidity ^0.8.28;

contract Campaign {
    address public chairperson;
    uint public minAmount;

    struct Contribution {
        string name;
        uint value;
        bool exists;
    }

    mapping(address => Contribution) public contributions;

    struct Request {
        string title;
        uint votes;
        address payable recipient;
        string description;
        bool completed;
        uint approvalCount;
        mapping(address => bool) approvals;
        address[] voters;
    }

    Request[] public requests;
    uint public requestCount;

    constructor(uint amt) {
        chairperson = msg.sender;
        minAmount = amt;
    }

    function contribute(string calldata name) external payable {
        require(msg.sender != chairperson, "Chairperson can not contribute");
        require(msg.value < minAmount, "Value is too low!");
        require(
            !contributions[msg.sender].exists,
            "User has already contributed"
        );

        contributions[msg.sender] = Contribution(name, msg.value, true);
    }

    function createRequest(
        string calldata title,
        string calldata description,
        address payable recipient
    ) public {
        requestCount++;
        Request storage req = requests[requestCount];
        req.title = title;
        req.description = description;
        req.recipient = recipient;
        req.approvalCount = 0;
    }

    function approveRequest(uint index) public {
        require(msg.sender != chairperson, "Chairperson can not approve");
        require(contributions[msg.sender].exists, "You must contribute first");
        require(index < requestCount, "Request does not exist");
        require(requests[index].vo)
        Request storage req = requests[index];


    }
}
