import 'package:comida_app_rosa/model/comida.dart';
import 'package:comida_app_rosa/screens/detalle_comida.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ListaBusqueda extends StatelessWidget {
  const ListaBusqueda({super.key, required this.resultadosBusqueda});
  final List<Comida> resultadosBusqueda;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: resultadosBusqueda.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetalleComida(
                    comidaActual: resultadosBusqueda[index],
                  ),
                ));
          },
          child: Card(
            margin: const EdgeInsets.all(0.0),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(resultadosBusqueda[index].imagen),
                backgroundColor:
                    const Color.fromARGB(255, 190, 61, 89).withOpacity(0.5),
              ),
              title: Text(
                resultadosBusqueda[index].nombre,
                style: GoogleFonts.outfit(),
              ),
              trailing: Text(
                '${resultadosBusqueda[index].precio}\$',
                style: GoogleFonts.outfit(
                    color: const Color.fromARGB(255, 255, 103, 136),
                    fontWeight: FontWeight.bold,
                    fontSize: 14),
              ),
            ),
          ),
        );
      },
    );
  }
}
