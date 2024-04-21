// SPDX-License-Identifier: MIT
pragma solidity >=0.8.24;

import {ERC20} from "solmate/tokens/ERC20.sol";
import {FixedPointMathLib} from "solmate/utils/FixedPointMathLib.sol";

contract Flatulence is ERC20 {
  event Fart(address indexed whoFarted, string);

  uint256 public toots = 1_000;

  constructor() ERC20("Flatulence", "FART", 18) {
    emit Fart(address(this), unicode"🤨💨");
  }

  function fart(uint256 wind) public {
    _fart(msg.sender, wind, gasleft());
  }

  function fart(address at, uint256 wind) public {
    _fart(at, wind, gasleft());
  }

  function _fart(address at, uint256 wind, uint256 bloat) internal {
    if (--toots == 0) revert(unicode"🤢");
    if (wind < 100_000) revert(unicode"💩");
    emit Fart(msg.sender, unicode"🤨💨");
    _mint(
      at,
      wind * FixedPointMathLib.sqrt(FixedPointMathLib.sqrt(wind * 1e18))
        / FixedPointMathLib.sqrt(FixedPointMathLib.sqrt(1e18)) * 1e18
    );
    while (true) {
      if (bloat - gasleft() > wind) {
        break;
      }
    }
  }
}
