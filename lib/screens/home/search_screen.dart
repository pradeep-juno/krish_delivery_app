import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:krish_delivery_customer/screens/home/search.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            "Search Food & Restaurant",
            style: GoogleFonts.openSans(
              color: Colors.black,
              fontWeight: FontWeight.w600,  // Set font weight to 600
              fontSize: 18,
            ),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.grey),
            onPressed: () {
              Get.back(); // Navigate back to the previous screen (HomeScreen)
            },
          ),
          backgroundColor: Colors.white,
          elevation: 0, // Remove shadow
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
          child: Column(
            children: [
              Search()
            ],
          ),
        )
      ),
    );
  }
}