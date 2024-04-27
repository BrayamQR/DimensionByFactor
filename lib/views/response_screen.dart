import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../models/criterio.dart';

class ResponseScreem extends StatelessWidget {
  final List<Criterio> lstCriterio;
  final int factor;
  ResponseScreem({
    required this.lstCriterio,
    required this.factor,
  });

  @override
  Widget build(BuildContext context) {
    List<Criterio> criteriosSeleccionados =
        lstCriterio.where((criterio) => criterio.ischecked).toList();
    List<Criterio> criteriosNoSeleccionados =
        lstCriterio.where((criterio) => !criterio.ischecked).toList();
    String msg;
    Widget img;
    Color color;
    if (criteriosSeleccionados.isEmpty) {
      msg = "¡No logrado!";
      img = Lottie.asset(
        'assets/animations/sad.json', // Ruta de tu archivo de animación Lottie
        width: 200,
        height: 200,
        fit: BoxFit.cover,
      );
      color = Colors.red;
    } else if (criteriosNoSeleccionados.isEmpty) {
      msg = "¡Logrado plenamente!";
      img = Lottie.asset(
        'assets/animations/congratulation.json', // Ruta de tu archivo de animación Lottie
        width: 200,
        height: 200,
        fit: BoxFit.cover,
      );
      color = Colors.green;
    } else {
      msg = "¡Logrado!";
      img = Lottie.asset(
        'assets/animations/happy.json', // Ruta de tu archivo de animación Lottie
        width: 200,
        height: 200,
        fit: BoxFit.cover,
      );
      color = Colors.blueAccent;
    }
    return Scaffold(
      backgroundColor: Color(0xFFECEAF4),
      appBar: AppBar(
        title: Text(
          AddTitleNav(factor),
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            img,
            SizedBox(height: 20),
            Text(
              msg,
              style: TextStyle(
                  fontSize: 24, fontWeight: FontWeight.bold, color: color),
            ),
            SizedBox(height: 30),
            MaterialButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Padding(
                padding: EdgeInsets.all(18),
                child: Text(
                  "Volver",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
              color: Colors.indigo,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
            )
          ],
        ),
      ),
    );
  }

  String AddTitleNav(int factor) {
    String titleNav = "";
    if (factor == 1) {
      titleNav = "Syllabus planning";
    } else if (factor == 2) {
      titleNav = "Management of the graduate profile";
    } else if (factor == 3) {
      titleNav = "Quality assurance";
    } else if (factor == 4) {
      titleNav = "Teaching-learning process";
    } else if (factor == 5) {
      titleNav = "Teacher management";
    } else if (factor == 6) {
      titleNav = "Student follow-up";
    } else if (factor == 7) {
      titleNav = "Research and innovation";
    } else if (factor == 8) {
      titleNav = "University social responsibility";
    } else if (factor == 9) {
      titleNav = "Wellness services";
    } else if (factor == 10) {
      titleNav = "Infrastructure and support";
    } else if (factor == 11) {
      titleNav = "Human Resources";
    } else if (factor == 12) {
      titleNav = "Verification of the graduate profile";
    }
    return titleNav;
  }
}
