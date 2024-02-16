import 'package:Alaqsa/Core/utils/Bloc_observer.dart';
import 'package:Alaqsa/Core/utils/Const.dart';
import 'package:Alaqsa/Features/HomeScreen/Presentation/Manager/AllProductCubit/all_product_cubit.dart';
import 'package:Alaqsa/Features/HomeScreen/Presentation/Manager/SearchProduct/search_product_cubit.dart';
import 'package:Alaqsa/Features/HomeScreen/Presentation/View/SplashScreen/SplashScreen.dart';
import 'package:Alaqsa/Features/HomeScreen/data/Model/AllProduct.dart';
import 'package:Alaqsa/Features/HomeScreen/data/repo/HomeRepoImple.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';

import 'Core/utils/Locator.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(AllProductAdapter());
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
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home:SplashScreen(),
      ),
    );
  }
}
