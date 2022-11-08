import 'package:flutter/material.dart';
import 'package:the_key_to/model/product_model.dart';
import 'package:the_key_to/screens/product_detail_screen.dart';
import 'package:the_key_to/utils/constants.dart';
import 'package:the_key_to/utils/utils.dart';

class SimpleProductWidget extends StatelessWidget {
  final ProductModel productModel;
  const SimpleProductWidget({
    Key? key,
    required this.productModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    ProductDetailScreen(productModel: productModel)));
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
                      child: Image.network(productModel.url, fit: BoxFit.cover),
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
                        productModel.productName,
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
                      child: Text(
                        "제작자 이름",
                        style: TextStyle(
                            fontFamily: "Dalseo",
                            fontWeight: FontWeight.w300,
                            fontSize: 12),
                      )),
                  SizedBox(
                      height: screenSize.width * 0.1,
                      child: Text(
                        "₩ ${productModel.cost}",
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
                            child: Icon(Icons.favorite_border),
                            onTap: () {},
                          ),
                        ),
                        Text(
                          "${productModel.favorite}",
                          style: TextStyle(
                              fontFamily: "Dalseo",
                              fontWeight: FontWeight.w300,
                              fontSize: 20),
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