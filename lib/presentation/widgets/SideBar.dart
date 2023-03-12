import 'package:flutter/material.dart';

class SideBar extends StatelessWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            'Menu',
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            ListTile(
              onTap: () => Navigator.of(context).pushReplacementNamed('/'),
              leading: Icon(
                Icons.home,
              ),
              title: Text(
                'Bosh Sahifa',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
