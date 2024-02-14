import 'package:flutter/material.dart';

class ButtomSheetContent extends StatelessWidget {
  const ButtomSheetContent({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Text('Order Number :'),
          Text('Order Number :'),
          Text('Order Number :'),
        ],
      ),
    );
  }
}
