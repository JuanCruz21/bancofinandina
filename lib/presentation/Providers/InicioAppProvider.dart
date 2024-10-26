// ignore_for_file: file_names

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
  // Define contenido de cada página para generar widgets dinámicamente
  final List<Map<String, String>> _pagesContent = [
    {
      "complemento": "Con ",
      "title": "Banco Finandina",
      "subtitle": "tienes el poder de ser libre",
      "imageUrl": 'assets/BancoFinandina/Texto.png',
    },
    {
      "title": "Tus productos a la mano",
      "imageUrl": 'assets/BancoFinandina/Pantalla1.png',
      "subtitle":
          "Adminístralos libremente desde cualquier lugar, fácil y rápido.",
    },
    {
      "title": "Paga libremente",
      "imageUrl": 'assets/BancoFinandina/Pantalla2.png',
      "subtitle":
          "Puedes pagar tus productos, recibos y facturas en cualquier momento y lugar.",
    },
    {
      "title": "Envía dinero",
      "imageUrl": 'assets/BancoFinandina/Pantalla3.png',
      "subtitle":
          "Pasa plata libremente y sin costo a cualquier cuenta bancaria o celular en Colombia.",
    },
    {
      "title": "Tu banco donde quieras",
      "imageUrl": 'assets/BancoFinandina/Pantalla4.png',
      "subtitle":
          "La oficina más cercana es tu celular. Libérate de las filas y los trámites largos.",
    },
    {
      "title": "¡Escanea y listo!",
      "imageUrl": 'assets/BancoFinandina/Pantalla5.png',
      "subtitle":
          "Paga en datáfonos con QR y libérate de las tarjetas físicas.",
    },
    // Añadir más páginas aquí...
  ];
  Gradient changeGradient(int index) {
    notifyListeners();
    return gradients[index];
  }

  List<Map<String, String>> get pagesContent => _pagesContent;
}
