// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.14;

contract Adder {
    // The function to add two numbers
    function add(uint a, uint b) public pure returns (uint) {
       
        return a + b;
    }

    // The function to add two numbers and validate the result
    function addAndValidate(uint a, uint b) public pure returns (uint) {
        
        uint sum = a + b;

        // Validate that the sum is less than the maximum allowed value
        require(sum < 1000 , "Sum is too large");

       
        return sum;
    }

    // The function to add two numbers and test the result
    function addAndTest(uint a, uint b) public pure returns (uint) {
      
        uint sum = a + b;

        // Test that the sum is equal to the expected result
        assert(sum == a + b);

       
        return sum;
    }

    // The function to add two numbers and revert the result if it is too large
    function addAndRevert(uint a, uint b) public pure returns (uint) {
     
        uint sum = a + b;

        // Revert the transaction if the sum is too large
        if (sum > 1000 ) {
            revert("Sum is too large");
        }

      
        return sum;
    }
}
