import 'package:flutter/material.dart';

class EndDrawer extends StatelessWidget {
  final bool darkTheme;
  final VoidCallback setTheme;

  const EndDrawer({Key? key, required this.darkTheme, required this.setTheme})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(0),
        children: [
          const SizedBox(
            height: 90.0,
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green,
              ),
              child: Text('Settings'),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text('Dark Mode'),
              Switch(
                value: darkTheme,
                onChanged: (value) {
                  // Calling parent Widget's method from child
                  setTheme();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
