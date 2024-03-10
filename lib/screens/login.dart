import 'package:cobro/screens/empezar.dart';
import 'package:cobro/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:email_validator/email_validator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isEmailValid = false;
  String invalidEmail = 'Correo no válido';
  int passLength = 0;
  String loginEmail = '';
  String loginPassword = '';

  



  bool validateEmail(String email) {
    return EmailValidator.validate(email);
  }

  bool _obscureText = true;

  void navigateToEmpezar(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const Empezar(),
      ),
    );
  }
  void navigateToMain(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const MainScreen(),
      ),
    );
  }

  
Future<void> getDataFromFirebase() async {
  try {
    final response = await http.get(
      Uri.parse(
          'https://cobro-7f2dd-default-rtdb.firebaseio.com/users/${Uri.encodeComponent(loginEmail.replaceAll('.', ','))}.json'),
    );

    if (response.statusCode == 200) {
      // Data retrieved successfully
      final userData = jsonDecode(response.body);
       // Extract the password and userEmail values from the userData map
      final userMap = userData.values.first;
      final password = userMap['password'];
      final userEmail = userMap['userEmail'];

         // Compare the retrieved values with the loginPassword and loginEmail
      if (password == loginPassword && userEmail == loginEmail) {
        // Password and userEmail match
        navigateToMain(context);
        print('Login successful');

      } else {
        // Password or userEmail do not match
        print('Incorrect login credentials');
      }

      // Handle the retrieved data here
      print('Retrieved data: $userData');
      
    } else {
      // Error occurred
       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Error re data'),
        backgroundColor: Color.fromARGB(184, 166, 15, 15),));
    }
  } catch (error) {
    print('Error retrieving data');
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '¡Qué bueno tenerte de vuelta!',
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
                'Inicia sesión con tu correo electrónico',
                style: TextStyle(fontSize: 14),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Correo electrónico',
                style: GoogleFonts.lato(
                  color: Colors.black,
                ),
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    _isEmailValid = validateEmail(value);
                    loginEmail = value;
                  });
                },
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Contraseña',
                style: GoogleFonts.lato(
                  color: Colors.black,
                ),
              ),
              TextField(
                obscureText: _obscureText,
                decoration: InputDecoration(
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
                    loginPassword = val;
                  });
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    '¿Olvidaste tu contraseña?',
                    style: TextStyle(
                      color: Color.fromARGB(255, 78, 217, 230),
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const SizedBox(width: 15,),
                  ElevatedButton(
                    onPressed: () {
                      getDataFromFirebase();
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      backgroundColor: _isEmailValid && (passLength > 7)
                          ? const Color.fromARGB(255, 78, 217, 230)
                          : const Color.fromARGB(255, 15, 52, 55),
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
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('¿No tienes una cuenta?'),
                  TextButton(
                    onPressed: () {
                      navigateToEmpezar(context);
                    },
                    child: const Text(
                      'Regístrate',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Color.fromARGB(255, 78, 217, 230),
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Center(child: Text('Powered by DNE', style: TextStyle(color: Colors.grey),))
            ],
          ),
        ),
      ),
    );
  }
}
