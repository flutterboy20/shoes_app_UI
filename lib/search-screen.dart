import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Explore Wide Range of\n Shoes!',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Lottie.network(
              'https://assets3.lottiefiles.com/packages/lf20_pocxzsoi.json',
              height: 300,
              width: 300,
              fit: BoxFit.fill,
              repeat: true,
            ),
          ],
        ),
      ),
    );
  }
}
