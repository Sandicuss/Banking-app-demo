import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key});

  @override
  State<MainScreen> createState() => _MainScreen();
}

class _MainScreen extends State<MainScreen> {
  bool _isObscured = false;
  void _incrementCounter(int counter) {
    setState(() {
      counter++;
    });
  }

  Widget myAppBarIcon() {
    return Container(
      alignment: Alignment.topRight,
      width: 30,
      height: 30,
      child: const Stack(
        children: [
          Icon(
            Icons.notifications_none,
            color: Colors.black,
            size: 30,
          ),
          /* Container(
            width: 30,
            height: 30,
            alignment: Alignment.topRight,
            margin: const EdgeInsets.only(top: 5),
            child: Container(
              width: 15,
              height: 15,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                border: Border.all(color: Colors.white, width: 1),
              ),
              child: const Padding(
                padding: EdgeInsets.all(0.0),
              ),
            ),
          ), */
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,

          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(
              Icons.account_circle,
              color: Colors.grey,
              size: 38,
            ),
            const SizedBox(width: 8),
            Text(
              '¡Hola!',
              style: GoogleFonts.lato(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 180),
            myAppBarIcon(),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 250,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage('assets/images/green_bubbles.png'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                Positioned.fill(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                    child: Container(
                      width: double.infinity,
                      height: 300,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(36, 78, 217, 230),
                        border: Border.all(
                          color: Colors.white,
                          width: 0,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          /*  const SizedBox(
                            width: 20,
                          ), */
                          Text(
                            '.... .... ....',
                            style: GoogleFonts.lato(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          /*  const SizedBox(
                            width: 240,
                          ), */
                          Container(
                            width: 40,
                            height: 40,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/presto_iconn.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    const Row(
                      children: [
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          'SALDO DISPONIBLE',
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          /* const SizedBox(width: 15), */
                          Text(
                            _isObscured ? 'Bs. 420' : 'Bs. ****',
                            style: GoogleFonts.lato(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          /* const SizedBox(width: 200), */
                          IconButton(
                            icon: _isObscured
                                ? const Icon(Icons.visibility)
                                : const Icon(Icons.visibility_off),
                            onPressed: () {
                              setState(
                                () {
                                  _isObscured = !_isObscured;
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          /* const SizedBox(
                            width: 20,
                          ), */
                          Container(
                            width: 325,
                            child: const LinearProgressIndicator(
                              value: 0.7,
                              backgroundColor: Colors.grey,
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          /* const SizedBox(
                            width: 20,
                          ), */
                          const Text(
                            'Proxima fecha de pago 23-06-2023',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          /*  const SizedBox(
                            width: 90,
                          ), */
                          Container(
                            width: 40,
                            height: 20,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image:
                                    AssetImage('assets/images/visa_icon.png'),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  print('sexo');
                },
                child: Container(
                  width: 90,
                  height: 70,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 173, 243, 250),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.calculate_outlined),
                      Text(
                        'Calculadora',
                        style: GoogleFonts.lato(
                          color: const Color.fromARGB(255, 33, 123, 132),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  print('sexo');
                },
                child: Container(
                  width: 90,
                  height: 70,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 173, 243, 250),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(MdiIcons.cashMultiple),
                      Text(
                        'Pagar',
                        style: GoogleFonts.lato(
                          color: const Color.fromARGB(255, 33, 123, 132),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  print('sexo');
                },
                child: Container(
                  width: 90,
                  height: 70,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 173, 243, 250),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(MdiIcons.clipboardClockOutline),
                      Text(
                        'Historial',
                        style: GoogleFonts.lato(
                          color: const Color.fromARGB(255, 33, 123, 132),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  print('sexo');
                },
                child: Container(
                  width: 90,
                  height: 70,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 173, 243, 250),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(MdiIcons.web),
                      Text(
                        'Habilitar',
                        style: GoogleFonts.lato(
                          color: const Color.fromARGB(255, 33, 123, 132),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                height: 300,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          /* const SizedBox(
                      width: 12,
                    ), */
                          Text(
                            'Ultimas 4 transacciones',
                            style: GoogleFonts.lato(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          /* const SizedBox(
                      width: 135,
                    ), */
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Ver todo',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Color.fromARGB(255, 49, 142, 151),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(12, 0, 10, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Intereses por Consumos',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'lol-xd-2023',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          Text('Bs. 0.00'),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Divider(
                      color: Colors.grey,
                      thickness: 2,
                      height: 1,
                      indent: 12,
                      endIndent: 5,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(12, 0, 10, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Consumos',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'lol-xd-2023',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          Text('Bs. 0.00'),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Divider(
                      color: Colors.grey,
                      thickness: 2,
                      height: 1,
                      indent: 12,
                      endIndent: 5,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(12, 0, 10, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Intereses por Consumos',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'lol-xd-2023',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          Text('Bs. 0.00'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {},
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(MdiIcons.creditCardOutline),
            label: 'Mi Tarjeta',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Mi Perfil',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.headset_mic_outlined),
            label: 'Ayuda',
          ),
        ],
      ),
    );
  }
}
