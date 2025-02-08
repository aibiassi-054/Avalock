// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract Avalock {
    mapping(address => bool) public flaggedContracts;
    mapping(address => address[]) public guardians;
    mapping(bytes32 => uint256) public approvalCounts;
    mapping(bytes32 => bool) public approvedTransactions;
    mapping(address => Withdrawal) public pendingWithdrawals;
    
    struct Withdrawal {
        uint256 amount;
        uint256 unlockTime;
        bool executed;
    }
    
    event ContractFlagged(address indexed contractAddress, bool isScam);
    event TransactionApproved(bytes32 indexed txHash, address guardian);
    event WithdrawalRequested(address indexed user, uint256 amount, uint256 unlockTime);
    event WithdrawalExecuted(address indexed user, uint256 amount);
    event WithdrawalCancelled(address indexed user);
    
    // ------------- Flagging Scam Contracts -------------
    function flagContract(address _contract) public {
        flaggedContracts[_contract] = true;
        emit ContractFlagged(_contract, true);
    }

    function checkContract(address _contract) public view returns (bool) {
        return flaggedContracts[_contract];
    }

    // ------------- Multi-Signature Approval System -------------
    function addGuardian(address _guardian) public {
        require(_guardian != msg.sender, "Cannot add yourself as a guardian");
        guardians[msg.sender].push(_guardian);
    }

    function approveTransaction(bytes32 _txHash) public {
        require(isGuardian(msg.sender, _txHash), "Not an assigned guardian");
        approvalCounts[_txHash] += 1;
        if (approvalCounts[_txHash] >= requiredApprovals(msg.sender)) {
            approvedTransactions[_txHash] = true;
        }
        emit TransactionApproved(_txHash, msg.sender);
    }

    function requiredApprovals(address _user) internal view returns (uint256) {
        return guardians[_user].length / 2 + 1; // Require majority approval
    }

    function isGuardian(address _guardian, bytes32 _txHash) internal view returns (bool) {
        address[] memory userGuardians = guardians[msg.sender];
        for (uint256 i = 0; i < userGuardians.length; i++) {
            if (userGuardians[i] == _guardian) {
                return true;
            }
        }
        return false;
    }
    
    // ------------- Time-Delayed Transactions -------------
    function requestWithdrawal(uint256 _amount) public {
        require(_amount > 0, "Amount must be greater than zero");
        require(!pendingWithdrawals[msg.sender].executed, "Pending withdrawal already exists");
        
        pendingWithdrawals[msg.sender] = Withdrawal({
            amount: _amount,
            unlockTime: block.timestamp + 1 days,
            executed: false
        });
        
        emit WithdrawalRequested(msg.sender, _amount, block.timestamp + 1 days);
    }

    function cancelWithdrawal() public {
        require(!pendingWithdrawals[msg.sender].executed, "Cannot cancel an executed withdrawal");
        delete pendingWithdrawals[msg.sender];
        emit WithdrawalCancelled(msg.sender);
    }

    function executeWithdrawal() public {
        Withdrawal storage withdrawal = pendingWithdrawals[msg.sender];
        require(block.timestamp >= withdrawal.unlockTime, "Time lock active");
        require(!withdrawal.executed, "Withdrawal already executed");
        
        withdrawal.executed = true;
        payable(msg.sender).transfer(withdrawal.amount);
        emit WithdrawalExecuted(msg.sender, withdrawal.amount);
    }
}