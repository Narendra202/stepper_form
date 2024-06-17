import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_crud_app/homepage.dart';
import 'package:hive_crud_app/model/emp_model.dart';
import 'package:hive_flutter/adapters.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(EmployeeModelAdapter());
  await Hive.openBox('employee');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink.shade600),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }


}

