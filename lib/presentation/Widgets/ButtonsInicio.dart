
import 'package:flutter/material.dart';

class ButtonInicio extends StatelessWidget {
  const ButtonInicio({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}


