// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyToken is ERC20 {
    address public admin;
    constructor() ERC20('Swastik Token', 'STN') {
        _mint(msg.sender, 100 * 10**18);
        admin = msg.sender;
    }

    function mint( address to, uint amount) external {
        require(msg.sender == admin, 'only admin');
        _mint(to, amount);

    }

    function burn( uint amount) external {
        _burn(msg.sender, amount);
    }
}
