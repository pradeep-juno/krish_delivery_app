import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:krish_delivery_customer/screens/home/location_Screen.dart';

class SelectAddressPage extends StatefulWidget {
  @override
  _SelectAddressPageState createState() => _SelectAddressPageState();
}

class _SelectAddressPageState extends State<SelectAddressPage> {
  int selectedIndex = -1;

  final List<Map<String, dynamic>> addresses = [
    {'title': 'Home', 'icon': Icons.home},
    {'title': 'Office', 'icon': Icons.business},
    {'title': 'Others', 'icon': Icons.apartment},
  ];

  void selectAddress(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Select Your Address', style: GoogleFonts.openSans()),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.location_on, color: Colors.black54),
                SizedBox(width: 10),
                Text(
                  'Use Current Location',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: Divider(thickness: 1.5, color: Colors.grey.shade400),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      "Saved Address",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade400,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Divider(thickness: 1.5, color: Colors.grey.shade400),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Column(
              children: List.generate(addresses.length, (index) {
                bool isSelected = selectedIndex == index;
                return GestureDetector(
                  onTap: () => selectAddress(index),
                  child: Card(
                    color: isSelected ? Colors.blue.shade100 : Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      leading: Icon(
                        addresses[index]['icon'],
                        color: isSelected ? Colors.blue : Colors.black54,
                      ),
                      title: Text(
                        addresses[index]['title'],
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: isSelected ? Colors.blue : Colors.black,
                        ),
                      ),
                      subtitle: Text('30, R.S Road, Near State Bank Of India'),
                      trailing: Icon(Icons.more_vert),
                    ),
                  ),
                );
              }),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                Get.to(() => LocationScreen());
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue.shade900,
                minimumSize: Size(double.infinity, 50),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.add, color: Colors.white),
                  SizedBox(width: 10),
                  Text(
                    'Add New Address',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}