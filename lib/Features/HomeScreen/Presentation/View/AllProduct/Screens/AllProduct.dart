import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterscanner/Features/HomeScreen/Presentation/Manager/AllProductCubit/all_product_cubit.dart';
import 'package:flutterscanner/Features/HomeScreen/Presentation/Manager/AllProductCubit/all_product_state.dart';
import 'package:flutterscanner/Features/HomeScreen/Presentation/View/AllProduct/Screens/bodyAllProduct.dart';
import 'package:flutterscanner/Features/HomeScreen/Presentation/View/SearchProduct/Screens/BuildScanBarCode.dart';
import 'package:flutterscanner/Features/HomeScreen/Presentation/View/SearchProduct/Screens/SearchBarcode.dart';

class AllProduct extends StatelessWidget {
  const AllProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("AllProduct"),
      ),
      body: BlocBuilder<AllProductCubit,AllProductState>(builder: (context, state) {
        if(state is SuccessFetch){
          var cubit=AllProductCubit.get(context);
          return Column(
            children: [
              // Expanded(child: BuildScan()),
              GridView.builder(
                gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                itemCount: cubit.listProduct.length,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return
                          SearchBarcode(barcode: cubit.listProduct[index].barcode.toString(),);

                      },));
                    },
                    child:
                    BodyAllProduct(allProduct: cubit.listProduct[index],)

                );
              },),
            ],
          );
        }
        if(state is ErrorFetch){
          return Center(child: Text(state.error),);
        }
        return const Center(child: CircularProgressIndicator(),);

      },)
    );
  }
}
