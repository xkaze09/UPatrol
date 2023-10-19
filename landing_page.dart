import 'package:flutter/material.dart';
import 'package:upatrol/authenticationSystem.dart';


class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  late Color myColor;

  @override
  Widget build(BuildContext context) {
    myColor = Theme.of(context).primaryColor;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: height * .5,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 156, 120, 183),
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(50),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 156, 120, 183),
                ),
                child: Container(
                  height: height * .5,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: height * .5 - (width * .9),
            left: width * .1,
            child: Container(
              height: width * .9,
              width: width * .8,
              child: Image(
                image: AssetImage("assets/images/UPatrol-logo.png"),
              ),
            ),
          ),
          Positioned.fill(
            child: Padding(
              padding: EdgeInsets.only(top: 320), 
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Welcome Text
                    Text(
                      "Welcome to \nUPatrol!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF5B3491),
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 40),  

                    // Quick Report button
                    Container(
                      width: width * 0.7,
                      height: height * 0.07,
                      child: ElevatedButton(
                        onPressed: () {
                          print("Quick Report pressed!");
                        },
                        child: Text(
                          "Quick Report",
                          style: TextStyle(fontSize: 20), 
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFFBE6F5E),
                          onPrimary: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),  

                    // Get Started button
                    Container(
                      width: width * 0.7,
                      height: height * 0.07,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context, 
                            MaterialPageRoute(builder: (context) => authenticationSystem()),
                          );
                        },
                        child: Text(
                          "Get Started",
                          style: TextStyle(fontSize: 20),  
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFF5B3491),
                          onPrimary: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
