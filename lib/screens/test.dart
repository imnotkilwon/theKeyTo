import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_key_to/model/product_model.dart';
import 'package:the_key_to/resources/cloudfirestore_methods.dart';
import 'package:the_key_to/utils/constants.dart';
import 'package:the_key_to/utils/utils.dart';

class TestPage extends StatefulWidget {
  final String url;
  final String productName;
  final String context;
  final String sellerName;

  //리뷰 점수도 추가해야함
  final int cost;

  const TestPage(
      {Key? key,
      required this.url,
      required this.productName,
      required this.context,
      required this.sellerName,
      required this.cost})
      : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.chevron_left),
            onPressed: () {
              Get.back();
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left:18.0,right: 18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: screenSize.height * 0.3,
                  child: Image.network(widget.url, fit: BoxFit.fitHeight),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(onTap: (){},child: Text("${widget.sellerName} >",style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300,fontFamily: "Dalseo",color: appAccentColor),)),
                    Row(
                      children: [
                        IconButton(onPressed: (){}, icon: Icon(Icons.favorite_border)),
                        IconButton(onPressed: (){}, icon: Icon(Icons.share)),
                      ],
                    )
                  ],
                ),
                Divider(color: appAccentColor,),
                Text(widget.productName,style: TextStyle(fontSize: 21, fontWeight: FontWeight.w700,fontFamily: "NotoSans",color: Colors.white),),
                SizedBox(height: 20.0,),
                Text("${widget.cost} 원",style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300,fontFamily: "NotoSans",color: appAccentColor),),
                SizedBox(height: 30.0,),
                Text(widget.context,style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500,fontFamily: "NotoSans",color: Colors.white),),
              ],
            ),
          ),
        ),);
  }
}
