import 'package:flutter/material.dart';
import 'package:kawika_project/common/common_button.dart';
import 'package:kawika_project/view/pages/login_page.dart';
import 'package:kawika_project/view_model/authviewmodel.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
        final authProvider = Provider.of<Authviewmodel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        actions: [Icon(Icons.share)],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
        Text(authProvider.token??""),
            CommonButton(
                onTap: () async {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  await prefs.clear();
                  await Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => LoginPage()));
                },
                label: 'Logout')
          ],
        ),
      ),
    );
  }
}
