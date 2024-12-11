// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;

contract MyBook3 {
    string public title;
    uint16 public price;
    address public owner;
    address public seller;
    bool public sold;

    function getBookDetails() public view returns (string memory, uint16, address, bool) {
        return (title, price, seller, sold);
    }

    function setBook(string memory _title, uint16 _price) public {
        require(_price > 0, "Price must be greater than 0");
        title = _title;
        price = _price;
        owner = address(0); 
        seller = msg.sender;
        sold = false;
    }

    function ethToWei(uint eval)public pure returns(uint){
        return(eval*1000000000000000000);
    }

   function buyBook() public payable {
    uint requiredAmount = ethToWei(price);
    // require(!sold, "Book has already been sold");
    require(msg.value >= requiredAmount, "Insufficient payment; transaction reverted");

    uint bal = msg.value - requiredAmount;

    payable(seller).transfer(requiredAmount);

    if (bal > 0) {
        payable(msg.sender).transfer(bal);
    }
    owner = msg.sender;
    sold = true;    
}

}
