import 'package:cobro/screens/password.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:email_validator/email_validator.dart';

class Empezar extends StatefulWidget {
  const Empezar({super.key});

  @override
  State<Empezar> createState() => _EmpezarState();
}

class _EmpezarState extends State<Empezar> {
  bool _isEmailValid = false;
  String invalidEmail = 'Correo no válido';
  String userEmail = '';

  bool validateEmail(String email) {
    return EmailValidator.validate(email);
  }

  void navigateToPassword(BuildContext context, String userEmail) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Password(userEmail : userEmail),
      ),
    );
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '¿Cuál es tu correo electrónico?',
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
                    'Escribe el correo electrónico con el que quisieras crear tu cuenta.',
                    style: TextStyle(fontSize: 14),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      label: const Text('Correo electrónico'),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        _isEmailValid = validateEmail(value);
                        if (_isEmailValid) {
                          invalidEmail = '';
                          userEmail = value;
                        } else {
                          invalidEmail = 'Correo no válido';
                        }
                      });
                    },
                    keyboardType: TextInputType.emailAddress,
                  ),
                  Text(
                    invalidEmail,
                    style: GoogleFonts.lato(
                      color: Colors.red,
                    ),
                  ),
                  const SizedBox(
                    height: 330,
                  ),
                  
                ],
              ),
              ElevatedButton(
                    onPressed: () {
                      navigateToPassword(context, userEmail);
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      backgroundColor: _isEmailValid
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
        ),
      ),
    );
  }
}