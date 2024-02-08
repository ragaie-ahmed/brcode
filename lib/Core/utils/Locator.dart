import 'package:flutterscanner/Core/utils/Api_Services.dart';
import 'package:flutterscanner/Features/HomeScreen/data/repo/HomeRepo.dart';
import 'package:flutterscanner/Features/HomeScreen/data/repo/HomeRepoImple.dart';
import 'package:get_it/get_it.dart';

class ServicesLocator {
 static final getIt = GetIt.instance;

 static void setupServiceLocator() {
    getIt.registerSingleton<ApiServices>(ApiServices());
    getIt.registerSingleton<AllProductImplementation>(AllProductImplementation(
      apiServices: getIt.get<ApiServices>(),
    ));
  }
}
