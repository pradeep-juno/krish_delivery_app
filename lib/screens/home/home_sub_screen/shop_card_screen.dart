import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../router/router.dart';
import '../../../utils/Widgets/Swinging_image.dart';

class ShopCardScreen extends StatefulWidget {
  final String imageUrl1;
  final String imageUrl2;

  ShopCardScreen({required this.imageUrl1, required this.imageUrl2});

  @override
  State<ShopCardScreen> createState() => _ShopCardScreenState();
}

class _ShopCardScreenState extends State<ShopCardScreen> {
  late String currentImage; // Store the current image
  late String secondImage;
  @override
  void initState() {
    super.initState();
    currentImage = widget.imageUrl1;
    secondImage = widget.imageUrl2; // Set the initial image
  }

  void switchImage() {
    setState(() {
      // Toggle between image1 and image2
      currentImage =
          (currentImage == widget.imageUrl1)
              ? widget.imageUrl2
              : widget.imageUrl1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: InkWell(
        onTap: () {
          print("Item card pressed");
          Get.toNamed(AppRouter.RESTAURENT_SCREEN);
        },
        child: Stack(
          children: [
            // Main Container
            Container(
              width: 358,
              height: 330,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2), // Slight shadow
                    blurRadius: 8,
                    offset: Offset(4, 4), // Horizontal and vertical offset
                  ),
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 8,
                    offset: Offset(0, -2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Shop Name & Info
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Zeenath’s Kitchen’s",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Veg | Non Veg | ₹100 For One",
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                        SizedBox(height: 4),
                      ],
                    ),
                  ),

                  // Food Image with Price Overlay
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          currentImage, // Dynamically changing image
                          width: double.infinity,
                          height: 150,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        left: 10,
                        top: 10,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.black54,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            "Biryani ₹100",
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ),
                      ),
                    ],
                  ),

                  // Discount & Rating
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Image.asset("assets/icons/Discount.png"),
                            SizedBox(width: 4),
                            Text(
                              "Flat 20% Offer Up To ₹100",
                              style: TextStyle(
                                color: Color(0xFF050545),
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Spacer(),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 6,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    "4.5",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(width: 4),
                                  Icon(
                                    Icons.star,
                                    size: 14,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 4),
                        Row(
                          children: [
                            Row(
                              children: [
                                Image.asset("assets/icons/time.png"),
                                SizedBox(width: 4),
                                Text(
                                  "30 - 45 Mins | 1km",
                                  style: TextStyle(color: Colors.grey[600]),
                                ),
                              ],
                            ),
                            Spacer(),
                            AnimatedTextKit(
                              repeatForever: true,
                              animatedTexts: [
                                ColorizeAnimatedText(
                                  'Free Delivery',
                                  textStyle: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  colors: [
                                    Colors.purple,
                                    Colors.blue,
                                    Colors.yellow,
                                    Colors.red,
                                  ],
                                  speed: Duration(milliseconds: 200),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Positioned "Open" Image (Top Right Corner)
            Positioned(
              top: 10,
              right: 10,
              child: SwingingImage(
                imagePath: secondImage,
                width: 30,
                height: 30,
                swingAngle: 15, // Adjust swing angle
              ),
            ),
          ],
        ),
      ),
    );
  }
}
