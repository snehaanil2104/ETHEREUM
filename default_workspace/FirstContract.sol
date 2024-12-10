// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;
contract FirstContract{
    string message;

    function getMessage() public view returns (string memory){
        return message;
    }
    function setMessage(string memory _message)public{
        message=_message;
    }
}