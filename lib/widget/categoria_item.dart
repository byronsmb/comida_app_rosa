import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoriaItem extends StatelessWidget {
  const CategoriaItem(
      {super.key,
      required this.imagenUrl,
      required this.titulo,
      required this.index,
      required this.isSelected,
      required this.onTap});

  final String imagenUrl;
  final String titulo;
  final int index;
  final bool isSelected;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(index),
      child: Card(
        //color: Colors.white,
        shadowColor:
            isSelected ? const Color.fromARGB(255, 255, 0, 55) : Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(27),
          // Establece el radio de la esquina deseado
        ),
        elevation: 4,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(27),
            border: Border.all(
                color: isSelected ? Colors.red : Colors.black26, width: 2),
          ),
          height: 80,
          width: 120,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                imagenUrl,
                height: 40,
                color: isSelected
                    ? const Color.fromARGB(255, 255, 0, 55)
                    : Colors.black26,
              ),
              Text(
                titulo,
                style: GoogleFonts.outfit(
                  color: isSelected
                      ? const Color.fromARGB(255, 255, 0, 55)
                      : Colors.black26,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
