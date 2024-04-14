import 'package:flutter/material.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(AddressBookApp());
}

class AddressBookApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Address Book',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
    );
  }
}
