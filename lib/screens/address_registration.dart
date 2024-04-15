import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'options_menu.dart';

class AddressRegistrationFrame extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _addressTitleController = TextEditingController();
  final TextEditingController _contactPersonNameController =
      TextEditingController();
  final TextEditingController _contactPersonPhoneController =
      TextEditingController();
  final TextEditingController _addressLine1Controller = TextEditingController();
  final TextEditingController _addressLine2Controller = TextEditingController();
  final TextEditingController _addressLine3Controller = TextEditingController();
  final TextEditingController _pincodeController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register Address'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 249, 183, 251),
              Color.fromARGB(255, 246, 235, 255)
            ],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _addressTitleController,
                    decoration: InputDecoration(
                      labelText: 'Address Title*',
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 16.0),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter Address Title';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _contactPersonNameController,
                    decoration: InputDecoration(
                      labelText: 'Contact Person Name*',
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 16.0),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter Contact Person Name';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _contactPersonPhoneController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      labelText: 'Contact Person Phone Number*',
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 16.0),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter Contact Person Phone Number';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _addressLine1Controller,
                    decoration: InputDecoration(
                      labelText: 'Address Line 1*',
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 16.0),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter Address Line 1';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _addressLine2Controller,
                    decoration: InputDecoration(
                      labelText: 'Address Line 2',
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 16.0),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _addressLine3Controller,
                    decoration: InputDecoration(
                      labelText: 'Address Line 3',
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 16.0),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _pincodeController,
                    decoration: InputDecoration(
                      labelText: 'Pincode*',
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 16.0),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter Pincode';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _cityController,
                    decoration: InputDecoration(
                      labelText: 'City*',
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 16.0),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter City';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _stateController,
                    decoration: InputDecoration(
                      labelText: 'State*',
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 16.0),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter State';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _countryController,
                    decoration: InputDecoration(
                      labelText: 'Country*',
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 16.0),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter Country';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _registerAddress(context);
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Color.fromARGB(
                              255, 250, 250, 250)), // Background color
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              10.0), // Button border radius
                        ),
                      ),
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                        EdgeInsets.symmetric(
                            vertical: 12.0, horizontal: 16.0), // Button padding
                      ),
                    ),
                    child: Text(
                      'REGISTER',
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _registerAddress(BuildContext context) async {
    // Retrieve values from text controllers
    String addressTitle = _addressTitleController.text;
    String contactPersonName = _contactPersonNameController.text;
    String contactPersonPhone = _contactPersonPhoneController.text;
    String addressLine1 = _addressLine1Controller.text;
    String addressLine2 = _addressLine2Controller.text;
    String addressLine3 = _addressLine3Controller.text;
    String pincode = _pincodeController.text;
    String city = _cityController.text;
    String state = _stateController.text;
    String country = _countryController.text;

    // Make API call
    var url =
        Uri.parse('http://192.168.56.1/registerAddressAPI/api.php/register');
    var response = await http.post(url, body: {
      'addressTitle': addressTitle,
      'contactPersonName': contactPersonName,
      'contactPersonNumber': contactPersonPhone,
      'addressLine1': addressLine1,
      'addressLine2': addressLine2,
      'addressLine3': addressLine3,
      'pincode': pincode,
      'city': city,
      'state': state,
      'country': country,
    });

    if (response.statusCode == 200) {
      // Successful registration
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Registration successful'),
        ),
      );
      Future.delayed(Duration(seconds: 2), () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => OptionsMenuFrame()),
        );
      });
    } else {
      // Failed registration
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Registration Failed'),
            content: Text('Failed to register address. Please try again.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }
}
