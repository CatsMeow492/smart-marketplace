pragma solidity 0.6.12;

contract smartMarketplace {
    struct product {
        uint counter = 1;
        string title;
        string description;
        address payable seller;
        uint productId;
    }
    Product[] public products;
    // product registration
    function productRegistration(string memory _title, string memory _desc, uint price) public {
        // enter product details including who is the seller
        Product memory tempProduct;
        tempProduct.title = _title;
        tempProduct.desc = _desc;
        tempProduct.price = price;
        tempProduct.seller = msg.sender;
        tempProduct.Id = counter;
        products.push(tempProduct);
        counter++; // increment the counter for unique ID
    }
    // buyer buys the product
    // buyer confirms the delivery and funds are released to the seller

}