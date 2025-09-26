// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StudentRegistryV2{
        struct Student {
        string name;
        uint age;
        bool isRegistered;
    }

    address public owner;

    constructor() {
        owner = msg.sender;
    }

    mapping(address => Student) private students;

    modifier onlyOwner(){
        require(msg.sender == owner, "Not the contract owner");
        _;
    }

    event StudentRegistered(address indexed user, string name, uint age);

    function register(string memory _name, uint _age) public {
        students[msg.sender] = Student(_name, _age, true);
        emit StudentRegistered(msg.sender, _name, _age);
    }

    function getStudent(address user) public view returns (string memory, uint, bool) {
        require(students[user].age != 0, "Student not found");

        Student memory student = students[user];
        return (student.name, student.age, student.isRegistered);
    }

    function isStudentRegistered(address user) public view returns (bool) {
        return students[user].isRegistered;
    }
}