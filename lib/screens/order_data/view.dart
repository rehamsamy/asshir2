import 'package:asshir/helper/core_classes/app_theme.dart';
import 'package:asshir/helper/core_classes/pusher.dart';
import 'package:asshir/helper/custom_widgets/app_bar.dart';
import 'package:asshir/helper/custom_widgets/btns.dart';
import 'package:asshir/helper/custom_widgets/text_form_fields.dart';
import 'package:asshir/screens/orders/view.dart';
import 'package:asshir/screens/update_profile/view.dart';
import 'package:flutter/material.dart';

class OrderDataView extends StatefulWidget {
  final String? userType;
  const OrderDataView({Key? key, this.userType}) : super(key: key);

  @override
  State<OrderDataView> createState() => _OrderDataViewState();
}

class _OrderDataViewState extends State<OrderDataView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, "البيانات طلب الخدمة",
          action: Icon(Icons.notification_add,color: Colors.black,size: 40,) ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10,),
                Text('بيانات المقدم',style: AppTheme.basicPrimaryStyle,),
                SizedBox(height: 15,),
                Text('اسم الموظف',style: AppTheme.labelTextFieldStyle,),
                textFormField(
                    labelText: 'ادخل اسم الموظف',
                ),
                SizedBox(height: 10,),
                Text('رقم الموظف',style: AppTheme.labelTextFieldStyle,),
                textFormField(
                  labelText: 'ادخل ر قم الموظف',
                ),
                SizedBox(height: 20,),
                Text('بيانات الشركة',style: AppTheme.basicPrimaryStyle,),
                SizedBox(height: 20,),
                Text('اسم الشركه',style: AppTheme.labelTextFieldStyle,),
                textFormField(
                  labelText: 'ادخل اسم الشركه',
                ),
                SizedBox(height: 10,),
                Text('رقم السجل التجاري للشركه',style: AppTheme.labelTextFieldStyle,),
                textFormField(
                  labelText: 'ادخل رقم السجل التجاري للشركه',
                ),
                SizedBox(height: 10,),
                Text('نوع الشركه',style: AppTheme.labelTextFieldStyle,),
                textFormField(
                  labelText: 'ادخل نوع الشركه',
                ),
                SizedBox(height: 10,),
                Text('المدينه',style: AppTheme.labelTextFieldStyle,),
                textFormField(
                  labelText: 'ادخل المدينه',
                ),

                SizedBox(height: 20,),
                Text('بيانات طلب العمال/ة',style: AppTheme.basicPrimaryStyle,),
                SizedBox(height: 20,),
                Text('عدد العماله المطلوبه',style: AppTheme.labelTextFieldStyle,),
                textFormField(
                  labelText: 'ادخل عدد العماله المطلوبه',
                ),
                SizedBox(height: 10,),
                Text('الجنس',style: AppTheme.labelTextFieldStyle,),
                textFormField(
                  labelText: 'تحديد الجنس',
                ),
                SizedBox(height: 10,),
                Text('مكان العمل',style: AppTheme.labelTextFieldStyle,),
                textFormField(
                  labelText: 'ادخل مكان العمل',
                ), SizedBox(height: 10,),
                Text('تاريخ بدايه العمل',style: AppTheme.labelTextFieldStyle,),
                textFormField(
                  labelText: 'ادخل تاريخ بدايه العمل',
                ), SizedBox(height: 10,),
                Text('تاريخ  نهايه العمل',style: AppTheme.labelTextFieldStyle,),
                textFormField(
                  labelText: 'ادخل تاريخ نهايه العمل',
                ),
                SizedBox(height: 10,),
                Text('الراتب المحدد',style: AppTheme.labelTextFieldStyle,),
                textFormField(
                  labelText: 'ادخل الراتب المحدد',
                ),


                SizedBox(height: 40,),

                PublicButton(txt: 'تاكيد البيانات',
                    onTap: (){}, height: 60, color: AppTheme.primaryColor1),
                SizedBox(height: 20,),
              ],
            ),
          ),
        )
      ),


    );
  }

}
