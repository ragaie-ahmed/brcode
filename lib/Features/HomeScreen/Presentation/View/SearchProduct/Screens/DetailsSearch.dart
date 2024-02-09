import 'package:Alaqsa/Features/HomeScreen/Presentation/Manager/SearchProduct/search_product_cubit.dart';
import 'package:Alaqsa/Features/HomeScreen/Presentation/Manager/SearchProduct/search_product_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsSearch extends StatefulWidget {
   DetailsSearch({super.key,required this.barcode});
final String barcode;
  @override
  State<DetailsSearch> createState() => _DetailsSearchState();
}

class _DetailsSearchState extends State<DetailsSearch> {
  @override
  void initState() {
SearchProductCubit.get(context).getSearchProduct(widget.barcode);
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details_Product"),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon:Icon(Icons.arrow_back_ios_new_sharp) ,
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<SearchProductCubit, SearchProductState>(
        builder: (context, state) {
          var cubit=SearchProductCubit.get(context);

           if(state is SuccessSearch){
             return Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Image.asset("Assets/Images/6770245.png"),
                 Padding(
                   padding: const EdgeInsets.all(15.0),
                   child: Text(
                     "Title: ${cubit.searchproduct!.title}",
                     style:const TextStyle(fontSize: 18, color: Colors.black),
                   ),
                 ),
                 Padding(
                   padding: const EdgeInsets.all(15.0),
                   child: Text(
                     "price: ${cubit.searchproduct!.price}",
                     style:const TextStyle(fontSize: 18),
                   ),
                 ),
                 const    Padding(
                   padding:  EdgeInsets.all(15.0),
                   child: Text("description"),
                 ),
                 Padding(
                   padding: const EdgeInsets.all(15.0),
                   child: Text(
                     "${cubit.searchproduct!.description}",
                     style: TextStyle(color: Colors.grey),
                   ),
                 ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   children: [
                     SizedBox(
                         width: 150,
                         child: Text(
                           "createAt: ${cubit.searchproduct!.createdAt}",
                           style:const TextStyle(overflow: TextOverflow.ellipsis),
                         )),
                     SizedBox(
                         width: 150,
                         child: Text(
                           "Update: ${cubit.searchproduct!.updatedAt}",
                           style:const TextStyle(overflow: TextOverflow.ellipsis),
                         )),
                   ],
                 )
               ],
             );
           }
           else if(state is ErrorSearch){
             return Center(child: Text(state.error),);
           }
           return Center(child: CircularProgressIndicator());


        },
      ),
    );
  }
}
