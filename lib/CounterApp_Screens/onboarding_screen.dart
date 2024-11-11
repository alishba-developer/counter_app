import 'package:counter_app/Auth_Screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentIndex = 0;

  final data = [
    {
      'title': "Looks Good, Feel Good",
      'desc':
          "The Counter App is a simple Flutter application that allows users to increment and decrement"
              " a displayed counter value.",
      'image': "assets/images/3.jpg"
    },
    {
      'title': "Looks Count, Feel Good",
      'desc':
          "The Counter App is a simple Flutter application that allows users to increment and decrement"
              " a displayed counter value.",
      'image': "assets/images/4.jpg"
    },
    {
      'title': "Looks Steps, Feel Good",
      'desc':
          "The Counter App is a simple Flutter application that allows users to increment and decrement"
              " a displayed counter value.",
      'image': "assets/images/5.jpg"
    },
  ];
  final _carouselController = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CarouselSlider(
            carouselController: _carouselController,
            options: CarouselOptions(
              aspectRatio: 1,
              viewportFraction: 1,
              height: MediaQuery.of(context).size.height,
            ),
            items: data.map((e) {
              return Image.asset(
                e['image']!,
                fit: BoxFit.cover,
              );
            }).toList(),
          ),
          Positioned(
              top: 33,
              right: 30,
              child: InkWell(
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                      (route) => false);
                },
                child: Text(
                  "Skip",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white),
                ),
              )),
          Positioned(
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.all(16),
                width: MediaQuery.of(context).size.width,
                height: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20)),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.brightness_1,
                          color: currentIndex == 0
                              ? Colors.black
                              : Colors.black.withOpacity(0.5),
                          size: currentIndex == 0 ? 16 : 8,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Icon(
                          Icons.brightness_1,
                          color: currentIndex == 1
                              ? Colors.black
                              : Colors.black.withOpacity(0.5),
                          size: currentIndex == 1 ? 16 : 8,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Icon(
                          Icons.brightness_1,
                          color: currentIndex == 2
                              ? Colors.black
                              : Colors.black.withOpacity(0.5),
                          size: currentIndex == 2 ? 16 : 8,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    // Image.asset(
                    //   onboardingdata["image"]!,
                    //   height: 300,
                    //   fit: BoxFit.cover,
                    // ),
                    Text(
                      data[currentIndex]['title']!,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      data[currentIndex]['desc']!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 20),
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          if (currentIndex < data.length - 1) {
                            currentIndex += 1;
                            _carouselController.nextPage();
                          } else {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen()),
                                (route) => false);
                          }
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        width: MediaQuery.of(context).size.width * 0.6,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(50)),
                        child: Text(
                          currentIndex == data.length - 1
                              ? 'Get started '
                              : 'Next',
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
