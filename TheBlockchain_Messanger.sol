// SPDX-License-Identifier: MIT

pragma solidity 0.8.7;

contract Blockchainmessenger {

    uint public changeCounter;

    address public owner;

    string public theMessage;

    constructor() {
        owner = msg.sender;
    }

    function updateMessage( string memory _newMessage) public {

        if(msg.sender == owner){
            theMessage = _newMessage;
            changeCounter++;
        }

    }
}
