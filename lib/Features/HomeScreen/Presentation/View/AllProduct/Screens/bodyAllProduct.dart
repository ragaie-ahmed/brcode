import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterscanner/Features/HomeScreen/data/Model/AllProduct.dart';

class BodyAllProduct extends StatelessWidget {
  BodyAllProduct({super.key, required this.allProduct});

  AllProduct allProduct;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SizedBox(
            height: 60,
            child: Card(
              color: Colors.white60,
              child: Column(
                children: [
                  Text(
                    "${allProduct.title}",
                    style: const TextStyle(overflow: TextOverflow.ellipsis),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          width: 100,
                          child: Text(
                            "createdAt ${allProduct.createdAt}",
                            overflow: TextOverflow.ellipsis,
                          )),
                      SizedBox(
                          width: 80,
                          child: Text(
                            "update ${allProduct.updatedAt}",
                            overflow: TextOverflow.ellipsis,
                          )),
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned(
              top: 60,
              child: Container(
                width: 100,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image:const DecorationImage(
                      image: AssetImage("Assets/Images/images.jpg")),
                ),
              ))
        ],
      ),
    );
  }
}
