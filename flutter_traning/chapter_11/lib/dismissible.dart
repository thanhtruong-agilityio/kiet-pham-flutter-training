import 'package:flutter/material.dart';
import 'package:animations/animations.dart';

class DismissibleScreen extends StatefulWidget {
  const DismissibleScreen({super.key});

  @override
  State<DismissibleScreen> createState() => _DismissibleScreenState();
}

class _DismissibleScreenState extends State<DismissibleScreen> {
  final List<String> sweets = [
    'Petit Four',
    'Cupcake',
    'Donut',
    'Éclair',
    'Froyo',
    'Gingerbread ',
    'Honeycomb ',
    'Ice Cream Sandwich',
    'Jelly Bean',
    'KitKat'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dismissible Example"),
      ),
      body: ListView.builder(
        itemCount: sweets.length,
        itemBuilder: (context, index) {
          return OpenContainer(
            transitionDuration: const Duration(milliseconds: 400),
            transitionType: ContainerTransitionType.fade,
            closedBuilder: (context, openContainer) {
              return Dismissible(
                key: Key(sweets[index]),
                child: ListTile(
                  title: Text(sweets[index]),
                  trailing: Icon(Icons.cake),
                  onTap: () {
                    openContainer();
                  },
                ),
                onDismissed: (direction) {
                  sweets.removeAt(index);
                },
              );
            },
            openBuilder: (context, closeContainer) {
              return Scaffold(
                appBar: AppBar(
                  title: Text(sweets[index]),
                ),
                body: Center(
                  child: Column(
                    children: [
                      Container(
                        width: 200,
                        height: 200,
                        child: const Icon(
                          Icons.cake,
                          size: 200,
                          color: Colors.orange,
                        ),
                      ),
                      Text(sweets[index])
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
