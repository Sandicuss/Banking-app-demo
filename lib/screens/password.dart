// ignore_for_file: use_build_context_synchronously

import 'package:cobro/screens/landing.dart';
import 'package:cobro/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Password extends StatefulWidget {
  final String userEmail;
  const Password({Key? key, required this.userEmail}) : super(key: key);

  @override
  State<Password> createState() => _PasswordState();
}

class _PasswordState extends State<Password> {
  bool _obscureText = true;
  bool _obscureText2 = true;
  int passLength = 0;
  bool _hasNumber = false;
  bool _hasSpecialChar = false;
  String _inputPassword = '';
  bool _samePassword = false;
  String userPassword = '';
  

  void navigateToLogin(BuildContext context) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => const LandingScreen()),
  );
  
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const Login()),
  );
}



  Future<void> sendDataToFirebase(String userEmail, String password) async {
    Map<String, dynamic> data = {
      'userEmail': widget.userEmail,
      'password': userPassword,
    };

    try {
      final response = await http.post(
        Uri.parse('https://cobro-7f2dd-default-rtdb.firebaseio.com/users/${Uri.encodeComponent(widget.userEmail.replaceAll('.', ','))}.json'),
        body: jsonEncode(data),
      );

      // Check the response status
      if (response.statusCode == 200) {
        // Data saved successfully
        


        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Data saved to Firebase'),
            backgroundColor: Color.fromARGB(205, 20, 139, 9),
          ),
        );
        navigateToLogin(context);
      } else {
        // Error occurred

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Error saving data'),
            backgroundColor: Color.fromARGB(184, 166, 15, 15),
          ),
        );
      }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Error saving data'),
        backgroundColor: Color.fromARGB(184, 166, 15, 15),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Container(
            margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
            decoration: BoxDecoration(
              border: Border.all(
                width: 3,
                color: const Color.fromARGB(255, 78, 217, 230),
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: SizedBox(
              width: 40, // Set the width to maintain a square shape
              height: 40, // Set the height to maintain a square shape
              child: IconButton(
                icon: Transform.translate(
                  offset: const Offset(
                      0, -4), // Adjust the offset to move the icon up
                  child: const Icon(Icons.arrow_back_ios),
                ),
                color: Colors.black,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Crea tu contraseña',
                  textAlign: TextAlign.left,
                  style: GoogleFonts.lato(
                    color: Colors.black,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.none,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Tu contraseña debe tener por lo menos un número y un carácter especial.',
                  style: TextStyle(fontSize: 14),
                ),
                const SizedBox(
                  height: 40,
                ),
                TextField(
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                    label: const Text('Contaseña'),
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                      child: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onChanged: (val) {
                    setState(() {
                      passLength = val.length;
                      _hasNumber = RegExp(r'\d').hasMatch(val);
                      _hasSpecialChar =
                          RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(val);
                      _inputPassword = val;
                    });
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Icon(
                      passLength >= 8 ? Icons.check_circle : Icons.cancel,
                      color: passLength >= 8 ? Colors.green : Colors.red,
                    ),
                    const SizedBox(width: 8),
                    const Text('Minimum 8 characters'),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Icon(
                      _hasNumber ? Icons.check_circle : Icons.cancel,
                      color: _hasNumber ? Colors.green : Colors.red,
                    ),
                    const SizedBox(width: 8),
                    const Text('At least 1 number'),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Icon(
                      _hasSpecialChar ? Icons.check_circle : Icons.cancel,
                      color: _hasSpecialChar ? Colors.green : Colors.red,
                    ),
                    const SizedBox(width: 8),
                    const Text('At least 1 special character'),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
    
                //8 caracteres
                //debe tener un numero
                //debe tener un caracter especial
    
                TextField(
                  obscureText: _obscureText2,
                  decoration: InputDecoration(
                    label: const Text('Confirma tu contaseña'),
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          _obscureText2 = !_obscureText2;
                        });
                      },
                      child: Icon(
                        _obscureText2 ? Icons.visibility_off : Icons.visibility,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onChanged: (val) {
                    setState(() {
                      if (_inputPassword == val) {
                        _samePassword = true;
                        userPassword = val;
                      } else {
                        _samePassword = false;
                      }
                    });
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Icon(
                      _samePassword ? Icons.check_circle : Icons.cancel,
                      color: _samePassword ? Colors.green : Colors.red,
                    ),
                    const SizedBox(width: 8),
                    const Text('Contraseña confirmada.'),
                  ],
                ),
    
                const SizedBox(
                  height: 120,
                ),
                ElevatedButton(
                  onPressed: () {
                    sendDataToFirebase(widget.userEmail, userPassword);
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    backgroundColor: _samePassword ? const Color.fromARGB(255, 78, 217, 230) : const Color.fromARGB(255, 15, 52, 55),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 124,
                      vertical: 20,
                    ),
                  ),
                  child: Text(
                    'Continuar',
                    style: GoogleFonts.lato(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }
}
