import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../utils/functions.dart';
import '../home_sub_screen/shop_card_screen.dart';
import '../search.dart';
import '../search_screen.dart';
import '../topscreen.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int activeIndex = 0;

  final List<Map<String, String>> offers = [
    {
      "image": "assets/images/dairy_product.png",
      "title": "Dairy Product",
      "description": "Milk | Curd | ₹100",
      "time": "30 - 45 Mins | 1km",
      "discount": "30% OFF\nUpto ₹100",
    },
    {
      "image": "assets/images/dairy_product.png",
      "title": "Vegetables",
      "description": "Vegetables | ₹100",
      "time": "30 - 45 Mins | 1km",
      "discount": "30% OFF\nUpto ₹100",
    },
    {
      "image": "assets/images/dairy_product.png",
      "title": "Haldi Product",
      "description": "Spices | Leaves",
      "time": "30 - 45 Mins | 1km",
      "discount": "30% OFF\nUpto ₹100",
    },
  ];

  final List<String> images = [
    'assets/images/image_one.png',
    'assets/images/image_three.png',
    'assets/images/image_two.png',
  ];

  final List<Map<String, String>> menuItems = [
    {"image": "assets/images/Biryani.png", "label": "Biriyani"},
    {"image": "assets/images/Chinese.png", "label": "Chinese"},
    {"image": "assets/images/Dessert.png", "label": "Dessert"},
    {"image": "assets/images/Biryani.png", "label": "Biriyani"},
    {"image": "assets/images/Chinese.png", "label": "Chinese"},
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            // Top part: non-scrollable
            SizedBox(height: 10.0),
            Topscreen(),
            SizedBox(height: 14),
            InkWell(
              onTap: () {
                // Navigate to SearchScreen using GetX
                Get.to(() => SearchScreen());
              },
              child: Search(),
            ),
            SizedBox(height: 14),

            // Scrollable part below Search
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Carousel Slider
                    CarouselSlider(
                      items:
                          images.map((image) {
                            return Container(
                              width: 350,
                              height: 225,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                  image: AssetImage(image),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          }).toList(),
                      options: CarouselOptions(
                        height: 225,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 3),
                        enlargeCenterPage: true,
                        onPageChanged: (index, reason) {
                          setState(() {
                            activeIndex = index;
                          });
                        },
                      ),
                    ),
                    SizedBox(height: 15),

                    // Smooth Indicator
                    AnimatedSmoothIndicator(
                      activeIndex: activeIndex,
                      count: images.length,
                      effect: WormEffect(
                        dotHeight: 8,
                        dotWidth: 8,
                        activeDotColor: Color(0xFF050545),
                        dotColor: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 20),

                    // Divider with Title
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Divider(
                              thickness: 1.5,
                              color: Colors.grey.shade400,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8.0,
                            ),
                            child: Text(
                              "Your’s Favourite Menu Today",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              thickness: 1.5,
                              color: Colors.grey.shade400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),

                    // Horizontal Scrollable Food Menu
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Column(
                        children: [
                          Row(
                            children:
                                menuItems.map((item) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0,
                                    ),
                                    child: Column(
                                      children: [
                                        Container(
                                          width: 100,
                                          height: 100,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                            image: DecorationImage(
                                              image: AssetImage(item["image"]!),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 5),
                                        Text(
                                          item["label"]!,
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }).toList(),
                          ),
                          Row(
                            children:
                                menuItems.map((item) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0,
                                    ),
                                    child: Column(
                                      children: [
                                        Container(
                                          width: 100,
                                          height: 100,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                            image: DecorationImage(
                                              image: AssetImage(item["image"]!),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 5),
                                        Text(
                                          item["label"]!,
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }).toList(),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Divider(
                              thickness: 1.5,
                              color: Colors.grey.shade400,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8.0,
                            ),
                            child: Text(
                              "Top Rated Shops",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              thickness: 1.5,
                              color: Colors.grey.shade400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        filterButton("assets/icons/sort.png", "Sort"),
                        SizedBox(width: 10),
                        filterButton("assets/icons/ratings.png", "Ratings"),
                        SizedBox(width: 10),
                        filterButton("assets/icons/cuisine.png", "Cuisine"),
                      ],
                    ),

                    SizedBox(height: 10),
                    Text(
                      "All Shops Around You",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[400],
                      ),
                    ),
                    SizedBox(height: 10),
                    ShopCardScreen(
                      imageUrl1: 'assets/images/biriyani_image.png',
                      imageUrl2: 'assets/icons/open.png',
                    ),
                    SizedBox(height: 20),
                    Container(
                      width:
                          double
                              .infinity, // Use double.infinity to take full width
                      height: 360,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(
                          5,
                          5,
                          69,
                          2,
                        ), // Set opacity to 70%
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                        ), // Remove horizontal padding
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Divider(
                                    indent: 50,
                                    thickness: 1.5,
                                    color: Colors.white,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0,
                                  ),
                                  child: Text(
                                    "Today Offers",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Divider(
                                    endIndent: 50,
                                    thickness: 1.5,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ), // Added spacing between the row and the scrollable section
                            Expanded(
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children:
                                      offers
                                          .map(
                                            (offer) => _buildOfferCard(offer),
                                          )
                                          .toList(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    ShopCardScreen(
                      imageUrl1: 'assets/images/biriyani_image.png',
                      imageUrl2: 'assets/icons/open.png',
                    ),
                    SizedBox(height: 20),
                    ShopCardScreen(
                      imageUrl1: 'assets/images/briyani_black.png',
                      imageUrl2: 'assets/icons/close.png',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildOfferCard(Map<String, String> offer) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      // Container with image, rating, and discount
      Container(
        width: 180,
        height: 220, // Fixed height for the container
        margin: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Stack(
          children: [
            // Image with BoxFit.cover to ensure it fully covers the container
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
              child: Image.asset(
                offer["image"]!,
                width: double.infinity, // Ensures the image takes up full width
                height:
                    double.infinity, // Ensures the image takes up full height
                fit: BoxFit.cover, // Make the image cover the whole container
              ),
            ),
            Positioned(
              top: 8,
              left: 8,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  children: [
                    Icon(Icons.star, color: Colors.white, size: 14),
                    SizedBox(width: 4),
                    Text(
                      "4.5",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
            // Positioned Discount Text directly below the rating
            Positioned(
              top:
                  120, // Adjusted to position the discount below the 4.5 rating
              left: 8,
              child: Text(
                offer["discount"]!,
                style: TextStyle(
                  color: Colors.white, // Change the color to suit your design
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),

      // Padding for the text elements: title, time, and description
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              offer["title"]!,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 5),
            Row(
              children: [
                Icon(Icons.access_time, size: 14, color: Colors.white),
                SizedBox(width: 5),
                Text(
                  offer["time"]!,
                  style: TextStyle(fontSize: 12, color: Colors.white),
                ),
              ],
            ),
            SizedBox(height: 5),
            Text(
              offer["description"]!,
              style: TextStyle(fontSize: 12, color: Colors.white),
            ),
          ],
        ),
      ),
    ],
  );
}
