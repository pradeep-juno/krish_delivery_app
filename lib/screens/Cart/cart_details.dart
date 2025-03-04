import 'package:add_to_cart_animated_button/add_to_cart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:krish_delivery_customer/utils/colors.dart';

import 'custom_dialog_screen.dart';

class CartDetails extends StatefulWidget {
  @override
  _CartDetailsState createState() => _CartDetailsState();
}

class _CartDetailsState extends State<CartDetails> {
  int value = 0;
  List<int> quantities = List.filled(3, 0);
  int basePrice = 120;

  void decreaseQuantity(int index) {
    if (quantities[index] > 0) {
      setState(() {
        quantities[index]--;
      });
    }
  }

  void increaseQuantity(int index) {
    setState(() {
      quantities[index]++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    color:
                        AppColors
                            .bottomNavColor, // Background color of the container
                    borderRadius: BorderRadius.circular(5), // Circular shape
                  ),
                  child: Image.asset(
                    'assets/images/Biryani.png',
                    // This will ensure the image covers the circle properly
                    width: 50, // Adjust the size as needed
                    height: 50, // Adjust the size as needed
                  ),
                ),
                title: Text(
                  "Zeenath Kitchen's",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text("📍 Near Kamarajar Bridge, Gudiyatham"),
              ),

              Divider(),

              // Order Details Section
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  "Your Order Details",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),

              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 2,
                itemBuilder: (context, index) {
                  int totalPrice = basePrice * quantities[index];

                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Item Image and Details
                        Expanded(
                          flex: 3,
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/images/Biryani.png',
                                width: 22,
                                height: 22,
                              ),
                              SizedBox(width: 8),
                              Expanded(
                                flex: 4,
                                child: Row(
                                  children: [
                                    Image.asset(
                                      'assets/icons/non_veg.png',
                                      width: 10,
                                      height: 10,
                                    ),
                                    SizedBox(width: 5),
                                    Expanded(
                                      child: Text(
                                        "Chicken Biryani",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Price Display
                        Text(
                          "₹ $totalPrice",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(width: 10),

                        // Quantity Adjustment Widget
                        AddToCart(
                          value: quantities[index],
                          onIncrement: (newValue) {
                            increaseQuantity(index);
                          },
                          onDecrement: (newValue) {
                            decreaseQuantity(index);
                          },
                          width: 106,
                          height: 40,
                          counterTextStyle: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          incrementIcon: Icon(
                            Icons.add,
                            size: 20,
                            color: Colors.white,
                          ),
                          decrementIcon: Icon(
                            Icons.remove,
                            size: 20,
                            color: Colors.white,
                          ),
                          duration: Duration(milliseconds: 100),
                          initialBoxDecoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: Color.fromRGBO(5, 5, 69, 2),
                              width: 2,
                            ),
                          ),
                          counterBoxDecoration: BoxDecoration(
                            color: Color.fromRGBO(5, 5, 69, 2),
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: Color.fromRGBO(5, 5, 69, 2),
                              width: 2,
                            ),
                          ),
                          initialText: Text(
                            'ADD',
                            style: TextStyle(
                              color: Color.fromRGBO(5, 5, 69, 2),
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          maxValue: 10,
                        ),
                      ],
                    ),
                  );
                },
              ),

              // Cart Items
              SizedBox(height: 10),

              Row(
                children: [
                  Expanded(child: _customButton(Icons.edit, "Add Instruction")),
                  SizedBox(width: 10),
                  Expanded(child: _customButton(Icons.add, "Add More Items")),
                ],
              ),
              SizedBox(height: 3),

              Divider(),

              Text(
                "Bill Details",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),

              SizedBox(height: 20),

              // Billing Details
              _buildBillRow("Item Total", "₹ 0.00"),
              _buildBillRow("GST %", "₹ 0.00"),
              _buildBillRow("Package Charge", "₹ 0.00"),
              _buildBillRow("Item Discount", "₹ 0.00"),
              _buildBillRow("Delivery Fee", "₹ 0.00"),
              Divider(),
              _buildBillRow("Amount To Pay", "₹ 0.00", isBold: true),
              SizedBox(height: 90),
              InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder:
                        (context) => CustomDialog(
                          onConfirm: () {
                            Get.back(); // Close the dialog
                            // Perform logout logic (e.g., navigate to login page)
                          },
                        ),
                  );
                },
                child: Container(
                  height: 50,
                  width: double.infinity,
                  color: Color(0xFF050545), // Dark blue color
                  child: Center(
                    child: Text(
                      "Place Order ➜",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Increase and Decrease Item Counter Logic
  int _itemCount = 0;

  void _increment() {
    setState(() {
      _itemCount++;
    });
  }

  void _decrement() {
    setState(() {
      if (_itemCount > 0) _itemCount--;
    });
  }

  // Reusable Billing Row Widget
  Widget _buildBillRow(String title, String value, {bool isBold = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 14,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  Widget _customButton(IconData icon, String text) {
    return OutlinedButton.icon(
      style: OutlinedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      onPressed: () {},
      icon: Icon(icon, color: Colors.black),
      label: Text(text, style: TextStyle(color: Colors.black)),
    );
  }
}
