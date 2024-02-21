import 'package:Alaqsa/Core/utils/Const.dart';
import 'package:Alaqsa/Features/HomeScreen/Presentation/Manager/SearchProduct/search_product_cubit.dart';
import 'package:Alaqsa/Features/HomeScreen/Presentation/Manager/SearchProduct/search_product_state.dart';
import 'package:Alaqsa/Features/HomeScreen/Presentation/View/SearchProduct/Screens/BuildScanBarCode.dart';
import 'package:flutter/material.dart';
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
    SearchProductCubit.get(context).getSearchProduct(widget.barcode, context);
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<SearchProductCubit, SearchProductState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = SearchProductCubit.get(context);

          if (state is SuccessSearch) {
            final adminId = cubit.searchproduct!.adminId;
            final currentUserId = AppConstant.userid;
// ToDo: Figure out whuy userId is always null?!
            if (adminId == currentUserId) {
              if (cubit.searchproduct != null) {
                return SafeArea(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        const Align(
                          alignment: Alignment.center,
                          child: Text(
                            "تفاصيل المنتج",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        ImageContainer(),
                        textSpan(
                            title: " اسم المنتج : ",
                            data: " ${cubit.searchproduct!.title ?? ""}"),
                        textSpan(
                            title: "سعر المنتج : ",
                            data: " ${cubit.searchproduct!.price ?? ""}"),
                        textSpan(
                            title: " تاريخ الانشاء: ",
                            data: " ${cubit.searchproduct!.createdAt ?? ""}"),
                        textSpan(
                            title: " اخر تحديث : ",
                            data: " ${cubit.searchproduct!.updatedAt ?? ""}"),
                        const Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Text(
                            "وصف المنتج",
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                        ),
                        textSpan(
                            data: "${cubit.searchproduct?.description ?? ""}"),
                        const SizedBox(
                          height: 20,
                        ),
                        buttonBack()
                      ],
                    ),
                  ),
                );
              } else {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        "لا يوجد لديك منتجات ",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    buttonBack()
                  ],
                );
              }
            } else {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      "لا يوجد لديك منتجات ",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  buttonBack()
                ],
              );
            }
          } else if (state is CacheSuccess) {
            if (AppConstant.userid == cubit.allProduct!.adminId) {
              if (cubit.allProduct != null) {
                return SafeArea(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "تفاصيل المنتج",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        ImageContainer(),
                        textSpan(
                            title: " اسم المنتج : ",
                            data: " ${cubit.allProduct?.title ?? ""}"),
                        textSpan(
                            title: "سعر المنتج : ",
                            data: " ${cubit.allProduct?.price ?? ""}"),
                        textSpan(
                            title: " تاريخ الانشاء:  : ",
                            data: " ${cubit.allProduct?.createdAt ?? ""}"),
                        textSpan(
                            title: " اخر تحديث : ",
                            data: " ${cubit.allProduct?.updatedAt ?? ""}"),
                        const Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Text(
                            "وصف المنتج",
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                        ),
                        textSpan(
                            data: "${cubit.allProduct?.description ?? ""}"),
                        const SizedBox(
                          height: 20,
                        ),
                        buttonBack()
                      ],
                    ),
                  ),
                );
              } else {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        "لا يوجد لديك منتجات ",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    buttonBack()
                  ],
                );
              }
            } else {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      "لا يوجد لديك منتجات ",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  buttonBack()
                ],
              );
            }
          } else if (state is ErrorSearch) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    "لا يوجد لديك منتجات ",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                buttonBack()
              ],
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget textSpan({String? title, required String data}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text.rich(
          textDirection: TextDirection.rtl,
          TextSpan(children: [
            TextSpan(
                text: title,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
            TextSpan(
                text: data,
                style: TextStyle(color: Colors.blueAccent, fontSize: 20)),
          ])),
    );
  }

  Widget buttonBack() {
    return InkWell(
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
    );
  }

  Widget ImageContainer() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 3,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("Assets/Images/6770245.png"),
        ),
      ),
    );
  }
}
