// SPDX-License-Identifier: MIT
pragma solidity 0.8.14;

contract TestContract {
    uint256 private secret_number = 103040;

    struct Person {
        string name;
        uint256 age;
    }

    Person public momo = Person({name: "Momo", age: 8});
    Person[] public coworkers;

    mapping(string => uint256) public familyAges;

    function addCoworker(string calldata _name, uint256 _age) public {
        coworkers.push(Person(_name, _age));
    }

    function calculator(uint256 _number) public pure returns (uint256) {
        return 10 + _number;
    }

    function getBlockchainState() public view returns (uint256) {
        return secret_number;
    }

    function changeBlockchainState(uint256 _number) public {
        secret_number += _number;
    }

    function addFamilyAge(string calldata _name, uint256 _age) public {
        familyAges[_name] = _age;
    }
}
