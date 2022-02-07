// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "./StudentMarks.sol";
import "@openzeppelin/contracts/access/IAccessControl.sol";

contract TeacherEntry is Marks {
    // using Roles for Roles.Role;

    Roles.Role private users;
    Roles.Role private admins;

    constructor() public {
        admins.add(msg.sender);
    }

    Marks[] public marksArray;

    function createSection() public {
        Marks section = new Marks();
        marksArray.push(section);
    }

    function enterMarks(
        uint256 _sectionIndex,
        string memory studentName,
        uint256 _marks
    ) public {
        Marks(address(marksArray[_sectionIndex])).addMarks(studentName, _marks);
    }

    function retrieve(uint256 _section, string memory _name)
        public
        view
        returns (uint256)
    {
        return Marks(address(marksArray[_section])).nameToMarks(_name);
    }
}
