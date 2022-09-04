import 'package:asshir/helper/core_classes/app_theme.dart';
import 'package:asshir/helper/core_classes/pusher.dart';
import 'package:asshir/helper/custom_widgets/btns.dart';
import 'package:asshir/screens/my_account/view.dart';
import 'package:asshir/screens/order_data/view.dart';
import 'package:asshir/screens/order_details/view.dart';
import 'package:asshir/screens/orders/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeOrderItem extends StatelessWidget {
  const HomeOrderItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   GestureDetector(
      onTap: (){},
      child: Container(
        // height: 15,
        margin: EdgeInsets.all(8),
        //padding: EdgeInsets.only(right: 10,top: 20),
        child:Card(
          elevation: 10,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(height: 20,),
              Row(
                children: [
                  SvgPicture.asset('assets/images/clock.svg',
                    width: 60,height: 60,),
                  Column(
                    children: [
                      Text('عماله منزلية بالساعة',style: AppTheme.labelTextFieldStyle,),
                      Text('توفير عماله بنظام الساعات',style: AppTheme.subTitleStyle,),
                      Text('وبحسب الوقت الماسب لكم',style: AppTheme.subTitleStyle,)
                    ],
                  )
                ],
              ),
              SizedBox(height: 20,),
              Container(
                  width: 200,
                  child:
                  PublicButton(
                      txt: 'اطلب الخدمه الان',
                      onTap: () {
                        push(OrderDataView());
                      },
                      height: 35,
                      color: AppTheme.primaryColor1))
            ],
          ),
        ),
      ),
    );
  }
}
