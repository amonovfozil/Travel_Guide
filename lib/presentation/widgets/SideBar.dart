
// ignore_for_file: file_names

import 'package:flutter/material.dart';

class SideBar extends StatelessWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Image.asset(
              'assets/icon/icon3.png',
              fit: BoxFit.cover,
              height: 220,
              width: double.infinity,
            ),
            Column(
              children: [
                const SizedBox(height: 200),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                      25,
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 10),
                      ListTile(
                        onTap: () =>
                            Navigator.of(context).pushReplacementNamed('/'),
                        leading: const Icon(
                          Icons.home,
                        ),
                        title: const Text(
                          'Bosh Sahifa',
                        ),
                      ),
                      ListTile(
                        onTap: () => Navigator.of(context)
                            .pushReplacementNamed('AddPlaces'),
                        leading: const Icon(
                          Icons.phonelink_setup_outlined,
                        ),
                        title: const Text(
                          'Ma`lumotlarni Boshqarish',
                        ),
                      ),
                      // SizedBox(
                      //   height: 460,
                      // ),
                      ListTile(
                        onTap: () => Navigator.of(context).pushNamed('AppInfo'),
                        leading: const Icon(
                          Icons.info,
                        ),
                        title: const Text(
                          'Ilova Haqida',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
//enter  StateManegment Page
          ],
        ),
      ),
    );
  }
}
