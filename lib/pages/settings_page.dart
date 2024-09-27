import 'package:flutter/material.dart';
import '../widgets/color_button.dart';
import 'home_page.dart';

class SettingsPage extends StatelessWidget {
  final Function(Color) onThemeChanged;

  const SettingsPage({super.key, required this.onThemeChanged});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: Colors.teal[300],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Choose App Theme',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                ColorButton(
                  color: Colors.blue[300]!,
                  label: 'Blue',
                  onTap: () => onThemeChanged(Colors.blue),
                ),
                ColorButton(
                  color: Colors.green[300]!,
                  label: 'Green',
                  onTap: () => onThemeChanged(Colors.green),
                ),
                ColorButton(
                  color: Colors.purple[300]!,
                  label: 'Purple',
                  onTap: () => onThemeChanged(Colors.purple),
                ),
                ColorButton(
                  color: Colors.orange[300]!,
                  label: 'Orange',
                  onTap: () => onThemeChanged(Colors.orange),
                ),
              ],
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              child: const Text('Back to Home'),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(
                      onThemeChanged: (theme) {},
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
