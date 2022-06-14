// SPDX-License-Identifier: MIT
pragma solidity 0.8.14;

import "./testContract";

contract StorageFactory {
    TestContract[] private testContractArr;

    struct Person {
        string name;
        uint256 age;
    }

    function createContract() public {
        TestContract testContract = new TestContract();
        testContractArr.push(testContract);
    }

    function interactContract(uint256 _contractIndex, uint256 _number) public {
        TestContract testContract = testContractArr[_contractIndex];
        testContract.changeBlockchainState(_number);
    }

    function getInteractContract(uint256 _contractIndex)
        public
        view
        returns (uint256)
    {
        // TestContract testContract = testContractArr[_contractIndex];
        // return testContract.getBlockchainState();
        return testContractArr[_contractIndex].getBlockchainState();
    }
}
