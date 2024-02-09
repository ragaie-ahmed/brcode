import 'package:Alaqsa/Features/HomeScreen/Presentation/Manager/SearchProduct/search_product_cubit.dart';
import 'package:Alaqsa/Features/HomeScreen/Presentation/Manager/SearchProduct/search_product_state.dart';
import 'package:Alaqsa/Features/HomeScreen/Presentation/View/SearchProduct/Screens/BuildScanBarCode.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class DetailsSearch extends StatefulWidget {
  DetailsSearch({super.key, required this.barcode});

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
        title: const Text("تفاصيل المنتج"),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new_sharp),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<SearchProductCubit, SearchProductState>(
        builder: (context, state) {
          var cubit = SearchProductCubit.get(context);

          if (state is SuccessSearch) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Image.asset("Assets/Images/6770245.png"),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      " ${cubit.searchproduct!.title}  : العنوان",
                      style: const TextStyle(fontSize: 18, color: Colors.black),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      "سعر المنتج : ${cubit.searchproduct!.price}",
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text("وصف المنتج",style: TextStyle(color: Colors.black,fontSize: 20),),
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
                            "تاريخ الانشاء: ${cubit.searchproduct!.createdAt}",
                            style:
                                const TextStyle(overflow: TextOverflow.ellipsis),
                          )),
                      SizedBox(
                          width: 170,
                          child: Text(
                            "اخر تحديث : ${cubit.searchproduct!.updatedAt}",
                            style:
                                const TextStyle(overflow: TextOverflow.ellipsis),
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
              
              
                  InkWell(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) {
                        return BuildScan();
                      },), (route) => false);
                    },
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: SizedBox(
                        width: 100.0,
                        height: 100.0,
                        child: Shimmer.fromColors(
                          baseColor: Colors.black,
                          highlightColor: Colors.grey,
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: Text(
                              'رجوع',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 40.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else if (state is ErrorSearch) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(state.error),
                  SizedBox(height: 10,),
                  InkWell(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) {
                        return BuildScan();
                      },), (route) => false);
                    },
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: SizedBox(
                        width: 100.0,
                        height: 100.0,
                        child: Shimmer.fromColors(
                          baseColor: Colors.black,
                          highlightColor: Colors.grey,
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: Text(
                              'رجوع',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 40.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
