import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../router/router.dart';
import '../bottom_nav_bar.dart';
import 'cart_details.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final bool isCartEmpty = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          scrolledUnderElevation: 0,
          title: Text(
            "Cart",
            style: GoogleFonts.openSans(
              color: Colors.black,
              fontWeight: FontWeight.w600, // Set font weight to 600
              fontSize: 18,
            ),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.grey),
            onPressed: () {
              Get.toNamed(AppRouter.BOTTOM_NAV_BAR);
            },
          ),
          backgroundColor: Colors.white,
          elevation: 0, // Remove shadow
        ),
        body: isCartEmpty ? emptyCartView(context) : CartDetails(),
      ),
    );
  }
}

emptyCartView(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      // Image centered in the body
      Image.asset(
        'assets/images/empty_cart.png', // Add the path to your image
        width: 500, // Adjust the width of the image if needed
        height: 350, // Adjust the height of the image if needed
      ),
      SizedBox(height: 10), // Add spacing between the image and the button
      // Main message
      Text(
        "Your cart is empty", // The text you want to display
        style: TextStyle(
          fontSize: 20, // Font size of the main text
          fontWeight: FontWeight.w600, // Font weight
          color: Colors.black54, // Text color
        ),
      ),
      SizedBox(height: 8), // Add spacing between the two texts
      // Smaller text below the main message
      Text(
        "Looks like you haven't added anything to your cart yet.", // The smaller text
        style: TextStyle(
          fontSize: 14, // Smaller font size
          color: Colors.black38, // Lighter color for the text
        ),
        textAlign: TextAlign.center, // Center-align the text
      ),
      SizedBox(height: 16), // Add spacing between the text and the button

      Container(
        width:
            MediaQuery.of(context).size.width /
            1.5, // Make the button take full width
        margin: EdgeInsets.symmetric(horizontal: 16), // Add margin to the sides
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF050545), // Button color (dark purple)
            padding: EdgeInsets.symmetric(vertical: 16), // Button padding
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8), // Rounded corners
            ),
          ),
          onPressed: () {
            // Add your onPressed functionality here
            print("Browse Restaurants button pressed");
            Get.to(() => BottomNavBar());
          },
          child: Text(
            "Browse Restaurants", // Button text
            style: TextStyle(
              color: Colors.white, // Text color inside button
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    ],
  );
}
