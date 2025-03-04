import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../router/router.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {

  final TextEditingController addressController = TextEditingController();
  final TextEditingController floorController = TextEditingController();
  final TextEditingController landmarkController = TextEditingController();

  List<bool> isSelected = [true, false, false]; // Default: Home
  String currentAddress = "Use My Current Location";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Enter Your Location",
          style: GoogleFonts.openSans(
            color: Colors.black,
            fontWeight: FontWeight.w600,  // Set font weight to 600
            fontSize: 18,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.grey),
          onPressed: () {
            Get.back();
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0, // Remove shadow
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 56,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.black.withOpacity(0.1)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3), // Shadow position
                    ),
                  ],
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search location",
                    border: InputBorder.none,  // No border to match design
                    prefixIcon: Icon(Icons.search, color: Colors.grey), // Search icon at the front
                  ),
                ),
              )
              ,
              SizedBox(height: 10,),
              // Current Location Section
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.person_pin_circle, color: Colors.blue),
                  SizedBox(width: 8),
                  Expanded(
                    child: GestureDetector(
                      child: Text(
                        currentAddress,
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      LocationButton(icon: Icons.location_searching, onTap:() {
                        print("button press");
                      }, ),
                      SizedBox(height: 10),
                      LocationButton(icon: Icons.my_location, onTap: () {
                        print("button press");
                      },),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 200),

              // Address Type Toggle with Proper Spacing
              Text("Save Address As", style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ToggleButtonWidget(
                      text: "Home",
                      isSelected: isSelected[0],
                      onTap: () {
                        setState(() {
                          isSelected = [true, false, false];
                        });
                      },
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: ToggleButtonWidget(
                      text: "Work",
                      isSelected: isSelected[1],
                      onTap: () {
                        setState(() {
                          isSelected = [false, true, false];
                        });
                      },
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: ToggleButtonWidget(
                      text: "Others",
                      isSelected: isSelected[2],
                      onTap: () {
                        setState(() {
                          isSelected = [false, false, true];
                        });
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),

              // Address Input Fields
              ReusableTextField(controller: addressController, hintText: "Enter Your Address"),
              SizedBox(height: 10),
              ReusableTextField(controller: floorController, hintText: "Floor"),
              SizedBox(height: 10),
              ReusableTextField(controller: landmarkController, hintText: "Landmark"),
              SizedBox(height: 20),

              // Save Address Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF050545).withOpacity(0.7), // Set background color
                    borderRadius: BorderRadius.circular(8), // Optional: Add border radius for rounded corners
                  ),
                  child: TextButton(
                    onPressed: () {
                      print("Address Saved");
                      Get.toNamed(AppRouter.SELECT_ADDRESS_PAGE);
                    },
                    child: Text(
                      "Save Address",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white, // Set text color to white
                      ),
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
}


class ToggleButtonWidget extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  ToggleButtonWidget({
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? Color(0xFF050545).withOpacity(0.7) : Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.shade400),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 16,
              color: isSelected ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

// Reusable Text Field
class ReusableTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;

  ReusableTextField({required this.controller, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}

// Reusable Location Button
class LocationButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  LocationButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      icon: Icon(icon, color: Colors.black54),
    );
  }
}