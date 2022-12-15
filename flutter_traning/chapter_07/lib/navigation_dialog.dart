import 'package:flutter/material.dart';

class NavigationDialog extends StatefulWidget {
  const NavigationDialog({super.key});

  @override
  State<NavigationDialog> createState() => _NavigationDialogState();
}

class _NavigationDialogState extends State<NavigationDialog> {
  Color color = Colors.blue[700]!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      appBar: AppBar(
        title: Text('Navigation Dialog Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Change Color'),
          onPressed: () {
            _showColorDialog(context);
          },
        ),
      ),
    );
  }

  void _showColorDialog(BuildContext context) async {
    Color? colorDialog;
    await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text('Every important question'),
          content: Text('Please choose color'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                colorDialog = Colors.red[700]!;
                Navigator.pop(context, color);
              },
              child: Text('Red'),
            ),
            TextButton(
              child: Text('Green'),
              onPressed: () {
                colorDialog = Colors.green[700]!;
                Navigator.pop(context, color);
              },
            ),
            TextButton(
              child: Text('Blue'),
              onPressed: () {
                colorDialog = Colors.blue[700]!;
                Navigator.pop(context, color);
              },
            ),
          ],
        );
      },
    );
    setState(() {
      color = colorDialog!;
    });
  }
}
