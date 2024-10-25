import 'package:flutter/material.dart';

class InicioAppProvider extends ChangeNotifier {
  final List<Gradient> gradients = [
    const LinearGradient(
      colors: [Color(0xFFe7192d), Color(0xFFe31952), Color(0xFF7037ce)],
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
    ),
    const LinearGradient(
      colors: [Color(0xFFe7192d), Color(0xFFe31952), Color(0xFF7037ce)],
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
    ),
    const LinearGradient(
      colors: [Color(0xFFfc4a1a), Color.fromARGB(255, 255, 103, 80)],
      begin: Alignment.bottomCenter,
      end: Alignment.bottomLeft,
    ),
    const LinearGradient(
      colors: [Color(0xFFcd34ed), Color(0xFF5b1dd4)],
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
    ),
    const LinearGradient(
      colors: [
        Color(0xFFe7192d),
        Color.fromARGB(255, 251, 51, 107),
        Color.fromARGB(255, 206, 55, 206)
      ],
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
    ),
    const LinearGradient(
      colors: [Color(0xFFcd34ed), Color(0xFF5b1dd4)],
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
    ),
    const LinearGradient(
      colors: [Color(0xFFcd34ed), Color(0xFF5b1dd4)],
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
    ),
  ];

  Gradient changeGradient(int index) {
    notifyListeners();
    return gradients[index];
  }
}
