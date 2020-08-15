import 'package:flutter/material.dart';
import 'homePageWidgets/main_widget.dart';
import 'sidebar/sidebar_layout.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Row(
          children: [
            Container(
              width: 110,
              child: SidebarLayout(),
            ),
            Expanded(
                child: MainWidget()
            ),
          ],
        ),
      ),
    );
  }
}