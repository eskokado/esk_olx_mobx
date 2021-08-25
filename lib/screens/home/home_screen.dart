import 'package:flutter/material.dart';

import '../../components/custom_drawer/custom_drawer.dart';
import 'components/search_dialog.dart';

class HomeScreen extends StatelessWidget {
  openSearch(BuildContext context) async {
    final search =
        await showDialog(context: context, builder: (_) => SearchDialog(
          currentSearch: 'Edson Shideki Kokado',
        ));
    print(search);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        drawer: CustomDrawer(),
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                openSearch(context);
              },
              icon: Icon(Icons.search),
            ),
          ],
        ),
      ),
    );
  }
}
