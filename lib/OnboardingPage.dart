import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:uixglowsampleapp/HomeScreen.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  bool isOnBoardSwiped = false;
  PageController _pageController;
  int currentPage;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentPage = 0;
    isOnBoardSwiped = false;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomSheet: Container(color: HexColor("#C9E7FB"), child: bottomMenu()),
        body: Container(
          height: MediaQuery.of(context).size.height,
          color: HexColor("#C9E7FB"),
          child: PageView.builder(
            onPageChanged: (_pageValue) {
              print(_pageValue);
              setState(() {
                currentPage = _pageValue;
                if (_pageValue == 2) {
                  isOnBoardSwiped = true;
                } else {
                  isOnBoardSwiped = false;
                }
              });
            },
            controller: _pageController,
            itemCount: 3,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: ClipRRect(
                      child: Image.asset("assets/images/doctors.png"),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        "See a Doctor",
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Easy way to book an appointment \n with doctor",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                  isOnBoardSwiped
                      ? getstartedButton(context)
                      : Container(
                          height: 100,
                        ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  GestureDetector getstartedButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("Get Started Clicked");
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
      },
      child: Container(
        height: 80,
        width: MediaQuery.of(context).size.width - 150,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            "Lets Get Started",
            style: TextStyle(
              decoration: TextDecoration.none,
              color: Colors.black,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }

  Row bottomMenu() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 5,
            width: 60,
            color: currentPage == 0 ? Colors.black : Colors.grey,
          ),
        ),
        Container(
          height: 5,
          width: 60,
          color: currentPage == 1 ? Colors.black : Colors.grey,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 5,
            width: 60,
            color: currentPage == 2 ? Colors.black : Colors.grey,
          ),
        )
      ],
    );
  }
}
