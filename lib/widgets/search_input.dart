import 'package:flutter/material.dart';
import 'package:nubank_clone/constants/app_colors.dart';

class SearchInput extends StatelessWidget {
  const SearchInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: const BoxDecoration(
          color: AppColors.labelButton, // Cor de fundo verde
          borderRadius:
              BorderRadius.all(Radius.circular(25)), // Borda com raio 15
        ),
        child: Row(
          children: const [
            Icon(
              Icons.search,
              color: Colors.black, // Cor do ícone branco
            ),
            SizedBox(width: 8), // Espaço entre o ícone e o campo de texto
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Buscar',
                  hintStyle:
                      TextStyle(color: Colors.black), // Cor do texto de dica
                  border:
                      InputBorder.none, // Remove a borda padrão do TextField
                ),
                style: TextStyle(color: Colors.black), // Cor do texto digitado
              ),
            ),
          ],
        ),
      ),
    );
  }
}
