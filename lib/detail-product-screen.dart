import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/rendering.dart';

import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:shoes_app_ui_design_1/home-screen.dart';
import 'package:shoes_app_ui_design_1/bottom_navigation.dart';

//Editing
class DetailProduct extends StatefulWidget {
  static const routeName = 'detail-product';
  const DetailProduct({Key? key}) : super(key: key);

  @override
  _DetailProductState createState() => _DetailProductState();
}

class _DetailProductState extends State<DetailProduct>
    with TickerProviderStateMixin {
  late ScrollController scrollController;
  bool dialVisible = true;

  @override
  void initState() {
    super.initState();

    scrollController = ScrollController()
      ..addListener(() {
        setDialVisible(scrollController.position.userScrollDirection ==
            ScrollDirection.forward);
      });
  }

  void setDialVisible(bool value) {
    setState(() {
      dialVisible = value;
    });
  }

  Widget buildBody() {
    return ListView.builder(
      controller: scrollController,
      itemCount: 30,
      itemBuilder: (ctx, i) => ListTile(title: Text('Item $i')),
    );
  }

  SpeedDial buildSpeedDial() {
    return SpeedDial(
      /// both default to 16
      marginEnd: 18,
      marginBottom: 20,
      animatedIcon: AnimatedIcons.menu_close,
      animatedIconTheme: IconThemeData(
        size: 22.0,
        color: Colors.white,
      ),

   
      icon: Icons.add,
      activeIcon: Icons.remove,
      iconTheme: IconThemeData(color: Colors.white, size: 30),

      buttonSize: 56.0,
      visible: true,

      closeManually: false,
      curve: Curves.bounceIn,
      overlayColor: Colors.white,
      overlayOpacity: 0.5,

      tooltip: 'Speed Dial',
      heroTag: 'speed-dial-hero-tag',
      backgroundColor: Colors.black87,
      foregroundColor: Colors.black87,
      elevation: 8.0,
      shape: CircleBorder(),

      children: [
        SpeedDialChild(
          child: Icon(
            Icons.shopping_cart_outlined,
            color: Colors.white,
          ),
          backgroundColor: Colors.green,
          label: 'Buy',
          labelStyle: TextStyle(fontSize: 18.0, color: Colors.white),
        ),
        SpeedDialChild(
          child: Icon(
            Icons.favorite_outline,
            color: Colors.white,
          ),
          backgroundColor: Colors.pink,
          label: 'Favourite',
          labelStyle: TextStyle(fontSize: 18.0, color: Colors.white),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ! Icons and name
                  Container(
                    padding: EdgeInsets.only(left: 5, top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: Icon(
                            Icons.arrow_back_ios,
                            size: 20,
                          ),
                        ),
                        Text(
                          'Pegasus 38',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.more_horiz_rounded,
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  // ! Main Image
                  Container(
                    child: Row(
                      children: [
                        SizedBox(width: 50),
                        Container(
                          height: 220,
                          width: 320,
                          child: Container(
                            child: Image.asset(
                              'assets/images/1.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  // ! Related items text
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      'Related items',
                      style: GoogleFonts.lato(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),

                  // ! Related items images
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    height: 120,
                    width: 390,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.asset('assets/images/6.png', fit: BoxFit.cover),
                        Image.asset('assets/images/5.png', fit: BoxFit.cover),
                        Image.asset('assets/images/4.png', fit: BoxFit.cover),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  // ! Main shoe name
                  Container(
                    margin: EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Nike Air Zoom\nPegasus 38 FlyEase',
                          style: GoogleFonts.montserrat(
                            fontSize: 28,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Container(
                            width: 65,
                            height: 25,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(0.0, 1.0), //(x,y)
                                  blurRadius: 6.0,
                                ),
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                15,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Icon(
                                  Icons.add,
                                  color: Colors.black,
                                  size: 18,
                                ),
                                Text(
                                  '1',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Icon(
                                  Icons.remove,
                                  color: Colors.black,
                                  size: 18,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Row(
                      children: [
                        Text(
                          'Assured',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.amber,
                          ),
                        ),
                        Icon(
                          Icons.verified_outlined,
                          color: Colors.blue,
                          size: 16,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  // ! About Product
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    height: 220,
                    width: 320,
                    color: Colors.white,
                    child: Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam',
                        maxLines: 10,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.lato(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        )),
                  ),
                ],
              ),
            ),
            // ! Floation Action button
            Positioned(
              top: MediaQuery.of(context).size.height * 0.85,
              left: MediaQuery.of(context).size.width * 0.82,
              child: Container(
                height: 60,
                width: 60,
                child: buildSpeedDial(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
