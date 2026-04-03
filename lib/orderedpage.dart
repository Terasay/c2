import 'package:flutter/material.dart';

class OrderedPage extends StatefulWidget {
  const OrderedPage ({super.key});

  @override
  State<OrderedPage> createState() => _OrderedPage();
}

class _OrderedPage extends State<OrderedPage> {
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Text(
          'Ordered',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
           IconButton(
            icon: const Icon(Icons.close, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}
