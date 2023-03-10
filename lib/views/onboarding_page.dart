import 'package:evernotes/constants/global_variables.dart';
import 'package:evernotes/model/onboard_data.dart';
import 'package:evernotes/screens/home.dart';
import 'package:evernotes/screens/tabs_screen.dart';
import 'package:evernotes/screens/pending_screen.dart';
import 'package:evernotes/widgets/my_text_button.dart';
import 'package:evernotes/widgets/onboard_nav_button.dart';
import 'package:flutter/material.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  int currentPage = 0;
  PageController _pageController = PageController(initialPage: 0);

  AnimatedContainer doIndicator(index) {
    return AnimatedContainer(
      margin: EdgeInsets.symmetric(
        horizontal: 5,
      ),
      duration: const Duration(milliseconds: 450),
      height: 10,
      width: 10,
      decoration: BoxDecoration(
          color: currentPage == index
              ? GlobalVariables.secondaryColordark
              : Color.fromARGB(255, 253, 253, 253),
          shape: BoxShape.circle),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomRight,
            colors: [
              Colors.white,
              Colors.grey,
              Color(0xFF0b505a),
            ],
          ),
        ),
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: onboardingContents.length,
                itemBuilder: (context, index) => Column(
                  children: [
                    const SizedBox(
                      height: 60,
                    ),
                    Text(
                      onboardingContents[index].title,
                      style: const TextStyle(
                          fontSize: 23,
                          color: GlobalVariables.secondaryColordark),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 400,
                      child: Image.asset(onboardingContents[index].image),
                    ),
                    RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                              text:
                                  'We Can help you to be a better version of yourself',
                              style: TextStyle(fontSize: 16)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  currentPage == onboardingContents.length - 1
                      ? MyTextButton(
                          buttonName: 'Get Started',
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TabsScreen(),
                              ),
                            );
                          },
                          bgColor: Colors.white,
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            OnBoardNavBtn(
                              name: 'Skip',
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => TabsScreen(),
                                  ),
                                );
                              },
                            ),
                            Row(
                              children: List.generate(
                                onboardingContents.length,
                                (index) => doIndicator(index),
                              ),
                            ),
                            OnBoardNavBtn(
                              name: 'Next',
                              onPressed: () {
                                _pageController.nextPage(
                                    duration: const Duration(milliseconds: 400),
                                    curve: Curves.easeInOut);
                              },
                            ),
                          ],
                        ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
