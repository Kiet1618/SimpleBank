pragma solidity >=0.7.0 <0.9.0;

contract SimpleBank {
    mapping (address => uint) private balances;
    address public User;

    function SetAddressUser(address A) public{
        User = A;
    }

    event DepositBank(address user, uint amount);
    event WithdrawBank(address user, uint amount);

    function createCoin(address receiver, uint amount) public {
        balances[receiver] +=amount;
    }
    function Deposit(uint amount) public{
        require(amount <balances[User]);
        balances[User] -= amount;
        emit DepositBank(User, amount);
    }
    function Withdraw(uint amount) public{
        balances[User]+=amount;
        emit WithdrawBank(User, amount);
    }
    function getBalance(address add) public view returns (uint) {
        return balances[add];
    }

}