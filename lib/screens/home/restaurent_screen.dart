import 'package:add_to_cart_animated_button/add_to_cart.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RestaurantScreen extends StatefulWidget {
  @override
  _RestaurantScreenState createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  final List<Map<String, String>> foodItems = [
    {
      "name": "Mutton Biriyani",
      "description": "Flavourful And Aromatic Rice With Tender Mutton",
      "price": "₹ 350  (1 Plate)",
      "imageUrl": "assets/images/biriyani_image.png",
      "iconUrl": "assets/icons/non_veg.png",
    },
    {
      "name": "Chicken Tikka",
      "description": "Spicy Grilled Chicken with Fresh Herbs",
      "price": "₹ 200  (1 Plate)",
      "imageUrl": "assets/images/biriyani_image.png",
      "iconUrl": "assets/icons/non_veg.png",
    },
    {
      "name": "Veg Biryani",
      "description": "Aromatic Rice with Fresh Vegetables",
      "price": "₹ 250  (1 Plate)",
      "imageUrl": "assets/images/biriyani_image.png",
      "iconUrl": "assets/icons/non_veg.png",
    },
    // Add more items here as needed
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
        actions: [
          IconButton(
            icon: Icon(Icons.favorite_border, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        // Keep everything inside Column, so that the top part stays fixed
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Zeenath’s Kitchen’s",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.location_on, size: 16, color: Colors.grey),
                    SizedBox(width: 4),
                    Text(
                      "Near Kamarajar Bridge, Gudiyatham",
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
                SizedBox(height: 4),
                Text(
                  "Veg | Non Veg | ₹100 For One",
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.timer, size: 16, color: Colors.black),
                    SizedBox(width: 4),
                    Text("30 - 45 Mins | 1km"),
                    Spacer(),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Row(
                        children: [
                          Text("4.5", style: TextStyle(color: Colors.white)),
                          Icon(Icons.star, color: Colors.white, size: 14),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 6),
                Row(
                  children: [
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
                          speed: Duration(
                            milliseconds: 10,
                          ), // Adjust speed if necessary
                        ),
                      ],
                    ),

                    Spacer(),
                    Row(
                      children: List.generate(5, (index) {
                        return Icon(
                          Icons.star,
                          color:
                              index < 4
                                  ? Colors.yellow
                                  : Colors.grey, // Fill stars accordingly
                          size: 14,
                        );
                      }),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      FilterChipWidget(label: "Recommended", isSelected: true),
                      FilterChipWidget(label: "Non - Veg", isSelected: false),
                      FilterChipWidget(label: "Veg", isSelected: false),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Divider(
            color: Colors.black12, // Divider color
            thickness: 1, // Divider thickness
            indent: 16, // Space before the divider
            endIndent: 16, // Space after the divider
          ),
          // SizedBox(height: 12),
          // Only make the FoodItemCard section scrollable
          Expanded(
            // Use Expanded here to allow the scrollable content to take remaining space
            child: SingleChildScrollView(
              child: Column(
                children: List.generate(foodItems.length, (index) {
                  return Column(
                    children: [
                      FoodItemCard(
                        foodName: foodItems[index]["name"]!,
                        foodDescription: foodItems[index]["description"]!,
                        foodPrice: foodItems[index]["price"]!,
                        foodImageUrl: foodItems[index]["imageUrl"]!,
                        foodIconUrl: foodItems[index]["iconUrl"]!,
                      ),
                      // Add divider after each item except the last one
                      if (index != foodItems.length - 1)
                        Divider(
                          color: Colors.black12,
                          thickness: 1,
                          indent: 16,
                          endIndent: 16,
                        ),
                    ],
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FilterChipWidget extends StatefulWidget {
  final String label;
  final bool isSelected;

  const FilterChipWidget({required this.label, required this.isSelected});

  @override
  _FilterChipWidgetState createState() => _FilterChipWidgetState();
}

class _FilterChipWidgetState extends State<FilterChipWidget> {
  late bool _isSelected;

  @override
  void initState() {
    super.initState();
    _isSelected = widget.isSelected;
  }

  @override
  Widget build(BuildContext context) {
    // Determine which image to show based on the label
    String imagePath = '';
    if (widget.label == 'Non - Veg') {
      imagePath = 'assets/icons/non_veg.png';
    } else if (widget.label == 'Veg') {
      imagePath = 'assets/icons/Veg.png';
    } else if (widget.label == 'Recommended') {
      imagePath = 'assets/icons/Recommended.png';
    }

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4),
      child: Material(
        color: Colors.transparent, // Make the material background transparent
        child: InkWell(
          onTap: () {
            setState(() {
              _isSelected = !_isSelected; // Toggle the selection state
            });
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                20,
              ), // Adjust radius for better appearance
              gradient:
                  _isSelected
                      ? LinearGradient(
                        colors: [
                          Color(0xFF362D8F),
                          Color(0xFF050545),
                        ], // Gradient colors
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      )
                      : null, // No gradient when not selected
              color:
                  !_isSelected
                      ? Colors.grey[200]
                      : null, // Default color when not selected
            ),
            padding: EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 16,
            ), // Padding inside the chip
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center, // Centering content
              children: [
                // Add the image before the text
                if (imagePath
                    .isNotEmpty) // Only show image if there's a valid path
                  Image.asset(
                    imagePath, // Path to your image asset
                    height: 18, // Adjust the image size as needed
                    width: 18,
                  ),
                SizedBox(width: 8), // Space between the image and the label
                Text(
                  widget.label,
                  style: TextStyle(
                    color: _isSelected ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FoodItemCard extends StatefulWidget {
  final String foodName;
  final String foodDescription;
  final String foodPrice;
  final String foodImageUrl;
  final String foodIconUrl;

  FoodItemCard({
    required this.foodName,
    required this.foodDescription,
    required this.foodPrice,
    required this.foodImageUrl,
    required this.foodIconUrl,
  });

  @override
  _FoodItemCardState createState() => _FoodItemCardState();
}

class _FoodItemCardState extends State<FoodItemCard> {
  int value = 0; // Default value of cart item

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        height: 180,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(widget.foodIconUrl, width: 24, height: 24),
                    SizedBox(height: 8),
                    Text(
                      widget.foodName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      widget.foodPrice,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      widget.foodDescription,
                      style: TextStyle(color: Colors.black54, fontSize: 12),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 8),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      widget.foodImageUrl,
                      width: 130,
                      height: 130,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: -16,
                    left: 12,
                    child: AddToCart(
                      value: value,
                      onIncrement: (newValue) {
                        value = newValue;
                        setState(() {});
                      },
                      onDecrement: (newValue) {
                        // New Decreased Value
                        value = newValue;
                        setState(() {});
                      },
                      width: 106,
                      height: 40,
                      counterTextStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      incrementIcon: Icon(
                        Icons.add,
                        size: 20,
                        color: Colors.white,
                      ),
                      decrementIcon: Icon(
                        Icons.remove,
                        size: 20,
                        color: Colors.white,
                      ),
                      duration: Duration(milliseconds: 100),
                      initialBoxDecoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: Color.fromRGBO(5, 5, 69, 2),
                          width: 2,
                        ),
                      ),
                      counterBoxDecoration: BoxDecoration(
                        color: Color.fromRGBO(5, 5, 69, 2),
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: Color.fromRGBO(5, 5, 69, 2),
                          width: 2,
                        ),
                      ),
                      initialText: Text(
                        'ADD',
                        style: TextStyle(
                          color: Color.fromRGBO(5, 5, 69, 2),
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      maxValue: 10,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;

  CategoryCard({
    required this.imagePath,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              colors: [Colors.black.withOpacity(0.7), Colors.transparent],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 4),
              Text(
                subtitle,
                style: TextStyle(color: Colors.white70, fontSize: 14),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
