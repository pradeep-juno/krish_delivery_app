import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:krish_delivery_customer/router/router.dart';

class OrderSummaryScreen extends StatefulWidget {
  const OrderSummaryScreen({super.key});

  @override
  State<OrderSummaryScreen> createState() => _OrderSummaryScreenState();
}

class _OrderSummaryScreenState extends State<OrderSummaryScreen> {
  late ConfettiController _confettiController;

  @override
  void initState() {
    super.initState();
    _confettiController = ConfettiController(
      duration: const Duration(seconds: 2),
    );
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  final List<Map<String, String>> orderList = [
    {
      "name": "Mutton Biryani",
      "price": "₹ 350",
      "image": "assets/images/Biryani.png",
    },
    {
      "name": "Chicken Biryani",
      "price": "₹ 320",
      "image": "assets/images/Biryani.png",
    },
    {
      "name": "Paneer Biryani",
      "price": "₹ 280",
      "image": "assets/images/Biryani.png",
    },
    {
      "name": "Egg Biryani",
      "price": "₹ 250",
      "image": "assets/images/Biryani.png",
    },
    {
      "name": "Veg Biryani",
      "price": "₹ 200",
      "image": "assets/images/Biryani.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text(
          "Order Summary",
          style: GoogleFonts.openSans(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    sectionTitle(
                      "Delivery Address",
                      "assets/icons/delivery_address_icon.png",
                    ),
                    deliveryAddressCard(),
                    sectionTitle("Your Orders", "assets/icons/your_orders.png"),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: orderList.length,
                      itemBuilder: (context, index) {
                        return orderItem(
                          orderList[index]["name"]!,
                          orderList[index]["price"]!,
                          orderList[index]["image"]!,
                        );
                      },
                    ),
                    sectionTitle(
                      "Order Details",
                      "assets/icons/order_details.png",
                    ),
                    orderDetails(),
                    const SizedBox(height: 14),
                    availableCoupons(),
                    const SizedBox(height: 10),
                    sectionTitle("Payment Option", "assets/icons/payment.png"),
                    paymentOptions(),
                    const SizedBox(height: 20),
                    amountToPay("₹ 350"),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
          confirmOrderButton(),
        ],
      ),
    );
  }

  Widget sectionTitle(String title, String imagePath) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 10),
      child: Row(
        children: [
          Image.asset(
            imagePath,
            width: 24, // Adjust the width as needed
            height: 24, // Adjust the height as needed
          ),
          const SizedBox(width: 10), // Space between image and text
          Text(
            title,
            style: GoogleFonts.openSans(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget deliveryAddressCard() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Color(0xFF050545)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.home, color: Color(0xFF050545)),
              const SizedBox(width: 10),
              Text(
                "Home",
                style: GoogleFonts.openSans(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              TextButton(
                onPressed: () {},
                child: Text(
                  "Change",
                  style: GoogleFonts.openSans(
                    color: const Color(0xFF050545),
                    decoration: TextDecoration.underline, // ✅ Adds underline
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Text(
            "30, R.S Road, Near State Bank Of India",
            style: GoogleFonts.openSans(fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget orderItem(String name, String price, String image) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Image.asset(image, width: 40, height: 40),
          const SizedBox(width: 10),
          Image.asset(
            "assets/icons/non_veg.png",
            width: 10,
            height: 10,
          ), // Added new icon
          const SizedBox(width: 8),
          Expanded(
            child: Text(name, style: GoogleFonts.openSans(fontSize: 16)),
          ),
          Text(
            price,
            style: GoogleFonts.openSans(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget orderDetails() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Color(0xFF050545)),
      ),
      child: Column(
        children: [
          orderDetailRow("Order Number", "0584541410552"),
          const Divider(color: Color(0xFF050545)),
          orderDetailRow("Delivery Within", "30 - 45 Minutes"),
        ],
      ),
    );
  }

  Widget orderDetailRow(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: GoogleFonts.openSans(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(value, style: GoogleFonts.openSans(fontSize: 14)),
      ],
    );
  }

  Widget availableCoupons() {
    return InkWell(
      onTap: () {
        // Perform your action here, e.g., navigate to another page
        print("Arrow icon tapped");
        Get.toNamed(AppRouter.COUPON_APPLY_SCREEN);
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Color(0xFF050545)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  "assets/icons/coupon.png",
                  width: 22, // Adjust as needed
                  height: 22,
                  fit: BoxFit.contain,
                ),
                const SizedBox(width: 10), // Space between image and text
                Text(
                  "Available Coupons",
                  style: GoogleFonts.openSans(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const Icon(Icons.arrow_forward_ios, size: 16),
          ],
        ),
      ),
    );
  }

  Widget paymentOptions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        paymentButton(Icons.money, "Cash On Delivery"),
        paymentButton(Icons.account_balance, "Bank Transfer"),
      ],
    );
  }

  Widget paymentButton(IconData icon, String title) {
    return Flexible(
      // Wrap with Flexible to prevent overflow
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Color(0xFF050545)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 18, color: Colors.black),
            const SizedBox(width: 5),
            Text(title, style: GoogleFonts.openSans(fontSize: 14)),
          ],
        ),
      ),
    );
  }

  Widget amountToPay(String amount) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          "Amount To Pay:",
          style: GoogleFonts.openSans(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(width: MediaQuery.of(context).size.width * 0.04),
        Text(
          amount,
          style: GoogleFonts.openSans(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget confirmOrderButton() {
    return Stack(
      alignment: Alignment.center,
      children: [
        ConfettiWidget(
          confettiController: _confettiController,
          blastDirection: -pi / 4, // Spread upwards
          emissionFrequency: 0.05, // Frequency of particles
          numberOfParticles: 10, // Number of confetti pieces
          gravity: 0.2, // Control falling speed
        ),
        Container(
          color: Colors.white,
          padding: const EdgeInsets.all(16),
          child: InkWell(
            onTap: () {
              _confettiController.play(); // 🎉 Start Confetti Animation
            },
            borderRadius: BorderRadius.circular(10),
            child: Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(5, 5, 69, 2), // ✅ Fixed Opacity
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Confirm Order",
                    style: GoogleFonts.openSans(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 5),
                  const Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                    size: 18,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
