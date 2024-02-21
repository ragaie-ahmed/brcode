import 'package:Alaqsa/Core/utils/Const.dart';
import 'package:Alaqsa/Core/utils/Shared_pref.dart';
import 'package:Alaqsa/Features/HomeScreen/Presentation/Manager/Login/login_state.dart';
import 'package:Alaqsa/Features/HomeScreen/data/repo/HomeRepo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.allProductRepo}) : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);

  AllProductRepo allProductRepo;
  int? userid;
  Map<String, dynamic>? loginModel;

  Future<void> logIn(
      {required String kayWord, required String userSelral}) async {
    emit(LoadingLogIn());
    try {
      var result =
          await allProductRepo.logIn(kayWord: kayWord, userSelral: userSelral);
      if (result["id"] != null) {
        await SharedPref.putData(key: "userid", value: result["id"]);
        AppConstant.userid = SharedPref.getData(key: "userid");

        print("the user id is${SharedPref.getData(key: "userid")}");
      } else {
        emit(ErrorLogIn(error: "Invalid response format"));
      }
      emit(SuccessLogIn());
    } catch (e) {
      emit(ErrorLogIn(error: "خطا فى كلمه المرور او كلمه السر"));
    }
  }
}
