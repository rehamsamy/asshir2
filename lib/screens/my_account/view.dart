import 'package:asshir/helper/core_classes/app_theme.dart';
import 'package:asshir/helper/core_classes/pusher.dart';
import 'package:asshir/helper/custom_widgets/app_bar.dart';
import 'package:asshir/helper/custom_widgets/btns.dart';
import 'package:asshir/helper/custom_widgets/text_form_fields.dart';
import 'package:asshir/screens/orders/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../helper/custom_widgets/images_container.dart';

class MyAccountView extends StatefulWidget {
  final String? userType;
  const MyAccountView({Key? key, this.userType}) : super(key: key);

  @override
  State<MyAccountView> createState() => _MyAccountViewState();
}

class _MyAccountViewState extends State<MyAccountView> {
  bool  isNext=false;
  int indexFlag=0;
    @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: appBar(context, "حسابى" ),
      body:Column(
        children: [
          SizedBox(
            height: 40,
          ),
          Expanded(
            child: ListView.builder(itemCount: 4,
              itemBuilder: (_,index) {
              String txt=index==0?'معلوماتي الشخصية':index==1?'الطلبات':index==2?'اللغة':'من نحن';
                 return buildMyAccountContainer(txt,(){},index);
                }),
          ),
        ],
      ),
      drawer: Drawer(),
    );
  }


  buildMyAccountContainer(String txt,dynamic tab,int index,){
    return GestureDetector(
      onTap: (){
        setState(() {
          setState(() {
            indexFlag=index;
          });
        });
        if(index==1){
          push(OrdersView());
        }
      },
      child: Container(
        height: 80,
        padding: EdgeInsets.all(5),
        margin: EdgeInsets.only(top: 5,left: 10,right: 10),
        child: Card(
          elevation: 8,
            color:index==indexFlag?AppTheme.primaryColor1:Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:[
                Text(txt,style: TextStyle(fontSize: 16,
                color:index==indexFlag?Colors.white:Colors.black,),),
                Stack(
                  children: [
                    Container(
                    width: 25,
                    height: 25,
                    decoration:  BoxDecoration(
                      shape: BoxShape.circle,
                      color:index==indexFlag?Colors.white:Colors.grey,)),
                     Positioned(
                       top: 3,
                         right: 6,
                         child: Icon(Icons.arrow_back_ios,size: 17,color:index==indexFlag?AppTheme.primaryColor1:Colors.white ,)),
                  ],
                )
              ]

            ),
          ),
        ),
      ),
    );
  }



}
