import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:shoes_app_ui_design_1/detail-product-screen.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = 'home-screen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Widget _buildText(String text) {
      // ! builder Text
      return Text(
        text,
        style: GoogleFonts.lato(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Colors.black54,
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 5, top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.menu_rounded,
                          size: 30,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.search_rounded,
                          size: 35,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                // ! Title
                Container(
                  //heading
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 20, bottom: 10, top: 10),
                    child: Text(
                      "Best of \nShoe Collection",
                      style: GoogleFonts.montserrat(
                        fontSize: 40,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                // ! Subtitle
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        Text(
                          "Explore wide range of athletic collection",
                          style: GoogleFonts.notoSerif(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        SizedBox(width: 15),
                        Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Icon(
                            Icons.filter_list_rounded,
                            color: Colors.white,
                            size: 18,
                          ),
                        ),
                        SizedBox(width: 10),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 15),
                // ! Filters
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 6),
                    child: DefaultTabController(
                      length: 4,
                      child: TabBar(
                        isScrollable: true,
                        indicatorSize: TabBarIndicatorSize.label,
                        indicatorColor: Colors.black,
                        tabs: [
                          Tab(
                            child: Container(
                              child: _buildText('Loafers'),
                            ),
                          ),
                          Tab(
                            child: Container(
                              child: _buildText('Casual'),
                            ),
                          ),
                          Tab(
                            child: Container(
                              child: _buildText('Sneakers'),
                            ),
                          ),
                          Tab(
                            child: Container(
                              child: _buildText('Athlectic'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                // ! Product list
                LoafersShoes(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class LoafersShoes extends StatelessWidget {
  LoafersShoes({
    Key? key,
  }) : super(key: key);
  Widget _buildProduct(
      String path, String title, String subtitle, String price) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Slidable(
        actionPane: SlidableScrollActionPane(),
        actionExtentRatio: 0.15,
        child: Container(
          height: 110,
          width: 390,
          child: Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Row(
              children: [
                Container(
                  height: 110,
                  width: 150,
                  child: Image.asset(path, fit: BoxFit.cover),
                ),
                SizedBox(width: 20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // SizedBox(height: 5),
                    Text(
                      title,
                      style: GoogleFonts.montserrat(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      subtitle,
                      style: GoogleFonts.lato(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      price,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        secondaryActions: <Widget>[
          IconSlideAction(
            color: Colors.indigo.shade900,
            iconWidget: Icon(
              Icons.favorite_border_rounded,
              size: 30,
              color: Colors.white,
            ),
            onTap: () {},
          ),
          IconSlideAction(
            color: Colors.black,
            iconWidget: Icon(
              Icons.shopping_cart_outlined,
              size: 30,
              color: Colors.white,
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: 3,
            color: Colors.black,
          ),
          borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
        ),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(left: 9, right: 7),
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(DetailProduct.routeName);
                  },
                  child: _buildProduct(
                      'assets/images/1.png',
                      'Pegasus 38',
                      'Pegasus 38 continues \nto put spring in your step.',
                      '\$124.00'),
                ),
                Divider(color: Colors.black54),
                SizedBox(height: 10),
                _buildProduct('assets/images/2.png', 'Wildhorse 7',
                    'Take on those tough and\nextreme trail runs.', '\$149.00'),
                Divider(color: Colors.black54),
                SizedBox(height: 10),
                _buildProduct(
                    'assets/images/3.png',
                    'Zoom X',
                    'Get after those long runs\nwith the Nike ZoomX.',
                    '\$179.00'),
                Divider(color: Colors.black54),
                SizedBox(height: 10),
                _buildProduct('assets/images/4.png', 'Winflo 7',
                    'Helps keep you running\nstay focus on path.', '\$199.00'),
                Divider(color: Colors.black54),
                SizedBox(height: 10),
                _buildProduct(
                    'assets/images/5.png',
                    'Structure 23',
                    'Made for the runner shoe\nthey can wear daily.',
                    '\$124.00'),
                SizedBox(height: 70),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
