import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:kawika_project/common/bottom_bar_vm.dart';
import 'package:kawika_project/common/bottombar.dart';
import 'package:kawika_project/model/hive_datamodel.dart';
import 'package:kawika_project/view/pages/login_page.dart';
import 'package:kawika_project/view_model/authviewmodel.dart';
import 'package:kawika_project/view_model/home_viewmodel.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(HiveDataAdapter());
  await Hive.openBox<HiveData>('dataBox');
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => BottomBarVm()),
    ChangeNotifierProvider(create: (_) => HomeViewModel()),
    ChangeNotifierProvider(create: (_) => Authviewmodel()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: Consumer<Authviewmodel>(builder: (context, authProvider, child) {
      if (authProvider.token == null) {
        return  MaterialApp(
          debugShowCheckedModeBanner: false,
          home: LoginPage(),
        );
      } else {
        return  MaterialApp(
          debugShowCheckedModeBanner: false,
          home: BottomBar(), );
      }
    })
    );
  }
}
