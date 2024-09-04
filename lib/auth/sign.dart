// import 'dart:convert';
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:image_picker/image_picker.dart';

// class SignupForm extends StatefulWidget {
//   @override
//   _SignupFormState createState() => _SignupFormState();
// }

// class _SignupFormState extends State<SignupForm> {
//   final _formKey = GlobalKey<FormState>();
//   final _fullNameController = TextEditingController();
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();
//   final _roleController = TextEditingController();
//   final _avatarController = TextEditingController();
//   final _birthdateController = TextEditingController();

//   File? _selectedImage;

//   Future<void> _getImage() async {
//     final picker = ImagePicker();
//     final pickedFile = await picker.pickMedia();

//     if (pickedFile != null) {
//       setState(() {
//         _selectedImage = File(pickedFile.path);
//       });
//     }
//   }

//   Future<void> _signup() async {
//     final path = 'http://127.0.0.1:8000/auth/signup';
//     final path2 = 'http://localhost:8000/auth/signup/';
//     final url = Uri.parse(path);

//     try {
//       final request = http.MultipartRequest('POST', url)
//         ..fields['fullName'] = _fullNameController.text
//         ..fields['email'] = _emailController.text
//         ..fields['password'] = _passwordController.text
//         ..fields['role'] = _roleController.text
//         ..fields['birthdate'] = _birthdateController.text
//         ..files.add(
//           await http.MultipartFile.fromPath(
//             'avatar',
//             _selectedImage!.path,
//           ),
//         );

//       final response = await http.Response.fromStream(await request.send());

//       if (response.statusCode == 200) {
//         final responseData = json.decode(response.body);
//         print('Signup successful: $responseData');
//       } else {
//         final errorMessage = json.decode(response.body)['error'];
//         print('Signup failed: $errorMessage');
//       }
//     } catch (error) {
//       print('Error during signup: $error');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Signup Form'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               TextFormField(
//                 controller: _fullNameController,
//                 decoration: InputDecoration(labelText: 'Full Name'),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your full name';
//                   }
//                   return null;
//                 },
//               ),
//               TextFormField(
//                 controller: _emailController,
//                 decoration: InputDecoration(labelText: 'Email'),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your email';
//                   }
//                   return null;
//                 },
//               ),
//               TextFormField(
//                 controller: _passwordController,
//                 decoration: InputDecoration(labelText: 'Password'),
//                 obscureText: true,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter a password';
//                   }
//                   return null;
//                 },
//               ),
//               DropdownButtonFormField(
//                 value: 'Student',
//                 onChanged: (value) {
//                   setState(() {
//                     _roleController.text = value.toString();
//                   });
//                 },
//                 items: ['Student', 'Instructor']
//                     .map<DropdownMenuItem<String>>((String value) {
//                   return DropdownMenuItem<String>(
//                     value: value,
//                     child: Text(value),
//                   );
//                 }).toList(),
//                 decoration: InputDecoration(
//                     labelText: 'Are you Student or Instructor?'),
//               ),
//               const SizedBox(height: 15),
//               TextButton(
//                 onPressed: () async {
//                   await _getImage();
//                 },
//                 child: Text(
//                   'Profile Picture',
//                   style: TextStyle(
//                     color: Color.fromARGB(255, 45, 40, 40),
//                   ),
//                 ),
//               ),
//               _selectedImage != null
//                   ? Image.file(
//                       _selectedImage!,
//                       height: 100,
//                     )
//                   : Container(),
//               TextFormField(
//                 controller: _birthdateController,
//                 decoration: InputDecoration(labelText: 'Birthdate'),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your birthdate';
//                   }
//                   return null;
//                 },
//                 onTap: () async {
//                   DateTime? selectedDate = await showDatePicker(
//                     context: context,
//                     initialDate: DateTime.now(),
//                     firstDate: DateTime(1900),
//                     lastDate: DateTime.now(),
//                   );

//                   if (selectedDate != null) {
//                     _birthdateController.text =
//                         selectedDate.toIso8601String().split('T')[0];
//                   }
//                 },
//               ),
//               SizedBox(height: 16.0),
//               Center(
//                 child: ElevatedButton(
//                   onPressed: () {
//                     if (_formKey.currentState!.validate()) {
//                       _signup();
//                     }
//                   },
//                   child: Text(
//                     'Sign Up',
//                     style: TextStyle(color: Colors.black),
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
