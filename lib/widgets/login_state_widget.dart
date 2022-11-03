import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_key_to/resources/cloudfirestore_methods.dart';
import 'package:the_key_to/screens/sign_in_screen.dart';

class LoginStateWidget extends StatefulWidget {

  const LoginStateWidget({Key? key}) : super(key: key);

  @override
  State<LoginStateWidget> createState() => _LoginStateWidgetState();
}

class _LoginStateWidgetState extends State<LoginStateWidget> {

  void update() {
    return setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    final bool isLogined = FirebaseAuth.instance.currentUser != null;//로그인 되어 있으면 true, 안 되어 있으면 false
    return Container(
      child: isLogined ? Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              Container(
                width: 20,
                height: 20,
                child: Image.asset("assets/images/user_profile.jpg"),
              ),
              Text("${CloudFirestoreClass_().readData("FirebaseAuth.instance.currentUser!.uid")?["name"]}",

                  //지금은 이메일인데 database uid 연동으로 이름 갖고오기
                  style:
                  const TextStyle(fontFamily: "NotoSans",fontWeight: FontWeight.w500),),
              const SizedBox(
                width: 10,
              ),
            ],
          ),
          IconButton(
            onPressed: () {
              setState(() {
                FirebaseAuth.instance.signOut();
                update();
              });
            },
            icon: Icon(Icons.logout_outlined),
          ),
        ],
      ):GestureDetector(
        onTap: (){
          Get.to(()=>SignInScreen());
        },
        child: Container(
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //로그인 안 되어 있을 때,
            children: [
              Text("로그인이 필요합니다."),
              Icon(Icons.keyboard_arrow_right_rounded),
            ],
          ),
        ),
      ),
    );
  }
}