import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController rollNumberController = TextEditingController();
  final TextEditingController gradeController = TextEditingController();
  final TextEditingController parentContactController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isButtonEnabled = false;
  String errorMessage = "";

  @override
  void initState() {
    super.initState();
    nameController.addListener(validateFields);
    rollNumberController.addListener(validateFields);
    gradeController.addListener(validateFields);
    parentContactController.addListener(validateFields);
    emailController.addListener(validateFields);
    passwordController.addListener(validateFields);
  }

  void validateFields() {
    setState(() {
      isButtonEnabled =
          nameController.text.isNotEmpty &&
          rollNumberController.text.isNotEmpty &&
          gradeController.text.isNotEmpty &&
          parentContactController.text.length == 10 &&
          emailController.text.contains("@") &&
          passwordController.text.length >= 6;
    });
  }

  void signUp() {
    if (isButtonEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Signup Successful! Please Login."),
          backgroundColor: Colors.green,
        ),
      );
      Future.delayed(Duration(seconds: 1), () {
        Navigator.pushNamed(context, '/login'); // Navigate to login
      });
    } else {
      setState(() {
        errorMessage = "Please fill all fields correctly!";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.deepPurple.shade900,
                  Colors.pinkAccent.shade700,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                width: 380,
                padding: EdgeInsets.all(30),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.white.withOpacity(0.2)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 15,
                      spreadRadius: 3,
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.person_add, size: 75, color: Colors.white),
                      SizedBox(height: 15),
                      Text(
                        "Create Account",
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 20),

                      buildTextField("Full Name", Icons.person, nameController),
                      buildTextField(
                        "Roll Number",
                        Icons.numbers,
                        rollNumberController,
                      ),
                      buildTextField(
                        "Grade/Class",
                        Icons.school,
                        gradeController,
                      ),
                      buildTextField(
                        "Parent Contact",
                        Icons.phone,
                        parentContactController,
                        keyboardType: TextInputType.phone,
                      ),
                      buildTextField(
                        "Email Address",
                        Icons.email,
                        emailController,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      buildTextField(
                        "Password",
                        Icons.lock,
                        passwordController,
                        obscureText: true,
                      ),

                      SizedBox(height: 10),
                      Text(
                        errorMessage,
                        style: TextStyle(color: Colors.red, fontSize: 14),
                      ),
                      SizedBox(height: 20),

                      ElevatedButton(
                        onPressed: isButtonEnabled ? signUp : null,
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              isButtonEnabled ? Colors.pinkAccent : Colors.grey,
                          padding: EdgeInsets.symmetric(
                            horizontal: 100,
                            vertical: 15,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),

                      SizedBox(height: 10),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/login');
                        },
                        child: Text(
                          "Already have an account? Login",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTextField(
    String hintText,
    IconData icon,
    TextEditingController controller, {
    bool obscureText = false,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: 15),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.white.withOpacity(0.8)),
          prefixIcon: Icon(icon, color: Colors.white),
          filled: true,
          fillColor: Colors.white.withOpacity(0.2),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
