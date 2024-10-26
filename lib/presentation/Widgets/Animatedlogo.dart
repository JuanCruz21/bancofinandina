// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AnimatedLogo extends StatelessWidget {
  final bool isSmall;
  const AnimatedLogo({super.key, required this.isSmall});

  @override
  Widget build(BuildContext context) {
    return AnimatedAlign(
      curve: Curves.linear,
      duration: const Duration(milliseconds: 300),
      alignment: isSmall ? Alignment.topCenter : Alignment.center,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: isSmall ? 50 : 200,
        child: SvgPicture.asset('assets/BancoFinandina/Logo.svg'),
      ),
    );
  }
}
