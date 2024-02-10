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
      body: BlocBuilder<SearchProductCubit, SearchProductState>(
        builder: (context, state) {
          var cubit = SearchProductCubit.get(context);

          if (state is SuccessSearch) {
            return SafeArea(
              child: SingleChildScrollView(
                child: Column(

                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                   SizedBox(height: 10,),
                    Align(
                        alignment: Alignment.center,
                        child: Text("تفاصيل المنتج",style: TextStyle(fontSize: 20),),),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 3,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("Assets/Images/6770245.png"),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text.rich(
                          textDirection: TextDirection.rtl,
                          TextSpan(children: [
                        TextSpan(text: " اسم المنتج : ", style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold)),
                        TextSpan(text: " ${cubit.searchproduct!.title}", style: TextStyle(color: Colors.blueAccent,fontSize: 20)),
                      ])),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text.rich(
                          textDirection: TextDirection.rtl,
                          TextSpan(children: [
                        TextSpan(text: "سعر المنتج : ", style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold)),
                        TextSpan(text: " ${cubit.searchproduct!.price}", style: TextStyle(color: Colors.blueAccent,fontSize: 20)),
                      ])),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text.rich(
                          textDirection: TextDirection.rtl,
                          TextSpan(children: [
                        TextSpan(text: " تاريخ الانشاء:  : ", style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold)),
                        TextSpan(text: " ${cubit.searchproduct!.createdAt}", style: TextStyle(color: Colors.blueAccent,fontSize: 20)),
                      ])),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text.rich(
                          textDirection: TextDirection.rtl,
                          TextSpan(children: [
                        TextSpan(text: " اخر تحديث : ", style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold)),
                        TextSpan(text: " ${cubit.searchproduct!.updatedAt}", style: TextStyle(color: Colors.blueAccent,fontSize: 20)),
                      ])),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text(
                        "وصف المنتج",
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                    ),
                   Padding(
                     padding: const EdgeInsets.only(top: 5,right: 20),
                     child: Text.rich(

                         TextSpan(
                         text: "${cubit.searchproduct!.description}",
                         style: TextStyle(fontSize: 18),
                       ),
                       style: TextStyle(
                         color:Colors.blueAccent
                       ),
                       textDirection: TextDirection.rtl,

                     ),
                   ),
                    SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                          builder: (context) {
                            return BuildScan();
                          },
                        ), (route) => false);
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
              ),
            );
          } else if (state is ErrorSearch) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(state.error),
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                        builder: (context) {
                          return BuildScan();
                        },
                      ), (route) => false);
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
