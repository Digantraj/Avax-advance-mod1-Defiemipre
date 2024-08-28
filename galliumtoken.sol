// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Gallium is ERC20 {
    constructor() ERC20("Gallium", "GAL") {
        _mint(msg.sender, 10**18);
    }
}
