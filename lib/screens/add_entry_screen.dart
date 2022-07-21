import 'package:flutter/material.dart';

class AddEntry extends StatelessWidget {
  const AddEntry({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add new Journal Entry'),
        actions: [
          Builder(
            builder: (BuildContext context) {
              return IconButton(
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
                icon: const Icon(
                  Icons.settings,
                ),
              );
            },
          ),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextFormField(
              autofocus: true,
              decoration: const InputDecoration(
                labelText: 'Title',
                border: OutlineInputBorder(),
              ),
              onSaved: (value) {
                // Save value in state
              },
              validator: (String? value) {
                if (value!.isEmpty) {
                  return 'Please enter a title';
                } else {
                  return null;
                }
              },
            ),
            TextFormField(
              autofocus: true,
              decoration: const InputDecoration(
                labelText: 'Body',
                border: OutlineInputBorder(),
              ),
              onSaved: (value) {
                // Save value in state
              },
              validator: (String? value) {
                if (value!.isEmpty) {
                  return 'Please enter a title';
                } else {
                  return null;
                }
              },
            ),
            TextFormField(
              autofocus: true,
              decoration: const InputDecoration(
                labelText: 'Rating',
                border: OutlineInputBorder(),
              ),
              onSaved: (value) {
                // Save value in state
              },
              validator: (String? value) {
                if (value!.isEmpty) {
                  return 'Please enter a title';
                } else {
                  return null;
                }
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey, // Background color
                  ),
                  child: const Text('Cancel'),
                  onPressed: () {
                    goToHomeScreen(context);
                  },
                ),
                ElevatedButton(
                  child: const Text('Save'),
                  onPressed: () {
                    saveEntry(context);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      endDrawer: Drawer(
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
                  onChanged: (value) {
                    // Do something
                  },
                  value: false,
                  // activeTrackColor: Colors.lightGreenAccent,
                  // activeColor: Colors.green,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /*
    Navigate to AddEntry Screen
  */
  void goToHomeScreen(BuildContext context) {
    Navigator.of(context).pop();
  }

  /*
    Navigate to AddEntry Screen
  */
  void saveEntry(BuildContext context) {
    Navigator.of(context).pop();

    // Save form data to state
  }
}
