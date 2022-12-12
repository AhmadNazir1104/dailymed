import 'package:dailymed/Provider/homeprovider.dart';
import 'package:provider/provider.dart';

var allProvider = [
  ChangeNotifierProvider<HomeProvider>(
    create: (_) => HomeProvider(),
    lazy: true,
  ),
];
