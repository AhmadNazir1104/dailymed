import 'package:dailymed/Screen/home.dart';
import 'package:dailymed/Widgets/custom_text_Widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test/test.dart';
import 'Provider/all_provider.dart';
import 'counter.dart';

void main() {
  test('I want to test Adition', () {
    // Step 1
    Calculate cal = Calculate();
    // Step 2
  int result=  cal.addval(2,3);
    // Step 3
    expect(result, equals(5));
  });

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (BuildContext context, Widget? child) {
        return MultiProvider(
            providers: allProvider,
            child: const MaterialApp(
              debugShowCheckedModeBanner: false,
              home: Home(),
            ));
      },
    );
  }
}
