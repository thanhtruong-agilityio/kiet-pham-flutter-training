import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool loggedIn = false;
  String? name;
  String? email;
  String? phoneNumber;

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: SafeArea(
          child: Center(
        child: loggedIn ? _buildSuccess() : _buildLoginForm(),
      )),
    );
  }

  Widget _buildSuccess() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(Icons.check, color: Colors.orangeAccent),
        Text('Hi $name'),
        Text('Email: $email'),
        Text("Phone: $phoneNumber")
      ],
    );
  }

  Widget _buildLoginForm() {
    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(labelText: "Runner"),
              validator: (text) =>
                  text!.isEmpty ? "Enter the runner's name" : null,
            ),
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(labelText: "Email"),
              validator: (text) {
                if (text!.isEmpty) {
                  return 'Enter the runner\'s email.';
                }
                final regex = RegExp('[^@]+@[^\.]+\..+');
                if (!regex.hasMatch(text)) {
                  return 'Enter a valid email';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _phoneNumberController,
              decoration: InputDecoration(labelText: "Phone Number"),
              validator: (number) =>
                  number!.isEmpty ? "Enter the runner's phone number" : null,
              keyboardType: TextInputType.numberWithOptions(),
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: _validate, child: Text("Continue"))
          ],
        ),
      ),
    );
  }

  void _validate() {
    final form = _formKey.currentState;
    if (!form!.validate()) {
      return;
    }

    setState(() {
      loggedIn = true;
      name = _nameController.text;
      email = _emailController.text;
      phoneNumber = _phoneNumberController.text;
    });
  }
}
