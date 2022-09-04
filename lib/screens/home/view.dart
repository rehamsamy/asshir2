import 'package:asshir/helper/core_classes/app_theme.dart';
import 'package:asshir/helper/core_classes/pusher.dart';
import 'package:asshir/helper/custom_widgets/app_bar.dart';
import 'package:asshir/helper/custom_widgets/btns.dart';
import 'package:asshir/helper/custom_widgets/text_form_fields.dart';
import 'package:asshir/screens/home/widgets/home_order_item.dart';
import 'package:asshir/screens/my_account/view.dart';
import 'package:asshir/screens/orders/view.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../helper/custom_widgets/images_container.dart';

class HomeView extends StatefulWidget {
  final String? userType;

  const HomeView({Key? key, this.userType}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool isNext = false;
  List<String> images=['https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
  'https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
  'https://media.istockphoto.com/id/615522818/photo/fruits-and-vegetables-overhead-assortment-on-colorful-background.webp?s=612x612&w=is&k=20&c=nuPhq2PS8QbxGDMv2FKz9HpmFIXdDxL_9acVdtp2DCY=',
  'https://image.shutterstock.com/image-photo/selection-healthy-food-600w-540997561.jpg'];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    Widget leading=  Builder(builder: (context) => // Ensure Scaffold is in context
    IconButton(
    icon: Icon(Icons.menu),
    onPressed: () => Scaffold.of(context).openDrawer()
    ),
    );
    return SafeArea(
      child: Scaffold(
        appBar: appBar(context, "الخدمات حاضر المميزة",leading: false),
        body: CustomScrollView(
          slivers: [
           SliverAppBar(
             expandedHeight: 220.0,
               floating: true,
               pinned: true,
               snap: true,
               flexibleSpace: Stack(
                         children: [
                           Container(
                               color: AppTheme.primaryColor1,
                               margin: EdgeInsets.all(10),
                               height: 200,
                               child: Opacity(
                                 opacity: 0.5,
                                 child: Image.asset(
                                   'assets/images/home_img.png',
                                   fit: BoxFit.fill,
                                 ),
                               )),
                           Positioned(
                             top: 30,
                             bottom: 20,
                             right: 30,
                             child: Wrap(
                               direction: Axis.vertical,
                               children: const [
                                 Text(
                                   'كل ما تحتاجه',
                                   style: TextStyle(color: Colors.white),
                                 ),
                                 Text(
                                   'تحتاجه هنا مع',
                                   style: TextStyle(color: Colors.white),
                                 ),
                                 Text(
                                   'خدمة 24 ساعة',
                                   style: TextStyle(color: Colors.white),
                                 ),
                               ],
                             ),
                           )
                         ],
                       ),
           ),
           SliverList(
                delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                    return  HomeOrderItem();
                  },
                  childCount:2,
                ),

            ),

            SliverList(
              delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return  Column(
                    children: [
                      SizedBox(height: 20,),
                      CarouselSlider(
                        options: CarouselOptions(height: 150.0,
                            aspectRatio: 0.8,
                            autoPlay: true,
                            enlargeCenterPage: true),
                        items: images.map((i) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Container(
                                  width: MediaQuery.of(context).size.width,
                                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                                  child: Image.network(i,fit: BoxFit.cover,)
                              );
                            },
                          );
                        }).toList(),
                      ),
                    ],
                  );
                },
                childCount:1,
              ),

            ),

                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      Text(
                        'كن علي تواصل معنا',
                        style: AppTheme.labelTextFieldStyle,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/images/call.svg',
                            width: 40,
                            height: 40,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          SvgPicture.asset(
                            'assets/images/twitter.svg',
                            width: 40,
                            height: 40,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          SvgPicture.asset(
                            'assets/images/whatsapp.svg',
                            width: 40,
                            height: 40,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          SvgPicture.asset(
                            'assets/images/tiktok.svg',
                            width: 40,
                            height: 40,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          SvgPicture.asset(
                            'assets/images/insta.svg',
                            width: 40,
                            height: 40,
                          )
                        ],
                      )
                    ],
                  ),
                ),


          ],
        ),
        // SingleChildScrollView(
        //     child: Column(
        //   children: [
        //     SizedBox(
        //       height: 30,
        //     ),
        //     Container(
        //       child: Stack(
        //         children: [
        //           Container(
        //               color: AppTheme.primaryColor1,
        //               margin: EdgeInsets.all(10),
        //               height: 200,
        //               child: Opacity(
        //                 opacity: 0.5,
        //                 child: Image.asset(
        //                   'assets/images/home_img.png',
        //                   fit: BoxFit.fill,
        //                 ),
        //               )),
        //           Positioned(
        //             top: 30,
        //             bottom: 20,
        //             right: 30,
        //             child: Wrap(
        //               direction: Axis.vertical,
        //               children: const [
        //                 Text(
        //                   'كل ما تحتاجه',
        //                   style: TextStyle(color: Colors.white),
        //                 ),
        //                 Text(
        //                   'تحتاجه هنا مع',
        //                   style: TextStyle(color: Colors.white),
        //                 ),
        //                 Text(
        //                   'خدمة 24 ساعة',
        //                   style: TextStyle(color: Colors.white),
        //                 ),
        //               ],
        //             ),
        //           )
        //         ],
        //       ),
        //     ),
        //     Container(
        //         height: 300,
        //         margin: EdgeInsets.all(5),
        //         child: ListView.builder(
        //             itemCount: 5, itemBuilder: (_, index) => HomeOrderItem())),
        //     CarouselSlider(
        //       options: CarouselOptions(height: 150.0,
        //       aspectRatio: 0.8,
        //       autoPlay: true,
        //       enlargeCenterPage: true),
        //       items: images.map((i) {
        //         return Builder(
        //           builder: (BuildContext context) {
        //             return Container(
        //                 width: MediaQuery.of(context).size.width,
        //                 margin: EdgeInsets.symmetric(horizontal: 5.0),
        //                 child: Image.network(i,fit: BoxFit.cover,)
        //             );
        //           },
        //         );
        //       }).toList(),
        //     ),
        //     SizedBox(
        //       height: 40,
        //     ),
        //     Text(
        //       'كن علي تواصل معنا',
        //       style: AppTheme.labelTextFieldStyle,
        //     ),
        //     SizedBox(
        //       height: 15,
        //     ),
        //     Row(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       children: [
        //         SvgPicture.asset(
        //           'assets/images/call.svg',
        //           width: 40,
        //           height: 40,
        //         ),
        //         SizedBox(
        //           width: 10,
        //         ),
        //         SvgPicture.asset(
        //           'assets/images/twitter.svg',
        //           width: 40,
        //           height: 40,
        //         ),
        //         SizedBox(
        //           width: 10,
        //         ),
        //         SvgPicture.asset(
        //           'assets/images/whatsapp.svg',
        //           width: 40,
        //           height: 40,
        //         ),
        //         SizedBox(
        //           width: 10,
        //         ),
        //         SvgPicture.asset(
        //           'assets/images/tiktok.svg',
        //           width: 40,
        //           height: 40,
        //         ),
        //         SizedBox(
        //           width: 10,
        //         ),
        //         SvgPicture.asset(
        //           'assets/images/insta.svg',
        //           width: 40,
        //           height: 40,
        //         )
        //       ],
        //     )
        //   ],
        // )),
        // floatingActionButton: InkWell(
        //   onTap: () => push(MyAccountView()),
        //   child: Container(
        //     width: 75,
        //     height: 75,
        //     child: Card(
        //       elevation: 10,
        //       color: AppTheme.white,
        //       shape: RoundedRectangleBorder(
        //         borderRadius: BorderRadius.circular(50.0),
        //       ),
        //       child: Card(
        //         elevation: 10,
        //         child: Icon(
        //           Icons.call,
        //           color: Colors.white,
        //         ),
        //         color: AppTheme.darkPrimaryColor,
        //         shape: RoundedRectangleBorder(
        //           borderRadius: BorderRadius.circular(50.0),
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
          drawerEnableOpenDragGesture: false,
        drawer: Drawer(
          child:
          ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
          const DrawerHeader(
          decoration: BoxDecoration(
          color: Colors.deepOrangeAccent,
          ),
          child: Text('Drawer Header'),
        ),
          ListTile(
            leading: Icon(
              Icons.home,
            ),
            title: const Text('حسابي'),
            onTap: () {
              push(MyAccountView());
            },
          ),
          ListTile(
            leading: Icon(
              Icons.train,
            ),
            title: const Text('من نحن'),
            onTap: () {
              push(OrdersView());
            },
          ),
              ListTile(
                leading: Icon(
                  Icons.train,
                ),
                title: const Text('الطلبات'),
                onTap: () {
                 push(OrdersView());
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.train,
                ),
                title: const Text('الاشعارات'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.train,
                ),
                title: const Text('تسجيل الخروج'),
                onTap: () {
                  Navigator.pop(context);
                },
              )
        ]),
        )
      ),
    );
  }
}
