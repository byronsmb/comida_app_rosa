import 'package:comida_app_rosa/model/comida.dart';
import 'package:comida_app_rosa/screens/detalle_comida.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class ComidaCarousel extends StatefulWidget {
  ComidaCarousel({
    super.key,
    required this.currentIndex,
    required this.comidasFiltradas,
    required this.carouselController,
  });

  int currentIndex;
  List<Comida> comidasFiltradas;
  CarouselController carouselController;

  @override
  State<ComidaCarousel> createState() => _ComidaCarouselState();
}

Widget _iconStar(IconData icon) {
  return Icon(
    icon,
    color: Colors.amber,
  );
}

class _ComidaCarouselState extends State<ComidaCarousel> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 310,
          child: CarouselSlider.builder(
            carouselController: widget.carouselController,
            options: CarouselOptions(
              height: 280.0, //altura
              initialPage: 0,
              //agrandar pantalla central
              enlargeCenterPage: true,
              //autoPlay: true, // se reproduzca automatico
              //aspectRatio: 16 / 9,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: false,
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              viewportFraction: 0.6,
              onPageChanged: (index, reason) {
                setState(() {
                  widget.currentIndex = index;
                });
              },
            ),
            itemCount: widget.comidasFiltradas.length,
            itemBuilder: (context, index, realIndex) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetalleComida(
                          comidaActual: widget.comidasFiltradas[index],
                        ),
                      ));
                },
                child: Card(
                  elevation: 10,
                  shadowColor: widget.currentIndex == index
                      ? const Color.fromARGB(255, 255, 0, 55)
                      : Colors.black87,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.6, // 80%
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          widget.currentIndex == index
                              ? const Color.fromARGB(255, 255, 0, 55)
                              : Colors.white,
                          widget.currentIndex == index
                              ? const Color.fromARGB(255, 255, 103, 136)
                              : Colors.white,
                        ],
                      ),
                    ),
                    child: Stack(children: [
                      Container(
                        //color: Colors.amber,

                        height: MediaQuery.of(context).size.height * 0.19,
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.all(10),
                        child: Image.asset(
                          widget.comidasFiltradas[index].imagen,
                        ),
                      ),
                      Positioned(
                        bottom: 20,
                        left: 10,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.comidasFiltradas[index].nombre,
                              style: GoogleFonts.outfit(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: widget.currentIndex == index
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                            RatingBar(
                              ignoreGestures: true, // ignorar click
                              glowColor: Colors.white,
                              initialRating: 3,
                              minRating: 1,
                              direction: Axis.horizontal,
                              //allowHalfRating: true,
                              itemCount: 5,
                              itemSize: 15,
                              itemPadding:
                                  const EdgeInsets.symmetric(horizontal: 4.0),
                              ratingWidget: RatingWidget(
                                  full: _iconStar(Icons.star),
                                  half: _iconStar(Icons.star_half),
                                  empty: _iconStar(Icons.star_border)),

                              onRatingUpdate: (rating) {
                                //print(rating);
                              },
                            ),
                            const SizedBox(height: 5),
                            Text(
                              '\$ ${widget.comidasFiltradas[index].precio}',
                              style: GoogleFonts.outfit(
                                fontSize: 37,
                                color: widget.currentIndex == index
                                    ? Colors.white
                                    : Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]),
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 25),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 0; i < widget.comidasFiltradas.length; i++)
              Icon(
                Icons.circle,
                size: 12,
                color: widget.currentIndex == i
                    ? const Color.fromARGB(255, 255, 0, 55)
                    : Colors.black26,
              )
          ],
        ),
      ],
    );
  }
}
