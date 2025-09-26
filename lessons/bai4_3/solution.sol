// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Voting{

    struct Candidate {
        string name;
        uint voteCount;
    }

    uint private candidateCount = 0;
    address public owner;
    mapping(address => bool) public hasVoted;
    mapping(uint => Candidate) public candidate;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner(){
        require(msg.sender == owner, "Not the contract owner");
        _;
    }

    event CandidateAdded(uint indexed candidateId, string name);
    event Voted(address indexed voter, uint indexed candidateId);

    function addCandidate(string memory _name) public onlyOwner {
        uint candidateId = candidateCount++;
        candidate[candidateId] = Candidate(_name, 0);
    }

    function vote(uint candidateId) public {
        require(!hasVoted[msg.sender], "You have already voted");
        hasVoted[msg.sender] = true;
        candidate[candidateId].voteCount += 1;
        emit Voted(msg.sender, candidateId);
    }
}