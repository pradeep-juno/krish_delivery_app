import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class MyOrderScreen extends StatefulWidget {
  @override
  _MyOrderScreenState createState() => _MyOrderScreenState();
}

class _MyOrderScreenState extends State<MyOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Get.back();
          },
        ),

        title: Text(
          "My Orders",
          style: GoogleFonts.openSans(
            color: Colors.black,
            fontSize: 20, // Adjust size as needed
            fontWeight: FontWeight.w600, // Adjust weight as needed
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              SearchBar(),
              SizedBox(height: 10),
              OrderCard(status: "Cancelled"),
              SizedBox(height: 10),
              OrderCard(status: "Delivered"),
              SizedBox(height: 10),
              OrderCard(status: "Rejected"),
            ],
          ),
        ),
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Search Shop & Product",
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey), // Grey border color
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey), // Grey border color
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.black,
            ), // Black border when focused
          ),
        ),
      ),
    );
  }
}

class OrderCard extends StatelessWidget {
  final String status;

  OrderCard({required this.status});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF050545), Color(0xFF0C0CAB)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                ),
                padding: EdgeInsets.all(10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Image.asset("assets/icons/my_order_briyani.png", width: 48),
                    // SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Zeenath Kitchen’s",
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.location_on,
                                color: Colors.white,
                                size: 10,
                              ),
                              SizedBox(width: 5),
                              Text(
                                "Near Kamarajar Bridge.",
                                style: GoogleFonts.poppins(
                                  color: Colors.white70,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5),
                          InkWell(
                            onTap: () {
                              print("View Menu Clicked");
                            },
                            child: Text(
                              "View Menu",
                              style: TextStyle(
                                color: Colors.white70,
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text("*$status", style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
              Positioned(
                bottom: 5,
                right: 10,
                child: Text(
                  "01 Mar 2025 at 09:13",
                  style: TextStyle(color: Colors.white70),
                ),
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Stack(
              children: [
                Column(
                  children: [
                    OrderItem(
                      name: "Mutton Biriyani",
                      image: "assets/images/Biryani.png",
                      imageOne: "assets/icons/non_veg.png",
                    ),
                    OrderItem(
                      name: "Chicken Biriyani",
                      image: "assets/images/Biryani.png",
                      imageOne: "assets/icons/non_veg.png",
                    ),
                    SizedBox(
                      height: 25,
                    ), // To avoid overlapping with Positioned
                    Divider(),
                    if (status == "Cancelled")
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text(
                          "*Order Cancelled",
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    if (status == "Delivered")
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 120,
                            height: 38,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Color(0xFF050545), Color(0xFF0C0CAB)],
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(
                                  4.0,
                                ), // Updated padding to 8
                                child: Text(
                                  "Rate Delivery Boy",
                                  style: GoogleFonts.nunito(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),

                          SizedBox(
                            height: 28,
                            child: VerticalDivider(
                              color: Colors.grey,
                              thickness: 1.5,
                              width: 15,
                            ),
                          ),
                          Container(
                            width: 118,
                            height: 38,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Color(0xFF050545), Color(0xFF0C0CAB)],
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.all(4),
                                child: Text(
                                  "Repeat Order",
                                  style: GoogleFonts.nunito(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    if (status == "Rejected")
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text(
                          "*Order Rejected By Vendor",
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                  ],
                ),
                Positioned(
                  right: 10,
                  top: 24, // Adjust this value as needed
                  child: Column(
                    children: [
                      Text(
                        "*Total Amount",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "₹100",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OrderItem extends StatelessWidget {
  final String name;
  final String image;
  final String imageOne;

  OrderItem({required this.name, required this.image, required this.imageOne});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        children: [
          Image.asset(image, width: 30),
          SizedBox(width: 10),
          Image.asset(imageOne, width: 10),
          SizedBox(width: 10),
          Text("$name * 1Qty"),
        ],
      ),
    );
  }
}
