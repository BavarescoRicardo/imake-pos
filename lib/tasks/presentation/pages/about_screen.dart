import 'package:flutter/material.dart';
import 'package:imake/utils/font_sizes.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tela Sobre'),
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Desenvolvedor',
              style: TextStyle(
                fontSize: 24, 
                fontWeight: FontWeight.bold, 
              ),
            ),
            SizedBox(height: 8), 
            Text(
              'Ricardo Bavaresco',
              style: TextStyle(
                fontSize: 18, 
              ),
            ),
          ],
        ),
      ),
    );
  }
}
