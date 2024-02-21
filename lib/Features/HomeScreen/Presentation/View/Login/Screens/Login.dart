import 'package:Alaqsa/Features/HomeScreen/Presentation/Manager/Login/login_cubit.dart';
import 'package:Alaqsa/Features/HomeScreen/Presentation/Manager/Login/login_state.dart';
import 'package:Alaqsa/Features/HomeScreen/Presentation/View/Login/Widget/CustomTextForField.dart';
import 'package:Alaqsa/Features/HomeScreen/Presentation/View/SearchProduct/Screens/BuildScanBarCode.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  TextEditingController emailController = TextEditingController();
  TextEditingController pssWordController = TextEditingController();
  GlobalKey<FormState> keyForm = GlobalKey();

  @override
  void dispose() {
    emailController.dispose();
    pssWordController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is SuccessLogIn) {
            Navigator.pushReplacement(context, MaterialPageRoute(
              builder: (context) {
                return BuildScan();
              },
            ));
          } else if (state is ErrorLogIn) {
            Get.snackbar("خطأ", "${state.error}");
          }
        },
        builder: (context, state) {
          var cubit = LoginCubit.get(context);
          return Form(
            key: keyForm,
            child: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 200,
                      ),
                      Align(
                          alignment: Alignment.center,
                          child: Text(
                            "صفحه الدخول",
                            style: TextStyle(
                                color: Colors.blueAccent,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          )),
                      SizedBox(
                        height: 30,
                      ),
                      CustomTextFormField(
                        obs: false,
                        validate: (value) {
                          if (value == null ) {
                            return 'Invalid Email';
                          }
                          return null;
                        },
                        hintText: "البريد الالكتروني",
                        controller: emailController,
                        textValidate: "Please Enter Email",
                        textInputType: TextInputType.text,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomTextFormField(
                        obs: true,
                        hintText: "رقم السري",

                        controller: pssWordController,
                        textValidate: "Please Enter Password",
                        textInputType: TextInputType.text,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      MaterialButton(
                          color: Colors.blue,
                          padding: EdgeInsets.symmetric(horizontal: 100),
                          onPressed: () {
                            if (keyForm.currentState!.validate()) {
                              cubit.logIn(
                                  kayWord: emailController.text,
                                  userSelral: pssWordController.text
                              );
                            }
                          },
                          child: Text(
                            "تسجيل الدخول",
                            style: TextStyle(color: Colors.white),
                          ))
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
