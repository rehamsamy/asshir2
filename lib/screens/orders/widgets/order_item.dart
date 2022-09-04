import 'package:asshir/helper/core_classes/app_theme.dart';
import 'package:asshir/helper/core_classes/pusher.dart';
import 'package:asshir/helper/custom_widgets/btns.dart';
import 'package:asshir/screens/order_details/view.dart';
import 'package:flutter/material.dart';

class OrderItem extends StatelessWidget {

double ?height;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        push(OrderDetailsView());
      },
      child: Container(
        height: height,
        margin: EdgeInsets.all(10),
      //  padding: EdgeInsets.only(top: 15,right: 4,),
        decoration: BoxDecoration(
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Card(
            elevation: 10,
            shape:const Border(
                right: BorderSide(color: Colors.grey, width: 1),
              left: BorderSide(color: Colors.grey, width: 1),
              top: BorderSide(color: Colors.grey, width: 1),
              bottom: BorderSide(color: Colors.grey, width: 1),
            ),
            child: Padding(
              padding: EdgeInsets.only(top: 15,right: 10,),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children:const [
                          Text('رقم الطلب :1234568',style: AppTheme.subtitle,),
                          SizedBox(height: 10,),
                          Text('خدمه التنظيف المنزلي',style: AppTheme.baseTextColor,),
                          Text('وصف بسيط للخدمة',style: AppTheme.subtitle,),
                        ],
                    ),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                          padding:EdgeInsets.only(left: 15,top: 5),child: Text('22/08/2022')),
                      PublicButton(txt: 'الغاء طلب الخدمة',
                          onTap: (){}, height: 35, color: AppTheme.primaryColor1)
                    ],
                  )
              ]
                  ),
            ),
          ),
        ),



      ),
    );
  }

OrderItem(this.height);
}
