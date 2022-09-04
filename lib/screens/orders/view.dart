import 'package:asshir/helper/core_classes/app_theme.dart';
import 'package:asshir/helper/core_classes/pusher.dart';
import 'package:asshir/helper/custom_widgets/app_bar.dart';
import 'package:asshir/helper/custom_widgets/btns.dart';
import 'package:asshir/helper/custom_widgets/text_form_fields.dart';
import 'package:asshir/screens/orders/widgets/order_item.dart';
import 'package:asshir/screens/update_profile/view.dart';
import 'package:flutter/material.dart';

class OrdersView extends StatefulWidget {
  final String? userType;
  const OrdersView({Key? key, this.userType}) : super(key: key);

  @override
  State<OrdersView> createState() => _OrdersViewState();
}

class _OrdersViewState extends State<OrdersView>   with SingleTickerProviderStateMixin{
  TabController ?_tabController;
  bool isNext=false;
  int index=0;

  @override
  void initState() {
    _tabController = new TabController(length: 4, vsync: this);
    _tabController?.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: appBar(context, "الطلبات", action: Icon(Icons.notification_add,color: Colors.black,
          size: 30,)),
        body: Column(
          children:  [
            SizedBox(height: 30,),
           Container(
             margin: EdgeInsets.symmetric(horizontal: 15),
             height: 40,
             decoration: BoxDecoration(
               color: Colors.grey.shade300,
               borderRadius: BorderRadius.circular(10)
             ),
             child:  TabBar(
               onTap: (ind){
                 setState(() {
                   index=ind;
                 });
               },
               controller: _tabController,
              indicator:  BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                  color:index==_tabController?.index?
                  AppTheme.primaryColor1:Colors.grey,),
                 labelColor: Colors.white,
                 unselectedLabelColor: Colors.black,
                 tabs: [
                Tab(
                 text: 'الحالية',

                ),
                Tab(
                  text: 'القادمه',
                ),
                Tab(
                  text: 'السابقه',
                ),
                Tab(
                  text: 'الملغية',
                )
              ]),
           ),
            Expanded(child: TabBarView(
              controller: _tabController,
                children: [
              Container(
                  height: 150,
                  child: ListView.builder(
                      itemBuilder: (_, index) => OrderItem(150))),
                  Container(
                      height: 150,
                      child: ListView.builder(itemBuilder: (_,index)=>OrderItem(150))),

                  Container(
                      height: 150,
                      child: ListView.builder(itemBuilder: (_,index)=>OrderItem(150))),

                  Container(
                      height: 150,
                      child: ListView.builder(itemBuilder: (_,index)=>OrderItem(150))),

                ])),

          ],
        ),
        floatingActionButton:Container(
          width: 75,
          height: 75,
          child: Card(
            elevation: 10,
            color: AppTheme.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
            ),
            child: Card(
              elevation: 10,
              child: Icon(Icons.call,color: Colors.white,),
              color: AppTheme.darkPrimaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
              ),
            ),
          ),

        ),
        drawer: Drawer(),
      ),
    );
  }

}
