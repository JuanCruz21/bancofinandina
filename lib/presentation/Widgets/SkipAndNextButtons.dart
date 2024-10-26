// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SkipAndNextButtons extends StatelessWidget {
  const SkipAndNextButtons({
    super.key,
    required PageController pageController,
    required int currentPage,
  })  : _pageController = pageController,
        _currentPage = currentPage;

  final PageController _pageController;
  final int _currentPage;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color.fromARGB(29, 255, 255, 255),
        borderRadius: BorderRadius.circular(120),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
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
                color: Color.fromARGB(255, 255, 0, 17), // Color del ícono
              ),
            ),
          ],
        ),
      ),
    );
  }
}
