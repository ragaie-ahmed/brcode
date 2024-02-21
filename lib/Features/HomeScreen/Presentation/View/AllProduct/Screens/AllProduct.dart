import 'package:Alaqsa/Features/HomeScreen/Presentation/Manager/AllProductCubit/all_product_cubit.dart';
import 'package:Alaqsa/Features/HomeScreen/Presentation/Manager/AllProductCubit/all_product_state.dart';
import 'package:Alaqsa/Features/HomeScreen/Presentation/View/AllProduct/Screens/bodyAllProduct.dart';
import 'package:Alaqsa/Features/HomeScreen/Presentation/View/Login/Screens/Login.dart';
import 'package:Alaqsa/Features/HomeScreen/Presentation/View/SearchProduct/Screens/generateBarCode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeProduct extends StatefulWidget {
  HomeProduct({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeProduct> createState() => _HomeProductState();
}

class _HomeProductState extends State<HomeProduct> {
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("جميع المنتجات"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                  builder: (context) {
                    return LogIn();
                  },
                ), (route) => false);
              },
              icon: Icon(Icons.exit_to_app_sharp))
        ],
      ),
      body: BlocConsumer<AllProductCubit, AllProductState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is SuccessFetch) {
            var cubit = AllProductCubit.get(context);

            return ListView(
              children: [
                GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemCount: cubit.productList.length,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return GenerateBarCode(
                                searchproduct: cubit.productList[index]);
                          },
                        ));
                      },
                      child: BodyAllProduct(
                        allProduct: cubit.productList[index],
                      ),
                    );
                  },
                ),
              ],
            );
          }
          if (state is ErrorFetch) {
            return Center(child: Text("لا يوجد لديك بيانات الان "));
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
