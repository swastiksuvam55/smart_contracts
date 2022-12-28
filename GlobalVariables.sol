pragma solidity ^0.6.0;

contract GlobalFunctionExample {
    // Declare a public variable that will be used to store the value of the global function
    uint256 public globalFunctionResult;

    // Declare a public variable that will be used to store the block timestamp
    uint256 public blockTimestamp;

    // Declare a public variable that will be used to store the block number
    uint256 public blockNumber;

    // Declare a public variable that will be used to store the transaction hash
    bytes32 public transactionHash;

    // Declare a public variable that will be used to store the address of the contract
    address public contractAddress;

    // Declare a public variable that will be used to store the address of the sender
    address public senderAddress;

    // Declare a public variable that will be used to store the gas price
    uint256 public gasPrice;

    // Declare a public variable that will be used to store the gas limit
    uint256 public gasLimit;

    // Declare a public variable that will be used to store the value transferred with the transaction
    uint256 public valueTransferred;

    // Declare a public variable that will be used to store the data of the transaction
    bytes memory public transactionData;

    // The constructor function is executed when the contract is deployed
    constructor() public {
        // Set the value of the global function result to the value of the blockhash global function
        globalFunctionResult = blockhash(block.number - 1);

        // Set the value of the block timestamp to the current block timestamp
        blockTimestamp = block.timestamp;

        // Set the value of the block number to the current block number
        blockNumber = block.number;

        // Set the value of the transaction hash to the current transaction hash
        transactionHash = tx.hash;

        // Set the value of the contract address to the address of the contract
        contractAddress = address(this);

        // Set the value of the sender address to the address of the sender
        senderAddress = msg.sender;

        // Set the value of the gas price to the gas price of the current transaction
        gasPrice = tx.gasprice;

        // Set the value of the gas limit to the gas limit of the current transaction
        gasLimit = tx.gas;

        // Set the value of the value transferred to the value transferred with the current transaction
        valueTransferred = msg.value;

        // Set the value of the transaction data to the data of the current transaction
        transactionData = msg.data;
    }
}
