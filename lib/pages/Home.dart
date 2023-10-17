import 'package:flutter/material.dart';
import 'package:nextpass/pages/MakeTrip.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(height: 20,),
            const Text(
              "Welcome",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: 280, // Set the width of the box
              height: 130, // Set the height of the box

              decoration: BoxDecoration(
                color: const Color(0xff346CFD),
                borderRadius: BorderRadius.circular(10.0), // Set the border radius
              ),
              // Set the background color to blue
              child: const Center(
                child: Text(
                  "Rs. 1500.00", // Your text content
                  style: TextStyle(
                    color: Colors.white, // Set the text color to white
                    fontSize: 25, // Set the text font size
                    fontWeight: FontWeight.bold, // Set the text font weight
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Get Going ===================================
            const Text(
              "Get Going",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const MakeTrip()), // Replace with the page you want to navigate to
                    );
                  },
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(
                          color: Color(0xffD4E0FF),
                          width: 2.0,
                        ) // Set the border radius
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/Subtract.png", // Replace with the path to your image
                          width: 50,
                          height: 50,
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          "Start Ride", // Your text content
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const MakeTrip()), // Replace with the page you want to navigate to
                    );
                  },
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(
                          color: Color(0xffD4E0FF),
                          width: 2.0,
                        ) // Set the border radius
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/topup.png", // Replace with the path to your image
                          width: 50,
                          height: 50,
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          "Top Up", // Your text content
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const MakeTrip()), // Replace with the page you want to navigate to
                    );
                  },
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(
                          color: Color(0xffD4E0FF),
                          width: 2.0,
                        ) // Set the border radius
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/MyQR.png", // Replace with the path to your image
                          width: 50,
                          height: 50,
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          "My QR", // Your text content
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Explore More ===================================
            const Text(
              "Explore More",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                        color: Color(0xffD4E0FF),
                        width: 2.0,
                      ) // Set the border radius
                  ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/bookmark-heart.png", // Replace with the path to your image
                          width: 50,
                          height: 50,
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          "Favourites", // Your text content
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    )
                ),
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                        color: Color(0xffD4E0FF),
                        width: 2.0,
                      ) // Set the border radius
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/trending.png", // Replace with the path to your image
                        width: 50,
                        height: 50,
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        "Trending", // Your text content
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const MakeTrip()), // Replace with the page you want to navigate to
                    );
                  },
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(
                          color: Color(0xffD4E0FF),
                          width: 2.0,
                        ) // Set the border radius
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/history.png", // Replace with the path to your image
                          width: 50,
                          height: 50,
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          "Ride History", // Your text content
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50,)
          ],
        ),
      ),
    );

  }
}
