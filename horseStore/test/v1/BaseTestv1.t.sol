//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {HorseStore} from "../../src/v1/HorseStore.sol";
import {Test, console2} from "@forge-std/Test.sol";
abstract contract BaseTestV1 is Test {
    HorseStore public horseStore;
    function setUp() public virtual {
        horseStore = new HorseStore();
    }

    function testReadValue() public {
        uint256 initialValue = horseStore.readNumberOfHorses();
        assertEq(initialValue, 0);
    }
    function testWriteValue() public {
        uint256 numberOfHorses = 777;
        horseStore.updateHorseNumber(numberOfHorses);
        assertEq(horseStore.readNumberOfHorses(), numberOfHorses);
    }
}
