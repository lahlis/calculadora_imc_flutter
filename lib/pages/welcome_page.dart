import 'package:bmicalculator/database/dao/bmi_dao.dart';
import 'package:flutter/material.dart';

import 'data_page.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({
    super.key,
    required this.bmiDao,
  });

  final BmiDao bmiDao;

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  var nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 240, 240, 221),
        body: SingleChildScrollView(
          child: ConstrainedBox(
            constraints:
                BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Calculadora",
                    style: TextStyle(
                        fontFamily: "Fredoka",
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                        color: Color.fromARGB(255, 179, 96, 224))),
                const Text("IMC",
                    style: TextStyle(
                        fontFamily: "Fredoka",
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                        color: Color.fromARGB(255, 179, 96, 224))),
                Row(
                  children: [
                    Expanded(flex: 1, child: Container()),
                    Expanded(
                        flex: 3,
                        child: Image.asset('assets/images/welcome_logo.png')),
                    Expanded(flex: 1, child: Container()),
                  ],
                ),
                const SizedBox(
                  height: 100,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(),
                    ),
                    Expanded(
                      flex: 3,
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext bc) =>
                                  DataPage(bmiDao: widget.bmiDao),
                            ),
                          );
                        },
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          backgroundColor: MaterialStateProperty.all(
                              Color.fromARGB(255, 237, 113, 113)),
                        ),
                        child: const Text(
                          " Começar ",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    Expanded(flex: 1, child: Container())
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
