// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Marks {
    struct Student {
        string Name;
        uint256 Marks;
    }

    Student[] public marksEntry;
    mapping(string => uint256) public nameToMarks;

    function addMarks(string memory _name, uint256 _marks) public {
        marksEntry.push(Student({Name: _name, Marks: _marks}));
        nameToMarks[_name] = _marks;
    }
}
