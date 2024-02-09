import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterscanner/Core/utils/Bloc_observer.dart';
import 'package:flutterscanner/Core/utils/Locator.dart';
import 'package:flutterscanner/Features/HomeScreen/Presentation/Manager/AllProductCubit/all_product_cubit.dart';
import 'package:flutterscanner/Features/HomeScreen/Presentation/Manager/Scan/scan_bar_code_cubit.dart';
import 'package:flutterscanner/Features/HomeScreen/Presentation/Manager/SearchProduct/search_product_cubit.dart';
import 'package:flutterscanner/Features/HomeScreen/Presentation/View/AllProduct/Screens/AllProduct.dart';
import 'package:flutterscanner/Features/HomeScreen/Presentation/View/SearchProduct/Screens/BuildScanBarCode.dart';
import 'package:flutterscanner/Features/HomeScreen/data/repo/HomeRepoImple.dart';

void main() {
 ServicesLocator.setupServiceLocator();
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AllProductCubit(
              allProductRepo:
              ServicesLocator.getIt.get<AllProductImplementation>())..fetchAllProduct(),
        ),
        BlocProvider(
          create: (context) => SearchProductCubit(
              allProductRepo:
              ServicesLocator.getIt.get<AllProductImplementation>()),
        ),
        BlocProvider(create: (context) => ScanBarCodeCubit(),)
      ],
      child: MaterialApp(
        home:AllProduct()
      ),
    );
  }
}
