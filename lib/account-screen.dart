import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Setup your account Now!',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Container(
              height: 400,
              width: 400,
              child: Lottie.network(
                'https://assets2.lottiefiles.com/packages/lf20_xyadoh9h.json',
                height: 400,
                width: 400,
                fit: BoxFit.cover,
                repeat: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
