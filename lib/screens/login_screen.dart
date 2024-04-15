import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'options_menu.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
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
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: 'Username',
                    border: OutlineInputBorder(),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 16.0)),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // String username = _usernameController.text;
                    // String password = _passwordController.text;

                    // if (username == 'stak' && password == 'password') {
                    //   Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => OptionsMenuFrame()),
                    //   );
                    // } else {
                    //   showDialog(
                    //     context: context,
                    //     builder: (BuildContext context) {
                    //       return AlertDialog(
                    //         title: Text('Login Failed'),
                    //         content: Text('Invalid username or password'),
                    //         actions: <Widget>[
                    //           TextButton(
                    //             onPressed: () {
                    //               Navigator.of(context).pop();
                    //             },
                    //             child: Text('OK'),
                    //           ),
                    //         ],
                    //       );
                    //     },
                    //   );
                    // }
                    _login(context);
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromARGB(255, 250, 250, 250)), // Background color
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(10.0), // Button border radius
                      ),
                    ),
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 16.0), // Button padding
                    ),
                  ),
                  child: Text(
                    'LOGIN',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _login(BuildContext context) async {
    String username = _usernameController.text;
    String password = _passwordController.text;

    // Make API call
    var url = Uri.parse('http://192.168.56.1/registerAddressAPI/api.php/login');
    var response = await http.post(url, body: {
      'username': username,
      'password': password,
    });

    if (response.statusCode == 200) {
      // Successful login
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => OptionsMenuFrame()),
      );
    } else {
      // Failed login
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Login Failed'),
            content: Text('Invalid username or password'),
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
