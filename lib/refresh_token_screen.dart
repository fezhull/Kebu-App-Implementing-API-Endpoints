// import 'package:flutter/material.dart';
// import 'package:kebu_app/network_service.dart'; // Import the network service

// class RefreshTokenScreen extends StatefulWidget {
//   @override
//   _RefreshTokenScreenState createState() => _RefreshTokenScreenState();
// }

// class _RefreshTokenScreenState extends State<RefreshTokenScreen> {
//   final String _refreshToken =
//       'your_refresh_token_here'; // Replace with the real refresh token

//   bool _isLoading = false;
//   String _accessToken = ''; // To store the refreshed access token
//   String _newRefreshToken = ''; // To store the new refresh token

//   // Method to refresh the token
//   void _refreshToken() async {
//     setState(() {
//       _isLoading = true; // Set loading state to true when the refresh process starts
//     });

//     try {
//       // Call the refresh access token method from NetworkService
//       var result = await NetworkService().refreshAccessToken(_refreshToken);

//       // If successful, store the new access token and refresh token
//       setState(() {
//         _accessToken = result['access_token']; // Extract the new access token
//         _newRefreshToken = result['refresh_token']; // Extract the new refresh token
//       });

//       // Display success message
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Token refreshed successfully')),
//       );
//     } catch (e) {
//       // Handle the error
//       print("Error refreshing token: $e"); // Debugging line
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error: $e')),
//       );
//     } finally {
//       setState(() {
//         _isLoading = false; // Set loading state to false once the refresh process ends
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Refresh Token Example')), // App bar title
//       body: Padding(
//         padding: const EdgeInsets.all(20.0), // Padding around the UI elements
//         child: Column(
//           mainAxisAlignment:
//               MainAxisAlignment.center, // Center content vertically
//           children: [
//             // Display the refreshed access token and refresh token
//             Text(
//               'Access Token: $_accessToken',
//               style: TextStyle(fontSize: 16),
//             ),
//             SizedBox(height: 10),
//             Text(
//               'Refresh Token: $_newRefreshToken',
//               style: TextStyle(fontSize: 16),
//             ),
//             SizedBox(height: 20),
//             // Show loading spinner when refreshing token
//             _isLoading
//                 ? CircularProgressIndicator() // Show a loading spinner while refreshing
//                 : ElevatedButton(
//                     onPressed:
//                         _refreshToken, // Trigger refresh token method on button press
//                     child: Text('Refresh Token'),
//                   ),
//           ],
//         ),
//       ),
//     );
//   }
// }
