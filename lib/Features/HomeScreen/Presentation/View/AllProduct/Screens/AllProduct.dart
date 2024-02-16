import 'package:Alaqsa/Features/HomeScreen/Presentation/Manager/AllProductCubit/all_product_cubit.dart';
import 'package:Alaqsa/Features/HomeScreen/Presentation/Manager/AllProductCubit/all_product_state.dart';
import 'package:Alaqsa/Features/HomeScreen/Presentation/View/AllProduct/Screens/bodyAllProduct.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeProduct extends StatelessWidget {
  const HomeProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("AllProduct"),
      ),
      body: BlocConsumer<AllProductCubit,AllProductState>(listener: (context, state) {

      },builder: (context, state) {
        if(state is SuccessFetch){
          var cubit=AllProductCubit.get(context);
          return RefreshIndicator(
            onRefresh: () async{
             await cubit.fetchAllProduct();
            },
            child: ListView(
              children: [
                // Expanded(child: BuildScan()),
                GridView.builder(
                  gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                  itemCount: 100,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return InkWell(
                        onTap: () {
                          // Navigator.push(context, MaterialPageRoute(builder: (context) {
                          //   return
                          //     // SearchBarcode(barcode: cubit.listProduct[index].barcode.toString(),);
                          //
                          // },));
                        },
                        child:
                        BodyAllProduct(allProduct: cubit.listProduct[index],)
            
                    );
                  },),
              ],
            ),
          );
        }
        else if( state is CachedSuccess){
          var cubit=AllProductCubit.get(context);
          return RefreshIndicator(
            onRefresh: () async{
              await cubit.fetchAllProduct();
            },
            child: ListView(
              children: [
                // Expanded(child: BuildScan()),
                GridView.builder(
                  gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                  itemCount: 10,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return
                        BodyAllProduct(allProduct: cubit.listProduct[index],);


                  },),
              ],
            ),
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
