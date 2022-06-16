// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract Contract {
    uint256 MINIMUM_USD = 50 * 1e18;

    function fund() public payable {
        bool isBiggerThanMinimum = convert(msg.value) >= MINIMUM_USD;
        require(isBiggerThanMinimum, "Not enought ETH!");
    }

    function getPrice() public view returns (uint256) {
        AggregatorV3Interface priceFeed = AggregatorV3Interface(
            0x8A753747A1Fa494EC906cE90E9f37563A8AF630e
        );

        (, int256 price, , , ) = priceFeed.latestRoundData();

        return uint256(price * 1e10);
    }

    function convert(uint256 _ethAmount) public view returns (uint256) {
        uint256 ethPrice = getPrice();
        uint256 ethToUsd = (_ethAmount * ethPrice) / 1e18;
        return ethToUsd;
    }
}
