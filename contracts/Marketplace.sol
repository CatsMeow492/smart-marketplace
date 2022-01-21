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
    // events
    event registered(string title, uint productId, address seller);
    event bought(uint productId, address buyers);
    event delivered(uint productId);
    // product registration
    function productRegistration(string memory _title, string memory _desc, uint price) public {
        require(price > 0, 'Price must be greater than zero');
        // enter product details including who is the seller
        Product memory tempProduct;
        tempProduct.title = _title;
        tempProduct.desc = _desc;
        tempProduct.price = price * 10**18;
        tempProduct.seller = msg.sender;
        tempProduct.Id = counter;
        products.push(tempProduct);
        counter++; // increment the counter for unique ID
        emit registered(_title, _tempProduct.id, msg.sender);
    }
    // buyer buys the product
    function buy(uint _productId) { 
        require(products[_productId -1].price == msg.value, 'Price must match exactly')
    // buyer confirms the delivery and funds are released to the seller
        require(products[_productId -1].seller != msg.sender, 'You cannot buy your own item')
        products[_productId - 1].buyer = msg.sender;
    // seller cannot buy his own product
    emit bought(_productId, msg.sender);
    }
    function delivery(uint _productId) {
        require(products[_productId -1].buyer == msg.sender, 'Only the buyer can confirm delivery')
        // only the buyer of the product should be allowed to confirm delivery
        products[_productId -1].delivered = true;
        products[_productId -1].seller.transfer([_productId -1].price);
        emit delivery(_productId);
    }
}