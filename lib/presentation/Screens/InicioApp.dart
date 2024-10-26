// ignore_for_file: file_names

import 'package:bancofinandina/presentation/Providers/InicioAppProvider.dart';
import 'package:bancofinandina/presentation/Widgets/ButtonsInicio.dart';
import 'package:bancofinandina/presentation/Widgets/SkipAndNextButtons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class InicioApp extends StatefulWidget {
  const InicioApp({super.key});

  @override
  OnboardingAppState createState() => OnboardingAppState();
}

class OnboardingAppState extends State<InicioApp> {
  bool _isLogoSmall = false;
  final PageController _pageController = PageController();
  int _currentPage = 0;
  //Cambiado de gradientes dependiendo de la pagina

  @override
  Widget build(BuildContext context) {
    final gradientes = InicioAppProvider();
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: gradientes.changeGradient(_currentPage),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 70,
            ),
            _buildAnimatedLogo('assets/BancoFinandina/Logo.svg'),
            Expanded(
              child: PageView(
                physics: const ScrollPhysics(parent: BouncingScrollPhysics()),
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                children: [
                  _buildPage(
                    logoUrl: 'assets/BancoFinandina/Logo.svg',
                    complemento: "Con ",
                    title: "Banco Finandina", // Cambia por tu imagen
                    subtitle: "tienes el poder de ser libre",
                    imageUrl: 'assets/BancoFinandina/Texto.png',
                  ),
                  //Paginas con misma estructura
                  _buildPages(
                    logoUrl:
                        'assets/BancoFinandina/Logo.svg', // Cambia por tu imagen
                    title: "Tus productos a la mano",
                    imageUrl: 'assets/BancoFinandina/Pantalla1.png',
                    subtitle:
                        "Adminístralos libremente desde cualquier lugar, fácil y rápido.",
                  ),
                  _buildPages(
                    logoUrl:
                        'assets/BancoFinandina/Logo.svg', // Cambia por tu imagen
                    title: "Paga libremente",
                    imageUrl:
                        'assets/BancoFinandina/Pantalla2.png', // Cambia por tu imagen
                    subtitle:
                        "Puedes pagar tus productos, recibos y facturas en cualquier momento y lugar.",
                  ),
                  _buildPages(
                    logoUrl:
                        'assets/BancoFinandina/Logo.svg', // Cambia por tu imagen
                    title: "Envía dinero",
                    imageUrl:
                        'assets/BancoFinandina/Pantalla3.png', // Cambia por tu imagen
                    subtitle:
                        "Pasa plata libremente y sin costo a cualquier cuenta bancaria o celular en Colombia.",
                  ),
                  _buildPages(
                    logoUrl:
                        'assets/BancoFinandina/Logo.svg', // Cambia por tu imagen
                    title: "Tu banco donde quieras",
                    imageUrl:
                        'assets/BancoFinandina/Pantalla4.png', // Cambia por tu imagen
                    subtitle:
                        "La oficina más cercana es tu celular. Libérate de las filas y los trámites largos.",
                  ),
                  _buildPages(
                    logoUrl:
                        'assets/BancoFinandina/Logo.svg', // Cambia por tu imagen
                    title: "¡Escanea y listo!",
                    imageUrl:
                        'assets/BancoFinandina/Pantalla5.png', // Cambia por tu imagen
                    subtitle:
                        "Paga en datáfonos con QR y libérate de las tarjetas físicas.",
                  ),
                ],
              ),
            ),
            if (_currentPage < 5)
              SkipAndNextButtons(pageController: _pageController, currentPage: _currentPage)
            else if (_currentPage == 5)
              const ButtonInicio()
          ],
        ),
      ),
    );
  }

  Widget _buildPages({
    required String logoUrl,
    required String title,
    required String subtitle,
    required String imageUrl,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            _currentPage == 3 || _currentPage == 5
              ? Image.asset(imageUrl)
              : Padding(
                  padding: const EdgeInsets.all(20),
                  child: Image.asset(imageUrl),
                ),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                subtitle,
                style: const TextStyle(
                  fontWeight: FontWeight.normal,
                  color: Colors.white,
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ],
    );
  }

  Widget _buildAnimatedLogo(String logoUrl) {
    if (_currentPage == 0) {
      _isLogoSmall = false;
    } else {
      _isLogoSmall = true;
    }
    return AnimatedAlign(
      curve: Curves.linear,
      duration: const Duration(milliseconds: 300),
      alignment: _isLogoSmall ? Alignment.topCenter : Alignment.center,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: _isLogoSmall ? 50 : 200, // Cambia el tamaño del logo
        child: SvgPicture.asset(logoUrl),
      ),
    );
  }

  Widget _buildPage(
      {required String logoUrl,
      required String title,
      required String subtitle,
      String? imageUrl,
      required String complemento}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    complemento,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 34,
                    ),
                  ),
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              subtitle,
              style: const TextStyle(
                fontWeight: FontWeight.normal,
                color: Color.fromARGB(255, 255, 255, 255),
                fontSize: 32,
              ),
              textAlign: TextAlign.center,
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 150, right: 40, left: 40, bottom: 20),
          child: Image.asset(imageUrl!),
        ),
      ],
    );
  }
}
