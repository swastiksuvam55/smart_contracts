// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract Dealership {
    // VARIABLES
    enum State {
        NOT_INITIATED,
        AWAITING_PAYMENT,
        AWAITING_DELIVERY,
        COMPLETE
    }
    State public currentState;

    bool public isBuyerIn;
    bool public isMerchantIn;

    uint256 public price;

    address public buyer;
    address payable public merchant;

    // MODIFIERS
    modifier onlyBuyer() {
        require(msg.sender == buyer, "Only buyer can call this function!");
        _;
    }

    modifier escrowNotStarted() {
        require(currentState == State.NOT_INITIATED);
        _;
    }

    // FUNCTIONS
    constructor(
        
        address payable _merchant
        
    ) {
       
        merchant = _merchant;
        
    }

    function Total_price(uint256 _price) public {
        uint currentgas_fees= 1 ether;
        _price+=currentgas_fees;
        price=_price;
    }

    function initContract() public escrowNotStarted {
        if (msg.sender == buyer) {
            isBuyerIn = true;
        }
        if (msg.sender == merchant) {
            isMerchantIn = true;
        }
        if (isBuyerIn && isMerchantIn) {
            currentState = State.AWAITING_PAYMENT;
        }
    }

    function deposit() public payable onlyBuyer {
        require(currentState == State.AWAITING_PAYMENT, "Already paid");
        require(msg.value == price, "Wrong deposit amount");
        currentState = State.AWAITING_DELIVERY;
    }

    function confirmDelivery() public payable onlyBuyer {
        require(
            currentState == State.AWAITING_DELIVERY,
            "Cannot confirm delivery"
        );
        merchant.transfer(price);
        currentState = State.COMPLETE;
    }

    function withdraw() public payable onlyBuyer {
        require(
            currentState == State.AWAITING_DELIVERY,
            "Cannot withdraw at this stage"
        );
        payable(msg.sender).transfer(price);
        currentState = State.COMPLETE;
    }
}
