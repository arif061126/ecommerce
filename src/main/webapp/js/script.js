function addToCart(pId, pName, pPrice, pQuantity) {
    let cart = localStorage.getItem("cart");

    if (cart == null) {

        //no cart yet
        let products = [];
        let pro = {productId: pId, productName: pName, productQuantity: 1, productPrice: pPrice};
        products.push(pro);
        localStorage.setItem("cart", JSON.stringify(products));
        console.log("Product is added for the first time.");

    } else {
        //cart is already present
        let productCart = JSON.parse(cart);

        let oldProduct = productCart.find((item) => item.productId === pId);

        if (oldProduct) {
            //need to increase the quantity
            oldProduct.productQuantity += oldProduct.productQuantity;

            productCart.map((item) => {
                if (item.productId === oldProduct.productId) {
                    item.productQuantity = oldProduct.productQuantity;

                }

            });
            if (oldProduct.productQuantity = pQuantity) {
                localStorage.setItem("cart", JSON.stringify(productCart));
                console.log("Product quantity is increased.");
            } else {
                console.log("Product quantity can not be increased.");
            }
        } else {
            //need to add product
            let pro = {productId: pId, productName: pName, productQuantity: 1, productPrice: pPrice};
            productCart.push(pro);
            localStorage.setItem("cart", JSON.stringify(productCart));
            console.log("Product is added.");
        }

    }

    updateCart();

}

//update cart

function updateCart() {
    let cartString = localStorage.getItem("cart");
    let cart = JSON.parse(cartString);

    if (cart === null || cart.length === 0) {
        console.log("Cart is Empty!!!");
        $(".cart-items").html("(0)");
        $(".cart-body").html("<h3>Your Cart is Empty!</h3>");
        $(".checkout-btn").addClass("disabled");
        $(".ref").hide("href");
    } else {
        //Something in the cart
        console.log(cart);
        $(".cart-items").html(`(${cart.length})`);

        let table = `
        
        <table class='table'>
        <thead class='thead-light'>
        <tr>
        <th class='text-center'>Product Name: </th>
        <th class='text-center'>Product Price: </th>
        <th class='text-center'>Product Quantity: </th>
        <th class='text-center'>Total Price: </th>
        <th class='text-center'>Action</th>
        
        
        </tr>
        </thead>
        
    `;
        let totalPrice=0;
        
        cart.map((item)=>{
            
            table+=`
            
            <tr>
            <td> ${item.productName}</td>
            <td class='text-center'>${item.productPrice}</td>
            <td class='text-center'>${item.productQuantity}</td>
            <td class='text-center'>${item.productQuantity*item.productPrice}</td>
            <td class='text-center'><button class='btn btn-sm btn-danger' onclick='removeProduct(${item.productId})'>Remove</button></td>
            </tr>
            
            
        `;
            totalPrice+=item.productQuantity*item.productPrice;
            
        });
        
        table +=`<tr><td class='text-center' style='font-size:18px;'><b>Total Price: </b></td><td></td><td></td><td class='text-right text-lg' style='font-size:18px;'><b>${totalPrice}</b></td></tr></table>`;
        $(".cart-body").html(table);
        $(".checkout-btn").removeClass("disabled");
        $(".ref").show("href");
    }
}

function removeProduct(pId){
    let cartString = localStorage.getItem("cart");
    let cart = JSON.parse(cartString);
    
    let newCart=cart.filter((item)=>item.productId!=pId);
    
    localStorage.setItem("cart", JSON.stringify(newCart));
    updateCart(); 
}


$(document).ready(function () {
    updateCart();
});

showModalDialog()