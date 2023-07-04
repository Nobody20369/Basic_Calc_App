import 'package:flutter/material.dart';

class VoltPage extends StatelessWidget {
  const VoltPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
      ),
      backgroundColor: Colors.black,
      body: Container(
        alignment: Alignment.centerRight,
        child: Text(
          'Vault will be activated soon',
          style: TextStyle(fontSize: 40, color: Colors.white),
        ),
      ),
    );
  }
}
