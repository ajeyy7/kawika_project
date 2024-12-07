import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kawika_project/common/bottombar.dart';
import 'package:kawika_project/common/common_button.dart';
import 'package:kawika_project/view_model/authviewmodel.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<Authviewmodel>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(color: Colors.white),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/svg/11905926_4860635.svg',
                    height: 300,
                  )
                ],
              ),
            ),
            Container(
              height: 500,
              decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Login",
                      style: TextStyle(color: Colors.white),
                    ),
                    const SizedBox(height: 30),
                    TextFormField(
                      style: TextStyle(color: Colors.white),
                      controller: emailController,
                      decoration: const InputDecoration(
                          label: Text('Email'), border: OutlineInputBorder()),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                                            style: TextStyle(color: Colors.white),

                      controller: passController,
                      decoration: const InputDecoration(
                          label: Text('Password'),
                          border: OutlineInputBorder()),
                    ),
                    const SizedBox(height: 20),
                    CommonButton(
                        onTap: () async {
                          await authProvider.login(emailController.text.trim(),
                              passController.text.trim());
                          if (authProvider.token != null) {
                            // ignore: use_build_context_synchronously
                            await Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => BottomBar()));
                          } else {
                            if (kDebugMode) {
                              print('error login');
                            }
                          }
                        },
                        label: 'Login')
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
