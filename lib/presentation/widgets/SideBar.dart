import 'dart:ui';

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
            Container(
              child: Image.asset(
                'assets/images/logo.png',
                fit: BoxFit.cover,
                height: 220,
                width: double.infinity,
              ),
            ),
            Column(
              children: [
                SizedBox(height: 200),
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
                      SizedBox(height: 10),
                      ListTile(
                        onTap: () =>
                            Navigator.of(context).pushReplacementNamed('/'),
                        leading: Icon(
                          Icons.home,
                        ),
                        title: Text(
                          'Bosh Sahifa',
                        ),
                      ),
                      ListTile(
                        onTap: () => Navigator.of(context)
                            .pushReplacementNamed('AddPlaces'),
                        leading: Icon(
                          Icons.phonelink_setup_outlined,
                        ),
                        title: Text(
                          'Ma`lumotlarni Boshqarish',
                        ),
                      ),
                      ListTile(
                        onTap: () => Navigator.of(context).pushNamed('AppInfo'),
                        leading: Icon(
                          Icons.info,
                        ),
                        title: Text(
                          'Ma`lumotlarni Boshqarish',
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
