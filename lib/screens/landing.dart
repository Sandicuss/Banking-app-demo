import 'dart:ui';
import 'package:cobro/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cobro/screens/empezar.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  void navigateToEmpezar(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const Empezar(),
      ),
    );
  }

  void navigateToLogin(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const Login(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //background image
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/cobro_background.jpg'),
          fit: BoxFit.cover,
        ),
      ),

      //sizedbox
      child: Column(
        children: [
          const SizedBox(
            height: 120,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(4, 300, 4, 0),
              child: ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: Container(
                    width: double.infinity,
                    height: 300,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(109, 78, 217, 230),
                      border: Border.all(
                        color: const Color.fromARGB(255, 78, 217, 230),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        Text(
                          '¿3 cuotas sin interés?',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.lato(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.none,
                          ),
                        ),
                        Text('Cobro te endeuda',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.lato(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.none)),
                        const SizedBox(
                          height: 30,
                        ),
                        const Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                          child: Text(
                              'Accede a una tarjeta de credito de manera sencilla y todo desde tu celular.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                decoration: TextDecoration.none,
                              )),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            navigateToEmpezar(context);
                          },
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              backgroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 120,
                                vertical: 18,
                              )),
                          child: const Text(
                            'Empezar',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextButton(
                          onPressed: () {
                            navigateToLogin(context);
                          },
                          child: const Text(
                            'Ya tengo una cuenta Cobro',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const Text('Powered by DNE',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                decoration: TextDecoration.none,
                fontWeight: FontWeight.bold,
              ))
        ],
      ),
    );
  }
}