#pragma version ^0.3.10

from vyper.interfaces import ERC20

event ContractFlagged:
    contract_address: address
    is_scam: bool

event TransactionApproved:
    tx_hash: bytes32
    guardian: address

event WithdrawalRequested:
    user: address
    amount: uint256
    unlock_time: uint256

event WithdrawalExecuted:
    user: address
    amount: uint256

event WithdrawalCancelled:
    user: address

# Storage variables
flagged_contracts: public(HashMap[address, bool])
guardians: public(HashMap[address, DynArray[address, 10]])
approval_counts: public(HashMap[bytes32, uint256])
approved_transactions: public(HashMap[bytes32, bool])

struct Withdrawal:
    amount: uint256
    unlock_time: uint256
    executed: bool

pending_withdrawals: public(HashMap[address, Withdrawal])

def flag_contract(_contract: address):
    flagged_contracts[_contract] = True
    log ContractFlagged(_contract, True)

def check_contract(_contract: address) -> bool:
    return flagged_contracts[_contract]

def add_guardian(_guardian: address):
    assert _guardian != msg.sender, "Cannot add yourself as a guardian"
    guardians[msg.sender].append(_guardian)

def approve_transaction(_tx_hash: bytes32):
    assert is_guardian(msg.sender, _tx_hash), "Not an assigned guardian"
    approval_counts[_tx_hash] += 1
    if approval_counts[_tx_hash] >= required_approvals(msg.sender):
        approved_transactions[_tx_hash] = True
    log TransactionApproved(_tx_hash, msg.sender)

def required_approvals(_user: address) -> uint256:
    guardian_count: uint256 = len(guardians[_user])
    return (guardian_count + 1) / 2  # Use standard division and ensure rounding

def is_guardian(_guardian: address, _tx_hash: bytes32) -> bool:
    user_guardians: DynArray[address, 10] = guardians[msg.sender]
    for i in range(len(user_guardians)):
        if user_guardians[i] == _guardian:
            return True
    return False

def request_withdrawal(_amount: uint256):
    assert _amount > 0, "Amount must be greater than zero"
    assert not pending_withdrawals[msg.sender].executed, "Pending withdrawal already exists"
    
    pending_withdrawals[msg.sender] = Withdrawal(
        amount=_amount,
        unlock_time=block.timestamp + 86400,  # 1 day delay
        executed=False
    )
    
    log WithdrawalRequested(msg.sender, _amount, block.timestamp + 86400)

def cancel_withdrawal():
    assert not pending_withdrawals[msg.sender].executed, "Cannot cancel an executed withdrawal"
    del pending_withdrawals[msg.sender]
    log WithdrawalCancelled(msg.sender)

def execute_withdrawal():
    withdrawal: Withdrawal = pending_withdrawals[msg.sender]
    assert block.timestamp >= withdrawal.unlock_time, "Time lock active"
    assert not withdrawal.executed, "Withdrawal already executed"
    
    withdrawal.executed = True
    send(msg.sender, withdrawal.amount)
    log WithdrawalExecuted(msg.sender, withdrawal.amount)
