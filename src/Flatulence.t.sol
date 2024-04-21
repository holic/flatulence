// SPDX-License-Identifier: MIT
pragma solidity >=0.8.24;

import {Test} from "forge-std/Test.sol";
import {GasReporter} from "@latticexyz/gas-report/GasReporter.sol";
import {ERC20} from "solmate/tokens/ERC20.sol";
import {Flatulence} from "./Flatulence.sol";

contract FlatulenceTest is Test, GasReporter {
  Flatulence public flatulence = new Flatulence();

  function testFartGas() public {
    startGasReport("fart");
    flatulence.fart(100_000);
    endGasReport();

    vm.expectEmit(true, true, true, true);
    emit ERC20.Transfer(address(0), address(this), 1778322 ether);
    flatulence.fart(100_000);
  }

  function testBigFartGas() public {
    startGasReport("big fart");
    flatulence.fart(1_000_000);
    endGasReport();

    vm.expectEmit(true, true, true, true);
    emit ERC20.Transfer(address(0), address(this), 31623553 ether);
    flatulence.fart(1_000_000);
  }

  function testBiggerFartGas() public {
    startGasReport("bigger fart");
    flatulence.fart(10_000_000);
    endGasReport();

    vm.expectEmit(true, true, true, true);
    emit ERC20.Transfer(address(0), address(this), 562355006 ether);
    flatulence.fart(10_000_000);
  }

  function testRevert() public {
    vm.expectRevert(bytes(unicode"💩"));
    flatulence.fart(100);

    for (uint256 i = 1; i < 1_000; i++) {
      flatulence.fart(100_000);
    }
    vm.expectRevert(bytes(unicode"🤢"));
    flatulence.fart(100_000);
  }
}
