import 'package:asshir/helper/core_classes/app_theme.dart';
import 'package:asshir/helper/core_classes/pusher.dart';
import 'package:asshir/helper/custom_widgets/app_bar.dart';
import 'package:asshir/helper/custom_widgets/btns.dart';
import 'package:asshir/helper/custom_widgets/text_form_fields.dart';
import 'package:asshir/screens/order_data/view.dart';
import 'package:asshir/screens/orders/view.dart';
import 'package:asshir/screens/update_profile/view.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class OrderDetailsView extends StatefulWidget {
  final String? userType;
  const OrderDetailsView({Key? key, this.userType}) : super(key: key);

  @override
  State<OrderDetailsView> createState() => _HomeViewState();
}

class _HomeViewState extends State<OrderDetailsView> {
bool  isNext=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, "تفاصيل الطلب",action: Icon(Icons.notification_add,color: Colors.black,
          size: 30,)),
      body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                //height: 270,
                margin: EdgeInsets.all(10),
                child: Card(
                  elevation: 15,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text('رقم الطلب :1234568', style: AppTheme
                                .subtitle,),
                            Text('22/08/2022')
                          ],
                        ),
                        const SizedBox(height: 15,),
                        const Text('خدمه التنظيف المنزلي',
                          style: AppTheme.baseTextColor,),
                        const SizedBox(height: 15,),
                        const Text(
                          'هذا النص افتراض -هذا النص افتراض -هذا النص افتراض -'
                          , overflow: TextOverflow.ellipsis,),
                        Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              customRichTxt('اسم الموظف : ', 'عبدالله'),
                              customRichTxt('رقم الموظف :', '123'),
                              customRichTxt('اسم الشركه :', 'الامان للتنظيف'),
                              customRichTxt(' رقم السجل التجاري :', ' الامان للتنظيف'),
                              customRichTxt('تاريخ بداية العمل :', '5/5/22'),
                              customRichTxt('تاريخ نهاية العمل :', '5/5/22'),
                            ],
                          ),
                        ),
                        Container(
                              height: 140,
                              child:   CustomPaint(
                                  size: Size(1, double.infinity,),
                                  painter: DashedLineVerticalPainter()
                              )
                              ,
                            )
                            ,SizedBox(width: 20,),
                            Expanded(
                              flex: 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  customRichTxt(' المدينه: ', 'الرياض'),
                                  customRichTxt(' عدد العمال:5', 'افراد'),
                                  customRichTxt(' نوع العمل:', 'تنظيف'),
                                  customRichTxt(' نوع العمل:', ' خاص'),
                                  customRichTxt(' نوع الشركه: ', 'للخدمات'),
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 20,)

                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 70,),

          Row(
            children: [
              Expanded(child:
              customOrderButton( "تتبع الطلب", () {
                setState(() {
                  isNext = true;
                });
              },isNext?AppTheme.primaryColor1:Colors.white,
                  isNext ? Colors.white : AppTheme.primaryColor1,
                  isNext ? Colors.white : Colors.black,
                ),
              ),
              Expanded(
                child: customOrderButton(
                  "الغاء الطلب",
                  () {
                    setState(() {
                      isNext = false;
                    });
                  },
                  isNext ?  Colors.white:AppTheme.primaryColor1 ,
                  isNext ?  AppTheme.primaryColor1:Colors.white ,
                  isNext ?  Colors.black:Colors.white ,
                ),
              )
            ],
          ),

          // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 10),
              //   child: PublicButton(txt: 'تتبع الطلب',
              //       onTap: () {
              //         push(OrderDataView());
              //       }, height: 60, color: AppTheme.primaryColor),
              // )
            ],
          )

      ),

    );
  }


  customOrderButton(String txt,dynamic tab,Color contColor,Color borderColor, Color txtColor){
    print('is next '+isNext.toString());
    return Container(
      margin: EdgeInsets.all(10),
      child: GestureDetector(
        onTap: tab,
        child: Material(
          elevation: .3,
          borderRadius: BorderRadius.circular(8),
          child: Container(
            // width: percent == null
            //     ? MediaQuery.of(context).size.width * .65
            //     : MediaQuery.of(context).size.width * percent!,
            height: 50,
            decoration: BoxDecoration(
              color: contColor,
              //AppTheme.primaryColor,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: borderColor,
              )
            ),
            child: Center(
              child: Text(
                txt!,
                style:  TextStyle(
                   color: txtColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w800),
              ).tr(),
            ),
          ),
        ),
      ),
    );
  }


  customRichTxt(String txt1, String txt2) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: txt1,
            style: TextStyle(color: Colors.grey, fontSize: 13),
          ),
          TextSpan(
            text: txt2,
            style: TextStyle(color: Colors.black, fontSize: 14),
          ),
        ],
      ),
    );
  }


}

class DashedLineVerticalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double dashHeight = 5, dashSpace = 3, startY = 0;
    final paint = Paint()
      ..color = Colors.grey[500]!
      ..strokeWidth = 1;
    while (startY < size.height) {
      canvas.drawLine(Offset(0, startY), Offset(0, startY + dashHeight), paint);
      startY += dashHeight + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}





