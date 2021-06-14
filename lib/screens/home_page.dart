import 'package:gtech_flutter/screens/profile_page.dart';
import 'package:gtech_flutter/widgets/photo_grid.dart';
import 'package:gtech_flutter/widgets/top_var.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class HomepageScreen extends StatefulWidget {
  @override
  _HomepageScreenState createState() => _HomepageScreenState();
}

class _HomepageScreenState extends State<HomepageScreen> {
  void _profileEdit() {
    Navigator.of(context)
        .pushNamed(ProfileScreen.routeName, arguments: "something")
        .then((value) => print("Object $value"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              profileTab(),
              const SizedBox(height: 10),
              Text('  Photograpghy',
                  style: TextStyle(fontSize: 22, color: Color(0xff0B3D2E))),
              const SizedBox(height: 10),
              PhotoGrid()
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _profileEdit,
        child: Icon(Icons.edit),
      ),
    );
  }

  ValueListenableBuilder<Box<dynamic>> profileTab() {
    return ValueListenableBuilder(
      valueListenable: Hive.box('profile').listenable(),
      builder: (BuildContext context, Box value, Widget? child) => TopBar(
        title: value.get('name'),
        subtitle: 'Developer(Noob)',
        color: Colors.blue.shade400,
      ),
    );
  }
}
