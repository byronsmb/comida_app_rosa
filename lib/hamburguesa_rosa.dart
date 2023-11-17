import 'package:carousel_slider/carousel_slider.dart';
import 'package:comida_app_rosa/data/datos_ficticios.dart';
import 'package:comida_app_rosa/model/comida.dart';
import 'package:comida_app_rosa/widget/categoria_item.dart';
import 'package:comida_app_rosa/widget/comida_carousel.dart';
import 'package:comida_app_rosa/widget/lista_busqueda.dart';
import 'package:comida_app_rosa/widget/navigation_drawer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:flat_icons_flutter/flat_icons_flutter.dart';

class HamburguesaRosa extends StatefulWidget {
  const HamburguesaRosa({super.key});

  @override
  State<HamburguesaRosa> createState() => _HamburguesaRosaState();
}

int currentIndex = 0;

class _HamburguesaRosaState extends State<HamburguesaRosa> {
  List<Comida> resultadosBusqueda = [];
  String tipoComida = 'hamburguesa';
  final CarouselController _carouselController = CarouselController();
  int selectedCardIndex = 0;

  final _titleController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    _titleController.dispose();
    super.dispose();
  }

  List<Comida> comidasFiltradas = comidaDisponible
      .where((comida) => comida.tipoAlimento.name == 'hamburguesa')
      .toList();

  selectCard(int index) {
    setState(() {
      selectedCardIndex = index;
      _carouselController.animateToPage(0);

      switch (index) {
        case 0:
          tipoComida = 'hamburguesa';
          break;
        case 1:
          tipoComida = 'pizza';
          break;
        case 2:
          tipoComida = 'hotdog';
          break;
        case 3:
          tipoComida = 'bebida';
          break;
        default:
          break;
      }
      comidasFiltradas = comidaDisponible
          .where((comida) => comida.tipoAlimento.name == tipoComida)
          .toList();
    });
  }

  String textoMayuscula(String text) {
    String primeraLetra = text.substring(0, 1).toUpperCase();
    String textoRestante = text.substring(1);

    return '$primeraLetra$textoRestante';
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //para ocultar el teclado cuando se da click fuera del textfield
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: Builder(
            builder: (context) => IconButton(
              icon: Image.asset('assets/icons/drawer_icon.png', height: 30),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
          title: const Text(''),
        ),
        drawer: const NavigationDrawerWidget(),
        body: Container(
          color: const Color(0xFFF7F6FF),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: RichText(
                    text: TextSpan(
                      text: 'Elige la \n',
                      style:
                          GoogleFonts.outfit(fontSize: 28, color: Colors.black),
                      children: [
                        TextSpan(
                          text: 'Comida que amas',
                          style: GoogleFonts.outfit(
                            fontWeight: FontWeight.bold,
                            fontSize: 28,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                width: MediaQuery.of(context).size.width - 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(80),
                ),
                child: TextField(
                  //autofocus: true,// Para enfocar automáticamente el campo de búsqueda al abrir la página.
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                    hintText: 'Buscar una comida',
                  ),
                  controller: _titleController,
                  onChanged: (query) {
                    updateSearchResults(query);
                  },
                ),
              ),
              const SizedBox(height: 35),
              Expanded(
                  child: resultadosBusqueda.length != 0 ||
                          _titleController.text.isNotEmpty
                      ? ListaBusqueda(resultadosBusqueda: resultadosBusqueda)
                      : Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Categorías',
                                  style: GoogleFonts.outfit(),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Container(
                                padding: const EdgeInsets.only(left: 20),
                                //color: Colors.amber,
                                height: 100,
                                child: Row(
                                  children: [
                                    CategoriaItem(
                                      imagenUrl: 'assets/icons/hamburguesa.png',
                                      titulo: 'Hamburguesa',
                                      index: 0,
                                      isSelected: selectedCardIndex == 0,
                                      onTap: selectCard,
                                    ),
                                    const SizedBox(width: 20),
                                    CategoriaItem(
                                      imagenUrl:
                                          'assets/icons/porcion-de-pizza.png',
                                      titulo: 'Pizza',
                                      index: 1,
                                      isSelected: selectedCardIndex == 1,
                                      onTap: selectCard,
                                    ),
                                    const SizedBox(width: 20),
                                    CategoriaItem(
                                      imagenUrl: 'assets/icons/hot-dog.png',
                                      titulo: 'Hot dog',
                                      index: 2,
                                      isSelected: selectedCardIndex == 2,
                                      onTap: selectCard,
                                    ),
                                    const SizedBox(width: 20),
                                    CategoriaItem(
                                      imagenUrl: 'assets/icons/zumo.png',
                                      titulo: 'Bebida',
                                      index: 3,
                                      isSelected: selectedCardIndex == 3,
                                      onTap: selectCard,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 35),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  textoMayuscula(tipoComida),
                                  style: GoogleFonts.outfit(),
                                ),
                              ),
                            ),
                            ComidaCarousel(
                              currentIndex: currentIndex,
                              comidasFiltradas: comidasFiltradas,
                              carouselController: _carouselController,
                            ),
                          ],
                        )),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Add your onPressed code here!
          },
          backgroundColor: const Color.fromARGB(255, 255, 0, 55),
          child: const Icon(Icons.shopping_bag_outlined, color: Colors.white),
        ),
      ),
    );
  }

  void updateSearchResults(String text) {
    resultadosBusqueda.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }
    setState(() {
      for (Comida comida in comidaDisponible) {
        if (comida.nombre.toLowerCase().contains(text.toLowerCase())) {
          resultadosBusqueda.add(comida);
        }
      }
    });
  }
}
