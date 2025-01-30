// SPDX-License-Identifier: GPL-3.0-only
pragma solidity ^0.8.0;

import {Test} from "../../lib/forge-std/src/Test.sol";
import {IteratedMapping} from "../../src/practice/iteratedMapping.sol";
import {IiteratedMapping} from "../../src/practice/IiteratedMapping.sol";
abstract contract practiceBaseTest is Test {
    IiteratedMapping public iteratedMapping;

    function setUp() public {
        iteratedMapping = IteratedMapping(address(new IteratedMapping()));
    }

    function testWriteValues(address k1, uint256 k2, uint256 value) external {
        iteratedMapping.setOwnedTokensValue(k1, k2, value);
    }
}
