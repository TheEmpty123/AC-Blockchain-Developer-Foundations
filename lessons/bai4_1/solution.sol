// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StudentRegistry{
    struct Student {
        string name;
        uint age;
        bool isRegistered;
    }

    mapping(address => Student) private students;

    function register(string memory _name, uint _age) public {
        students[msg.sender] = Student(_name, _age, true);
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