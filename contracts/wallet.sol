// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/IERC20.sol";

contract NightsAndWeekendCoin {

    uint256 private totalSupply = 10_000;
    address private owner;
    
    mapping (address => uint256) private balances;

    mapping(address => Payment[]) private userPayments;

    struct Payment {
        address _addr;
        uint256 transferAmount;
    }

    event TotalSupplyHasIncreased(address _addr, uint256 transferAmount); 
    event TransferHasTakenPlace(address _addr, uint256 amount);

    modifier onlyOwner {
        require(msg.sender == owner); 
        _;
    }

    constructor(address initialOwnersAddress) {
        owner = initialOwnersAddress;
        balances[owner] = totalSupply;
    }

    function getTotalSupply() public view returns(uint256) {
        return totalSupply;
        // return supplyIncrease would literally return the function without calling it.
    }

    function get(address _addr) public view returns(uint256){
        return balances[_addr];
    }

    function supplyIncrease() public onlyOwner {
        totalSupply += 1_000;
        emit TotalSupplyHasIncreased(msg.sender, totalSupply);
    }

    function mint(address _to, uint256 _amount) public {
        require(msg.sender == owner); // Only allow the owner to mint new tokens
        totalSupply = totalSupply.add(_amount); // Increase the total supply of tokens
        balances[_to] = balances[_to].add(_amount); // Increase the balance of the specified address
        emit Transfer(address(0), _to, _amount); // Emit the Transfer event
    }
}