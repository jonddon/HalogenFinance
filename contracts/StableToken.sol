// SPDX-License-Identifier: GPL-3.0;
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Token is ERC20{
    constructor() ERC20("Stable Coin", "USDT"){
        _mint(msg.sender, 1000000000);
        
    }
    
    function mint(address account, uint amount) public{
        _mint(account, amount);
    }
}