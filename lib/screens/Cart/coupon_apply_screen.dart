import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CouponApplyScreen extends StatefulWidget {
  const CouponApplyScreen({super.key});

  @override
  State<CouponApplyScreen> createState() => _CouponApplyScreenState();
}

class _CouponApplyScreenState extends State<CouponApplyScreen> {
  final List<Map<String, String>> coupons = [
    {"title": "20% OFF", "details": "Get ₹100 Off On This Order"},
    {"title": "₹50 Cashback", "details": "Get ₹50 Cashback On Your Next Order"},
    {
      "title": "Free Delivery",
      "details": "No Delivery Charges On Orders Above ₹500",
    },
    {"title": "Flat ₹200 OFF", "details": "Get ₹200 Off On Orders Above ₹1000"},
  ];

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
          "Apply Coupons",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
        child: Column(
          children: [
            // Search Bar
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Icon(Icons.search, color: Colors.grey),
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Enter coupon code',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // Apply coupon logic here
                    },
                    child: Text(
                      "Apply",
                      style: TextStyle(
                        color: Colors.indigo.shade900,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            // Add spacing between search bar and coupon list
            // Coupon List
            Expanded(
              child: ListView.builder(
                itemCount: coupons.length,
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  return CouponCard(
                    title: coupons[index]["title"]!,
                    details: coupons[index]["details"]!,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CouponCard extends StatelessWidget {
  final String title;
  final String details;

  const CouponCard({super.key, required this.title, required this.details});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: ClipPath(
        clipper: TwoSideNotchClipper(),
        child: Container(
          width: double.infinity,
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              colors: [Colors.white, Colors.grey.shade300],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade500,
                blurRadius: 0,
                spreadRadius: 0,
              ),
            ],
          ),
          child: Row(
            children: [
              // Left Side Dark Blue Section
              Container(
                decoration: BoxDecoration(
                  color: Colors.indigo.shade900,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                ),
                width: 50,
                child: Center(
                  child: RotatedBox(
                    quarterTurns: 3,
                    child: Text(
                      title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              // Main Coupon Content
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 16,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        details,
                        style: TextStyle(fontSize: 13, color: Colors.black87),
                      ),
                      SizedBox(height: 8),
                      DottedLine(
                        dashColor: Colors.grey.shade500,
                        lineThickness: 1,
                      ),
                      SizedBox(height: 8),
                      Text(
                        details,
                        style: TextStyle(fontSize: 13, color: Colors.black87),
                      ),
                    ],
                  ),
                ),
              ),
              // "Apply" Button
              Padding(
                padding: const EdgeInsets.only(right: 16.0, bottom: 96),
                child: Text(
                  "Apply",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo.shade900,
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

class TwoSideNotchClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double notchRadius = 15.0; // Notch size

    Path path =
        Path()
          ..moveTo(0, 0)
          ..lineTo(size.width, 0)
          ..lineTo(size.width, size.height / 2 - notchRadius)
          // Right notch
          ..arcToPoint(
            Offset(size.width, size.height / 2 + notchRadius),
            radius: Radius.circular(notchRadius),
            clockwise: false,
          )
          ..lineTo(size.width, size.height)
          ..lineTo(0, size.height)
          ..lineTo(0, size.height / 2 + notchRadius)
          // Left notch
          ..arcToPoint(
            Offset(0, size.height / 2 - notchRadius),
            radius: Radius.circular(notchRadius),
            clockwise: false,
          )
          ..lineTo(0, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

// import 'package:dotted_line/dotted_line.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class CouponApplyScreen extends StatefulWidget {
//   const CouponApplyScreen({super.key});
//
//   @override
//   State<CouponApplyScreen> createState() => _CouponApplyScreenState();
// }
//
// class _CouponApplyScreenState extends State<CouponApplyScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         scrolledUnderElevation: 0,
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () {
//             Get.back();
//           },
//         ),
//         title: Text(
//           "Apply Coupons",
//           style: TextStyle(
//             color: Colors.black,
//             fontSize: 18,
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//         centerTitle: true,
//       ),
//
//       body: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 14),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16),
//               child: ClipPath(
//                 clipper: TwoSideNotchClipper(),
//                 child: Container(
//                   width: 350,
//                   height: 150,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(20),
//                     gradient: LinearGradient(
//                       colors: [Colors.white, Colors.grey],
//                       begin: Alignment.topLeft,
//                       end: Alignment.bottomRight,
//                     ),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.grey.shade300,
//                         blurRadius: 0,
//                         spreadRadius: 0,
//                       ),
//                     ],
//                   ),
//                   child: Row(
//                     children: [
//                       // Left Side Dark Blue Section
//                       Container(
//                         decoration: BoxDecoration(
//                           color: Colors.indigo.shade900,
//                           borderRadius: BorderRadius.only(
//                             topLeft: Radius.circular(20),
//                             bottomLeft: Radius.circular(
//                               20,
//                             ), // ✅ Rounded top-left
//                             // ✅ Rounded top-right
//                           ),
//                         ),
//                         width: 50,
//                         child: Center(
//                           child: RotatedBox(
//                             quarterTurns: 3,
//                             child: Text(
//                               "GET 20% OFF",
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       // Main Coupon Content
//                       Expanded(
//                         child: Padding(
//                           padding: const EdgeInsets.symmetric(
//                             vertical: 12,
//                             horizontal: 16,
//                           ),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               // Discount Title
//                               Text(
//                                 "20% OFF",
//                                 style: TextStyle(
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.black,
//                                 ),
//                               ),
//                               SizedBox(height: 5),
//                               // Discount Details
//                               Text(
//                                 "Get ₹100 Off On This Order ",
//                                 style: TextStyle(
//                                   fontSize: 13,
//                                   color: Colors.black87,
//                                 ),
//                               ),
//                               SizedBox(height: 8),
//                               // Dotted Divider Line
//                               DottedLine(
//                                 dashColor: Colors.grey.shade500,
//                                 lineThickness: 1,
//                               ),
//                               SizedBox(height: 8),
//                               // Second Discount Details
//                               Text(
//                                 "Get ₹100 Off On This Order ",
//                                 style: TextStyle(
//                                   fontSize: 13,
//                                   color: Colors.black87,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       // "Apply" Button
//                       Padding(
//                         padding: const EdgeInsets.only(right: 16.0, bottom: 96),
//                         child: Text(
//                           "Apply",
//                           style: TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.indigo.shade900,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
