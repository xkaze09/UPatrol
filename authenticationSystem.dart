import 'package:flutter/material.dart';

class authenticationSystem extends StatefulWidget {
  const authenticationSystem({Key? key}) : super(key: key);

  @override
  State<authenticationSystem> createState() => _authenticationSystemState();
}

class _authenticationSystemState extends State<authenticationSystem> {
  late Color myColor;
  bool isSignInSelected = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController(); 

Widget _buildSocialButton(String logoPath, VoidCallback onTap) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      primary: Colors.white,
      onPrimary: Colors.black,
      elevation: 2.0,
    ),
    onPressed: onTap,
    child: Image.asset(logoPath, height: 30),  
  );
}

Widget _buildSocialButtonsRow() {
  String text = isSignInSelected ? 'or sign in with' : 'or sign up with';

  return Column(
    children: <Widget>[
      Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 12,
        ),
      ),
      SizedBox(height: 5), 
      Row(
        mainAxisAlignment: MainAxisAlignment.center,  
        children: <Widget>[
          _buildSocialButton(
            'assets/images/facebook-logo.jpg', 
            () {
              print('Sign in with Facebook pressed');
              // Implement here if facebook is pressed
            }
          ),
          SizedBox(width: 20),  
          _buildSocialButton(
            'assets/images/google-logo.jpg', 
            () {
              print('Sign in with Google pressed');
              // Implement here if google is pressed
            }
          ),
        ],
      ),
    ],
  );
}
  @override
  Widget build(BuildContext context) {
    myColor = Theme.of(context).primaryColor;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(

      body: Stack(
        children: [
          Container(
            color: Color(0xFF9C78B7),
            child: Column(
              children: [
                Container(
                  height: height * .3,
                  decoration: BoxDecoration(
                    color: Color(0xFF9C78B7),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: Container(
                    height: height * .7 - 30,
                    decoration: BoxDecoration(
                      color: Color(0xFF4B4453),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(130),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: height * .3 - (width * .45),
            left: width * .1,
            child: Container(
              height: width * .5,
              width: width * .8,
              child: Image(
                image: AssetImage("assets/images/UPatrol-logo.png"),
              ),
            ),
          ),
          Positioned(
            top: height * .3 + (width * .2),
            left: width * .2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isSignInSelected = true;
                    });
                  },
                  child: Column(
                    children: [
                      Text(
                        "Sign In",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: isSignInSelected
                              ? Colors.white
                              : Colors.white.withOpacity(0.6),
                        ),
                      ),
                      if (isSignInSelected)
                        Container(
                          margin: EdgeInsets.only(top: 5),
                          width: 50,
                          height: 2,
                          color: Colors.white,
                        ),
                    ],
                  ),
                ),
                SizedBox(width: 50),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isSignInSelected = false;
                    });
                  },
                  child: Column(
                    children: [
                      Text(
                        "Sign Up",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: isSignInSelected
                              ? Colors.white.withOpacity(0.6)
                              : Colors.white,
                        ),
                      ),
                      if (!isSignInSelected)
                        Container(
                          margin: EdgeInsets.only(top: 5),
                          width: 50,
                          height: 2,
                          color: Colors.white,
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),

            if (isSignInSelected) // Sign In 
            Positioned(
              top: height * .5 + 30,
              left: width * .1,
              child: Column(
                children: [
                  Container(
                    width: width * .8,
                    padding: EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.email, color: Colors.grey,),
                        hintText: 'Email Address',
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: width * .8,
                    padding: EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.lock, color: Colors.grey,),
                        hintText: 'Password',
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: width * 0.7,  
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('Sign In', style: TextStyle(fontSize: 20)),
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFFBE6F5E),
                        onPrimary: Colors.white,
                        textStyle: TextStyle(fontSize: 20)
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  GestureDetector(
                    onTap: (){
                      print("Forgot password clicked");
                    }, 
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(color: Colors.white.withOpacity(0.8)),
        
                    ),
                  ),
                  SizedBox(height: 20),
                  _buildSocialButtonsRow(),
          
                ],
              ),
            ),

            if (!isSignInSelected) // Sign Up 
            Positioned(
              top: height * .5 + 30, 
              left: width * .1,
              child: Column(
                children: [
                  Container(
                    width: width * .8,
                    padding: EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.email, color: Colors.grey,),
                        hintText: 'Email Address',
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: width * .8,
                    padding: EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.lock, color: Colors.grey,),
                        hintText: 'Password',
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: width * .8,
                    padding: EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      controller: confirmPasswordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.lock, color: Colors.grey,),
                        hintText: 'Confirm Password',
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: width * 0.7,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('Sign Up', style: TextStyle(fontSize: 20)),
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFFBE6F5E),
                        onPrimary: Colors.white,
                        textStyle: TextStyle(fontSize: 20),
                      
                      ),
                    ),
                  ),
                  SizedBox(height: 5),  
                  _buildSocialButtonsRow(),
                ],
              ),
            ),
        ],
      ),
    );
  }
}