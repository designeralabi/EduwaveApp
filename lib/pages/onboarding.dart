import 'package:eduwave_app/pages/onboarding_slides_model.dart';
import 'package:eduwave_app/pages/welcome.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final PageController _pageController = PageController();

  final List<OnboardingSlidesModel> _slides = [
    OnboardingSlidesModel(
      "Let's learn with our exciting course!",
      'Discover thousands of courses and reach new milestones every day.',
    ),
    OnboardingSlidesModel(
      'Master New Skills Today',
      'Join millions of learners and unlock your potential with expert-led courses.',
    ),
    OnboardingSlidesModel(
      'Learn Anywhere, Anytime',
      'Access your favorite courses on any device and learn at your own pace.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Stack(
            children: [
              SizedBox(width: double.infinity, height: 400),
              Positioned(
                left: 30,
                top: 50,
                child: Row(
                  children: [
                    Icon(
                      Icons.menu_book_rounded,
                      size: 32,
                      color: Colors.orange.shade300,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Eduwave',
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 22, vertical: 40),
              decoration: BoxDecoration(
                color: Colors.white10,
                borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: _slides.length,
                      itemBuilder: (context, index) {
                        final slide = _slides[index];
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                slide.heading,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 38,
                                  height: 1.2,
                                ),
                              ),
                              SizedBox(height: 20),
                              Text(
                                slide.subheading,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w100,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SmoothPageIndicator(
                        controller: _pageController,
                        count: _slides.length,
                        effect: ExpandingDotsEffect(
                          activeDotColor: Colors.orange.shade200,
                          dotColor: Colors.white24,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (_pageController.page!.round() <
                              _slides.length - 1) {
                            _pageController.nextPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return WelcomeScreen();
                                },
                              ),
                            );
                          }
                        },
                        child: Container(
                          width: 170,
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.green.shade300,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Next',
                                style: TextStyle(
                                  fontSize: 26,
                                  color: Colors.white,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: Icon(
                                  Icons.navigate_next_rounded,
                                  size: 42,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
