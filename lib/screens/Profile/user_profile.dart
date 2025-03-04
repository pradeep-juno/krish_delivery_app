import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:krish_delivery_customer/screens/Profile/profile_sub_Screen/contact_us_screen.dart';
import 'package:krish_delivery_customer/screens/Profile/profile_sub_Screen/favourite_screen.dart';
import 'package:krish_delivery_customer/screens/Profile/profile_sub_Screen/my_order_screen.dart';

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          scrolledUnderElevation: 0,
          backgroundColor: Colors.white,
          elevation: 0,
          title: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.arrow_back, color: Colors.black),
              SizedBox(width: 20),
              Text(
                "Profile",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          centerTitle: false,
          actions: [
            Image.asset(
              "assets/icons/profile_top_left.png",
              height: 40,
              width: 40,
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 20),
                    CircleAvatar(
                      radius: 40,
                      child: ClipOval(
                        child: Image.asset(
                          'assets/images/ic_logo.png',
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Mindnotix",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 10),
                    Divider(),
                    SizedBox(height: 10),
                    _buildContactInfo(),
                    SizedBox(height: 10),
                    Divider(),
                    SizedBox(height: 10),
                    _buildActionButtons(),
                    SizedBox(height: 10),
                    Divider(),
                    SizedBox(height: 10),
                    _buildListTile("Notification", Icons.notifications),
                    _buildListTile("Favourites", Icons.favorite),
                    _buildListTile("Terms & Condition", Icons.description),
                    _buildListTile("Privacy Policy", Icons.lock),
                    _buildListTile("Rate Us On Playstore", Icons.star),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ),
            Divider(),
            SizedBox(height: 10),
            _buildLogoutButton(),
            SizedBox(height: 10),
            Text("Version 1.4.20", style: TextStyle(color: Colors.grey)),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget _buildContactInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildContactItem(
          'assets/icons/mail_id.png',
          "Mail ID",
          "mindnotix@gmail.com",
        ),
        SizedBox(width: 20),
        _buildContactItem(
          'assets/icons/phone_call.png',
          "Contact",
          "0123456789",
        ),
      ],
    );
  }

  Widget _buildContactItem(String imageAsset, String title, String subtitle) {
    return Row(
      children: [
        Image.asset(
          imageAsset, // Use the image asset instead of Icon
          width: 30, // Adjust the size of the image
          height: 30, // Adjust the size of the image
        ),
        SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 12,
                color: Colors.black54,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildActionButtons() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Wrap(
          alignment: WrapAlignment.start, // Align items to start
          spacing: 15, // Space between buttons
          runSpacing: 15, // Space between rows
          children: [
            _buildActionButton("My Orders", Icons.shopping_bag),
            _buildActionButton("Contact", Icons.headphones_sharp),
            _buildActionButton("My Address", Icons.location_on),
          ],
        ),
      ],
    );
  }

  Widget _buildActionButton(String title, IconData icon) {
    return SizedBox(
      width: 160, // Set a fixed width for the button
      height: 40, // Set a fixed height for the button
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          side: BorderSide(color: Colors.grey.shade300),
        ),
        onPressed: () {
          if (title == "My Orders") {
            Get.to(MyOrderScreen());
          } else if (title == "Contact") {
            Get.to(ContactUsScreen());
          }
        },
        icon: Icon(icon, size: 18, color: Colors.black54),
        label: Text(title, style: TextStyle(fontSize: 14)),
      ),
    );
  }

  Widget _buildListTile(String title, IconData icon) {
    return ListTile(
      leading: Icon(icon, color: Colors.black54),
      title: Text(
        title,
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
      ),
      trailing: Image.asset(
        "assets/icons/Left.png",
        height: 30,
        width: 50,
        color: Colors.black,
      ),
      onTap: () {
        if (title == "Favourites") Get.to(FavouritesScreen());
      },
    );
  }

  Widget _buildLogoutButton() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        width: 180,
        height: 50, // Set a fixed width to make the button narrower
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            padding: EdgeInsets.symmetric(vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.logout),
              SizedBox(width: 8),
              Text(
                "Log out",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
