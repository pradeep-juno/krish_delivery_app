import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:krish_delivery_customer/screens/home/select_address.dart';

import 'location_Screen.dart';

class Topscreen extends StatefulWidget {
  const Topscreen({super.key});

  @override
  State<Topscreen> createState() => _TopscreenState();
}

class _TopscreenState extends State<Topscreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/images/ic_logo.png', // Replace with your actual logo path
                  width: 50,
                  height: 52,
                ),
                SizedBox(width: 18),
                InkWell(
                  onTap: () {
                    // Navigate to the LocationScreen when the InkWell is tapped
                    Get.to(() => SelectAddressPage());
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.location_on, color: Colors.blue),
                          SizedBox(width: 5),
                          Text(
                            'Gudiyatham',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Text(
                        '30, R.S Road, Near State Bank Of India',
                        style: TextStyle(fontSize: 12, color: Colors.black54),
                      ),
                    ],
                  ),
                )

              ],
            ),
            const SizedBox(width: 18),
            CircleAvatar(
              radius: 26,
              backgroundImage: AssetImage('assets/icons/profile.png'), // Replace with your actual image path
            ),
          ],
        ),
      ),
    );
  }
}
