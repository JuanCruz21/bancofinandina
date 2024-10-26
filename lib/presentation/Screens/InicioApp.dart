import 'package:bancofinandina/presentation/Providers/InicioAppProvider.dart';
import 'package:bancofinandina/presentation/Screens/IntroPage.dart';
import 'package:bancofinandina/presentation/Screens/Pages.dart';
import 'package:bancofinandina/presentation/Widgets/Animatedlogo.dart';
import 'package:bancofinandina/presentation/Widgets/ButtonsInicio.dart';
import 'package:bancofinandina/presentation/Widgets/SkipAndNextButtons.dart';
import 'package:flutter/material.dart';

class InicioApp extends StatefulWidget {
  const InicioApp({super.key});

  @override
  OnboardingAppState createState() => OnboardingAppState();
}

class OnboardingAppState extends State<InicioApp> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

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
            const SizedBox(height: 70),
            AnimatedLogo(isSmall: _currentPage != 0),
            Expanded(
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() => _currentPage = index);
                },
                itemCount: gradientes.pagesContent.length,
                itemBuilder: (context, index) {
                  final page = gradientes.pagesContent[index];
                  return index == 0
                      ? IntroPage(
                          complemento: page["complemento"]!,
                          title: page["title"]!,
                          subtitle: page["subtitle"]!,
                          imageUrl: page["imageUrl"]!,
                        )
                      : FeaturePage(
                          title: page["title"]!,
                          subtitle: page["subtitle"]!,
                          imageUrl: page["imageUrl"]!,
                        );
                },
              ),
            ),
            _currentPage < gradientes.pagesContent.length - 1
                ? SkipAndNextButtons(
                    pageController: _pageController,
                    currentPage: _currentPage,
                  )
                : const ButtonInicio(),
          ],
        ),
      ),
    );
  }
}
