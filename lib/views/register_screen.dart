import 'package:flutter/material.dart';

import '../widgets/custom_text_field.dart';

class register_screen extends StatefulWidget {
  register_screen({super.key});

  @override
  State<register_screen> createState() => _register_screenState();
}

class _register_screenState extends State<register_screen> {
  final _formkey = GlobalKey<FormState>();

  final _emailcontroller = TextEditingController();

  final _passwordcontroller = TextEditingController();

  final _confirmpasswordcontroller = TextEditingController();
  final _phonenumbercontroller = TextEditingController();

  final _adrisscontroller = TextEditingController();
  bool see = true;
  bool second_see = true;

  String? check_valedate() {}

  String? _validateemail(String? value) {
    if (value == null || value.isEmpty) {
      return "Email is required";
    }
    final emailregex = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

    if (!emailregex.hasMatch(value)) {
      return "Unvalid email formate";
    } else
      return null;
  }

  String? _VALIDATEPASSWORD(String? pass) {
    if (pass == null || pass.isEmpty) {
      return "password is required";
    }
    if (pass.length < 8) {
      return "password must be at least 8 characters";
    }
    if (pass.contains(RegExp(r'[A-Z]')) == false) {
      return "password must contain at least one uppercase letter";
    }

    return null;
  }

  String? _validateconfirmpassword(String? pass) {
    if (pass != _passwordcontroller.text) {
      return "password does not match";
    }
  }

  String? _validatephone(String? phone) {
    if (phone == null || phone.isEmpty) {
      return "phone number is required";
    }
    if (phone.length != 11) {
      return "phone number must be 11 digits";
    } else
      return null;
  }

  String? _validateadriss(String? adriss) {
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            custom_field(
              controller: _emailcontroller,
              validator: _validateemail,
              hintText: 'Email',
              prefixIcon: Icon(Icons.mail_outlined),
              obscureText: false,
            ),
            SizedBox(
              height: 20,
            ),
            custom_field(
              controller: _passwordcontroller,
              validator: _VALIDATEPASSWORD,
              hintText: 'paswword',
              obscureText: see,
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    see = !see;
                  });
                },
                icon: see ? Icon(Icons.visibility_off) : Icon(Icons.visibility),
              ),
              prefixIcon: Icon(Icons.lock_outlined),
            ),
            SizedBox(
              height: 20,
            ),
            custom_field(
              controller: _confirmpasswordcontroller,
              validator: _validateconfirmpassword,
              hintText: 'confirmpassword',
              obscureText: second_see,
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    second_see = !second_see;
                  });
                },
                icon: second_see
                    ? Icon(Icons.visibility_off)
                    : Icon(Icons.visibility),
              ),
              prefixIcon: Icon(Icons.lock_outlined),
            ),
            SizedBox(
              height: 20,
            ),
            custom_field(
              controller: _phonenumbercontroller,
              validator: _validatephone,
              hintText: 'Phone number',
              prefixIcon: Icon(Icons.phone),
              obscureText: false,
            ),
            SizedBox(
              height: 20,
            ),
            custom_field(
              controller: _adrisscontroller,
              validator: _validateadriss,
              hintText: 'Adriss',
              prefixIcon: Icon(Icons.home_rounded),
              obscureText: false,
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 270),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 46, 71, 94),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  onPressed: () {
                    if (_formkey.currentState?.validate() ?? false) {
                      print("validate");
                    }
                  },
                  child: Text(
                      style: TextStyle(color: Colors.white), "  sign up  ")),
            ),
          ],
        ),
      ),
    );
  }
}
