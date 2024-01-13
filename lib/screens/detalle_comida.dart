import 'package:comida_app_rosa/model/comida.dart';
import 'package:flutter/material.dart';

class DetalleComida extends StatelessWidget {
  const DetalleComida({super.key, required this.comidaActual});
  final Comida comidaActual;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(comidaActual.nombre),
      ),
      body: Column(
        children: [
          Image.asset(comidaActual.imagen),
          Center(
            child: Text(
              comidaActual.nombre,
              style: const TextStyle(fontSize: 20),
            ),
          )
        ],
      ),
    );
  }
}
