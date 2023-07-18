enum TipoAlimento {
  hamburguesa,
  pizza,
  hotdog,
  bebida,
}

class Comida {
  const Comida({
    required this.imagen,
    required this.nombre,
    required this.precio,
    required this.tipoAlimento,
  });

  final String imagen;
  final String nombre;
  final double precio;
  final TipoAlimento tipoAlimento;
}
