import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:the_key_to/model/product_model.dart';
import 'package:the_key_to/resources/cloudfirestore_methods.dart';
import 'package:the_key_to/screens/product_detail_screen.dart';
import 'package:the_key_to/utils/constants.dart';
import 'package:the_key_to/utils/utils.dart';

class SimpleProductWidget extends StatefulWidget {
  final ProductModel productModel;
  const SimpleProductWidget({
    Key? key,
    required this.productModel,
  }) : super(key: key);

  @override
  State<SimpleProductWidget> createState() => _SimpleProductWidgetState();
}

class _SimpleProductWidgetState extends State<SimpleProductWidget> {
  CollectionReference favoriteCnt = FirebaseFirestore.instance.collection('notes');
  bool favorite = false;  
  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    ProductDetailScreen(productModel: widget.productModel)));
      },
      child: Column(
        children: [
          Divider(
            color: Colors.grey[200],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 15),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: appAccentColor,
                      ),
                      width: screenSize.width * 0.44,
                      height: screenSize.width * 0.54,
                    ),
                    Container(
                      //이미지가 들어갈 상자
                      width: screenSize.width * 0.4,
                      height: screenSize.width / 2,
                      child: Image.network(widget.productModel.url, fit: BoxFit.cover),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: screenSize.width * 0.02,
                  ),
                  SizedBox(
                      width: screenSize.width * 0.45,
                      height: screenSize.width * 0.1,
                      child: Text(
                        widget.productModel.productName,
                        style: TextStyle(
                            fontFamily: "Dalseo",
                            fontWeight: FontWeight.w300,
                            fontSize: 18),
                        overflow: TextOverflow.fade,
                        maxLines: 1,
                        softWrap: false,
                      )),
                  SizedBox(
                      height: screenSize.width * 0.1,
                      child: const Text(
                        "제작자 이름",
                        style: TextStyle(
                            fontFamily: "Dalseo",
                            fontWeight: FontWeight.w300,
                            fontSize: 12),
                      )),
                  SizedBox(
                      height: screenSize.width * 0.1,
                      child: Text(
                        "₩ ${widget.productModel.cost}",
                        style: TextStyle(
                            fontFamily: "Dalseo",
                            fontWeight: FontWeight.w900,
                            fontSize: 20),
                      )),
                  Container(
                    width: screenSize.width * 0.47,
                    height: screenSize.height * 0.1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: InkWell(
                            child: favorite ? const Icon(Icons.favorite, color: Colors.red,) : const Icon(Icons.favorite_border),
                            onTap: () async{
                                final output = await CloudFirestoreClass_().userFavorite(widget.productModel);
                                if(output == "찜 성공"){
                                  setState(() {
                                    favorite = true;
                                  });
                                }
                                else{
                                  setState(() {
                                    favorite = false;
                                  });
                                }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}