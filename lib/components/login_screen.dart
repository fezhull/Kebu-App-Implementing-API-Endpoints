import 'package:flutter/material.dart';
import 'package:kebu_app/components/home_screen.dart'; // Assuming HomeScreen exists
import 'package:kebu_app/network_service.dart'; // Import the network service

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Form key to validate the form
  final _formKey = GlobalKey<FormState>();

  // Text controllers for phone number and password
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();

  // Focus nodes for managing focus on text fields
  final _phoneFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  // Variable to manage loading state
  bool _isLoading = false;

  // Variable to hold any error messages
  String _authMessage = '';

  @override
  void initState() {
    super.initState();
    _phoneController.text = "0111483335"; // Default phone number (optional)
  }

  @override
  void dispose() {
    // Dispose the focus nodes when no longer needed
    _phoneFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  // Function to handle form submission
  void _submit() async {
    if (_formKey.currentState?.validate() ?? false) {
      // If the form is valid, show loading indicator and perform authentication

      String username = _phoneController.text;
      String password = _passwordController.text;

      setState(() {
        // Set loading state to true to show the loading indicator
        _isLoading = true;
        _authMessage = 'Authenticating...'; // Display authenticating message
      });

      try {
        // Show loading indicator while making the API request
        var result =
            await NetworkService().authenticateUser(username, password);

        if (result.containsKey('access_token')) {
          // If authentication is successful, navigate to the Home Screen
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
          );
        } else {
          // Handle failure in authentication (missing access_token)
          setState(() {
            _authMessage = 'Login failed! Invalid credentials';
          });
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Login failed! Invalid credentials')),
          );
        }
      } catch (e) {
        // Handle errors (e.g., network issues, wrong credentials)
        setState(() {
          _authMessage = 'Error: $e'; // Display error message
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      } finally {
        // Once the authentication process finishes, stop loading
        setState(() {
          _isLoading = false;
        });
      }
    } else {
      // If the form is not valid, show failure message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please correct the errors in the form')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // Ensuring the keyboard shows when the screen is loaded by focusing on the first field
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(_phoneFocusNode);
    });

    return Scaffold(
      appBar: AppBar(title: const Text('Login')), // App bar title
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Form(
          key: _formKey, // Attach form key to the form widget
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // "Shipping and Tracking" text at the top
              const Text(
                'Shipping and Tracking',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // Color #FFA016
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Get great experience with Tracky',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black26, // Color #FFA016
                ),
              ),
              const SizedBox(height: 40),

              // Phone number input field with validation
              TextFormField(
                controller: _phoneController,
                focusNode: _phoneFocusNode, // Attach focus node
                keyboardType:
                    TextInputType.phone, // Numeric input for phone number
                decoration: InputDecoration(
                  labelText: 'Enter your Number',
                  labelStyle: const TextStyle(color: Colors.grey, fontSize: 14),
                  prefixIcon: const Padding(
                    padding:
                        EdgeInsets.all(12.0), // Add padding around the icon
                    child: Icon(Icons.phone_outlined),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                // Phone number validation (assuming a 10-digit phone number)
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your phone number';
                  }
                  if (value.length != 10) {
                    return 'Phone number must be 10 digits long';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),

              // Password input field with validation
              TextFormField(
                controller: _passwordController,
                focusNode: _passwordFocusNode, // Attach focus node
                obscureText: true, // Hide password text
                decoration: InputDecoration(
                  labelText: 'Enter your Password',
                  labelStyle: const TextStyle(color: Colors.grey, fontSize: 14),
                  prefixIcon: const Icon(Icons.lock_outline_rounded),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                // Password validation
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  if (value.length < 6) {
                    return 'Password must be at least 6 characters long';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              // Login button with color #FFA016 and circular shape
              ElevatedButton(
                onPressed: _isLoading ? null : _submit,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(
                      0xFFFFA016), // Set background color to #FFA016
                  shape: const StadiumBorder(), // Circular button shape
                  minimumSize: const Size(double.infinity, 50), // Full width
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ), // Disable the button while loading
                child: _isLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text(
                        'Log In',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white, // Color #FFA016
                        ),
                      ),
              ),

              // Divider line above the SignUp prompt
              const SizedBox(height: 20), // Add space before divider
              const Divider(
                color: Colors.black26, // Line color
                thickness: 1, // Line thickness
              ),
              const SizedBox(height: 10), // Add space after divider

              // "Don't have an account yet? SignUp" text
              Row(
                mainAxisAlignment: MainAxisAlignment.center, // Center the text
                children: [
                  const Text(
                    'Don\'t have an account yet? ',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black45, // Light faded color
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Handle sign up navigation here
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Navigate to Sign Up')),
                      );
                      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignUpScreen()));
                    },
                    child: const Text(
                      'SignUp',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color.fromRGBO(
                            14, 12, 11, 1), // Color #FFA016 (dark color)
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),

              // Show authenticating message when _isLoading is true
              if (_isLoading)
                const Column(
                  children: [
                    SizedBox(height: 20),
                    Text(
                      'Authenticating...',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
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
