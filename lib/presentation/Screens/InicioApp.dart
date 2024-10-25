// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

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
  final List<Gradient> _gradients = [
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: _gradients[_currentPage],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 80,),
            _buildAnimatedLogo('assets/BancoFinandina/Logo.svg'),
            Expanded(
              child: PageView(
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
                  // Puedes agregar más páginas con diferente contenido aquí
                ],
              ),
            ),
            if (_currentPage < 5)
              Container(
                margin: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(29, 255, 255, 255),
                  borderRadius: BorderRadius.circular(120),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          _pageController.jumpToPage(6);
                        },
                        child: const Text(
                          'Saltar',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                      SmoothPageIndicator(
                        controller: _pageController,
                        count: 6, // Cambia al número de páginas que tienes
                        effect: const ExpandingDotsEffect(
                          activeDotColor: Colors.white,
                          dotColor: Colors.white54,
                          dotHeight: 12,
                          dotWidth: 12,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (_currentPage < 5) {
                            _pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.linearToEaseOut,
                            );
                          } else {
                            // Acción para continuar después del carrusel
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                          padding: const EdgeInsets.all(14),
                          backgroundColor: Colors.white, // Fondo blanco
                        ),
                        child: const Icon(
                          Icons.arrow_forward_rounded,
                          size: 35,
                          color: Color.fromARGB(
                              255, 255, 0, 17), // Color del ícono
                        ),
                      ),
                    ],
                  ),
                ),
              )
            else if (_currentPage == 5)
              Container(
                margin: const EdgeInsets.all(20),
                child: Padding(
                  padding: const EdgeInsets.all(6),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12), // Aumenta el espacio vertical
                      minimumSize: const Size(double.infinity,
                          60), // Aumenta el alto mínimo del botón
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(30), // Bordes redondeados
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        'Libera tu banca',
                        style: TextStyle(
                          color: Color.fromARGB(255, 120, 64, 251),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              )
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
            Image.asset(imageUrl),
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
          padding: const EdgeInsets.only(top: 200, right: 40, left: 40),
          child: Image.asset(imageUrl!),
        ),
      ],
    );
  }
}
