import 'package:auto_pilot/shared/presentation/styles.dart';
import 'package:flutter/material.dart';

class MyAutoPilotDrawer extends StatefulWidget {
  GlobalKey<ScaffoldState> homeScaffoldKey;
  /* String productImageurl;
  String productWebsite;
  String productName;
  int productId; */

  // Declaring the page controller here, this would be passed here from the home screen.
  PageController pageController;

  MyAutoPilotDrawer({
    required this.homeScaffoldKey,
    required this.pageController,
  });

  @override
  _MyAutoPilotDrawerState createState() => _MyAutoPilotDrawerState();
}

class _MyAutoPilotDrawerState extends State<MyAutoPilotDrawer> {
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    /* print('Product Image Url : ${widget.productImageurl}');
    print('Product productWebsite Url : ${widget.productWebsite}');
    print('Product productName Url : ${widget.productName}');
    print('Product productId Url : ${widget.productId}'); */

    /* if (widget.productName == null) widget.productName = '';
    if (widget.productWebsite == null) widget.productWebsite = ''; */

    return SizedBox(
      width: MediaQuery.of(context).size.width * 78 / 100,
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              padding: EdgeInsets.all(0),
              child: Container(
                color: Colors.indigo[50],
                child: Stack(children: <Widget>[
                  /* widget.productImageurl != null
                      ? Container(
                          color: Colors.indigo[50],
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                flex: 3,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(15, 15, 0, 0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: Image(
                                      image:
                                          NetworkImage(widget.productImageurl),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                    margin:
                                        EdgeInsets.fromLTRB(15.0, 10, 0.0, 0.0),
                                    child: Text(
                                      '${widget.productName}',
                                      style:
                                          MyAutoPilotStyles.listTileHeaderTitle,
                                    )),
                              )
                            ],
                          ),
                        )
                      : Container(
                          decoration: BoxDecoration(
                            color: Colors.indigo[50],
                          ),
                        ), */
                  /* Positioned(
                    right: 0,
                    //top: 2.5,
                    child: IconButton(
                      alignment: Alignment.topRight,
                      icon: MyAutoPilotStyles.closeWindowIcon,
                      color: Colors.black,
                      iconSize: 15,
                      onPressed: () {
                        setState(() {
                          if (!widget
                              .homeScaffoldKey.currentState.isDrawerOpen) {
                            widget.homeScaffoldKey.currentState.openDrawer();
                          }
                        });
                        Navigator.pop(context);
                      },
                    ),
                  ), */
                ]),
              ),
            ),
            ListTile(
              title: Text(
                'My Dashboard',
                style: MyAutoPilotStyles.listTileHeaderTitle,
              ),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  widget.pageController.jumpToPage(4);
                });
              },
            ),
            MyAutoPilotStyles.menuItemDivider,
            Theme(
              data: Theme.of(context).copyWith(
                dividerColor: Colors.transparent,
              ),
              child: ExpansionTile(
                trailing: MyAutoPilotStyles.menuTrailingIcon,
                title: Text(
                  'Store Properties',
                  style: MyAutoPilotStyles.listTileHeaderTitle,
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(
                    top: 8.0,
                    bottom: 8.0,
                  ),
                  child: Text(
                    'Store Details, Hardware, Peripherals etc.',
                    style: MyAutoPilotStyles.listTileSubTitle,
                  ),
                ),
                children: <Widget>[
                  ListTile(
                    leading: MyAutoPilotStyles.drawerMenuIcon,
                    title: Text(
                      'Store Details',
                      style: MyAutoPilotStyles.listTileTitle,
                    ),
                    onTap: () {
                      setState(() {
                        Navigator.pop(context);
                        widget.pageController.jumpToPage(5);
                      });
                    },
                  ),
                  ListTile(
                    leading: MyAutoPilotStyles.drawerMenuIcon,
                    title: Text(
                      'Dispatch & Table',
                      style: MyAutoPilotStyles.listTileTitle,
                    ),
                    onTap: () {
                      setState(() {
                        Navigator.pop(context);
                        widget.pageController.jumpToPage(6);
                      });
                    },
                  ),
                  ListTile(
                    leading: MyAutoPilotStyles.drawerMenuIcon,
                    title: Text(
                      'Receipt Print',
                      style: MyAutoPilotStyles.listTileTitle,
                    ),
                    onTap: () {
                      setState(() {
                        Navigator.pop(context);
                        widget.pageController.jumpToPage(7);
                      });
                    },
                  ),
                  ListTile(
                    leading: MyAutoPilotStyles.drawerMenuIcon,
                    title: Text(
                      'Chef Print',
                      style: MyAutoPilotStyles.listTileTitle,
                    ),
                    onTap: () {
                      setState(() {
                        Navigator.pop(context);
                        widget.pageController.jumpToPage(8);
                      });
                    },
                  ),
                  ListTile(
                    leading: MyAutoPilotStyles.drawerMenuIcon,
                    title: Text(
                      'Store Accessories',
                      style: MyAutoPilotStyles.listTileTitle,
                    ),
                    onTap: () {
                      setState(() {
                        Navigator.pop(context);
                        widget.pageController.jumpToPage(9);
                      });
                    },
                  ),
                  ListTile(
                    leading: MyAutoPilotStyles.drawerMenuIcon,
                    title: Text(
                      'Hardware',
                      style: MyAutoPilotStyles.listTileTitle,
                    ),
                    onTap: () {
                      setState(() {
                        Navigator.pop(context);
                        widget.pageController.jumpToPage(10);
                      });
                    },
                  ),
                  ListTile(
                    leading: MyAutoPilotStyles.drawerMenuIcon,
                    title: Text(
                      'Peripherals',
                      style: MyAutoPilotStyles.listTileTitle,
                    ),
                    onTap: () {
                      setState(() {
                        Navigator.pop(context);
                        widget.pageController.jumpToPage(11);
                      });
                    },
                  ),
                  ListTile(
                    leading: MyAutoPilotStyles.drawerMenuIcon,
                    title: Text(
                      'Opening Times',
                      style: MyAutoPilotStyles.listTileTitle,
                    ),
                    onTap: () {
                      setState(() {
                        Navigator.pop(context);
                        widget.pageController.jumpToPage(12);
                      });
                    },
                  ),
                  ListTile(
                    leading: MyAutoPilotStyles.drawerMenuIcon,
                    title: Text(
                      'Holiday List',
                      style: MyAutoPilotStyles.listTileTitle,
                    ),
                    onTap: () {
                      setState(() {
                        Navigator.pop(context);
                        widget.pageController.jumpToPage(13);
                      });
                    },
                  ),
                ],
              ),
            ),
            MyAutoPilotStyles.menuItemDivider,
            Theme(
              data: Theme.of(context).copyWith(
                dividerColor: Colors.transparent,
              ),
              child: ExpansionTile(
                trailing: MyAutoPilotStyles.menuTrailingIcon,
                title: Text(
                  'Banking & Details',
                  style: MyAutoPilotStyles.listTileHeaderTitle,
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(
                    top: 8.0,
                    bottom: 8.0,
                  ),
                  child: Text(
                    'Online Banking, Bank Accounts etc',
                    style: MyAutoPilotStyles.listTileSubTitle,
                  ),
                ),
                children: <Widget>[
                  ListTile(
                    leading: MyAutoPilotStyles.drawerMenuIcon,
                    title: Text(
                      'Online Banking',
                      style: MyAutoPilotStyles.listTileTitle,
                    ),
                    onTap: () {
                      //Navigator.popAndPushNamed(context, '/misc/hardware');
                      setState(() {
                        Navigator.pop(context);
                        widget.pageController.jumpToPage(14);
                      });
                    },
                  ),
                  ListTile(
                    leading: MyAutoPilotStyles.drawerMenuIcon,
                    title: Text(
                      'Bank Accounts',
                      style: MyAutoPilotStyles.listTileTitle,
                    ),
                    onTap: () {
                      setState(() {
                        Navigator.pop(context);
                        widget.pageController.jumpToPage(15);
                      });
                    },
                  ),
                  ListTile(
                    leading: MyAutoPilotStyles.drawerMenuIcon,
                    title: Text(
                      'Credit Cards',
                      style: MyAutoPilotStyles.listTileTitle,
                    ),
                    onTap: () {
                      setState(() {
                        Navigator.pop(context);
                        widget.pageController.jumpToPage(16);
                      });
                    },
                  ),
                  ListTile(
                    leading: MyAutoPilotStyles.drawerMenuIcon,
                    title: Text(
                      'Transfer Amount',
                      style: MyAutoPilotStyles.listTileTitle,
                    ),
                    onTap: () {
                      setState(() {
                        Navigator.pop(context);
                        widget.pageController.jumpToPage(17);
                      });
                    },
                  ),
                  ListTile(
                    leading: MyAutoPilotStyles.drawerMenuIcon,
                    title: Text(
                      'Change Of Ownership',
                      style: MyAutoPilotStyles.listTileTitle,
                    ),
                    onTap: () {
                      setState(() {
                        Navigator.pop(context);
                        widget.pageController.jumpToPage(18);
                      });
                    },
                  ),
                  // ListTile(
                  //   leading: MyAutoPilotStyles.drawerMenuIcon,
                  //   title: Text(
                  //     'Legal Contract',
                  //     style: MyAutoPilotStyles.listTileTitle,
                  //   ),
                  //   onTap: () {
                  //     setState(() {
                  //       Navigator.pop(context);
                  //       widget.pageController.jumpToPage(19);
                  //     });
                  //   },
                  // ),
                  ListTile(
                    leading: MyAutoPilotStyles.drawerMenuIcon,
                    title: Text(
                      'DineOrder Charges',
                      style: MyAutoPilotStyles.listTileTitle,
                    ),
                    onTap: () {
                      setState(() {
                        Navigator.pop(context);
                        widget.pageController.jumpToPage(20);
                      });
                    },
                  ),
                  /* ListTile(
                    leading: MyAutoPilotStyles.drawerMenuIcon,
                    title: Text(
                      'DineOrder Other Charges',
                      style: MyAutoPilotStyles.listTileTitle,
                    ),
                    onTap: () {
                      setState(() {
                        Navigator.pop(context);
                        widget.pageController.jumpToPage(21);
                      });
                    },
                  ), */
                ],
              ),
            ),
            MyAutoPilotStyles.menuItemDivider,
            Theme(
              data: Theme.of(context).copyWith(
                dividerColor: Colors.transparent,
              ),
              child: ExpansionTile(
                trailing: MyAutoPilotStyles.menuTrailingIcon,
                title: Text(
                  'Reports',
                  style: MyAutoPilotStyles.listTileHeaderTitle,
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(
                    top: 8.0,
                    bottom: 8.0,
                  ),
                  child: Text(
                    'Quick Report, A-Z Reporting etc.',
                    style: MyAutoPilotStyles.listTileSubTitle,
                  ),
                ),
                children: <Widget>[
                  ListTile(
                    leading: MyAutoPilotStyles.drawerMenuIcon,
                    title: Text(
                      'Quick Report',
                      style: MyAutoPilotStyles.listTileTitle,
                    ),
                    onTap: () {
                      //Navigator.popAndPushNamed(context, '/misc/hardware');
                      setState(() {
                        Navigator.pop(context);
                        widget.pageController.jumpToPage(22);
                      });
                    },
                  ),
                  ListTile(
                    leading: MyAutoPilotStyles.drawerMenuIcon,
                    title: Text(
                      'Cumulative Report',
                      style: MyAutoPilotStyles.listTileTitle,
                    ),
                    onTap: () {
                      setState(() {
                        Navigator.pop(context);
                        widget.pageController.jumpToPage(23);
                      });
                    },
                  ),
                  ListTile(
                    leading: MyAutoPilotStyles.drawerMenuIcon,
                    title: Text(
                      'A-Z Reporting',
                      style: MyAutoPilotStyles.listTileTitle,
                    ),
                    onTap: () {
                      setState(() {
                        Navigator.pop(context);
                        widget.pageController.jumpToPage(24);
                      });
                    },
                  ),
                  ListTile(
                    leading: MyAutoPilotStyles.drawerMenuIcon,
                    title: Text(
                      'Collection Reporting',
                      style: MyAutoPilotStyles.listTileTitle,
                    ),
                    onTap: () {
                      setState(() {
                        Navigator.pop(context);
                        widget.pageController.jumpToPage(25);
                      });
                    },
                  ),
                  ListTile(
                    leading: MyAutoPilotStyles.drawerMenuIcon,
                    title: Text(
                      'Waiting Reporting',
                      style: MyAutoPilotStyles.listTileTitle,
                    ),
                    onTap: () {
                      setState(() {
                        Navigator.pop(context);
                        widget.pageController.jumpToPage(26);
                      });
                    },
                  ),
                  ListTile(
                    leading: MyAutoPilotStyles.drawerMenuIcon,
                    title: Text(
                      'Delivery Reporting',
                      style: MyAutoPilotStyles.listTileTitle,
                    ),
                    onTap: () {
                      setState(() {
                        Navigator.pop(context);
                        widget.pageController.jumpToPage(27);
                      });
                    },
                  ),
                  ListTile(
                    leading: MyAutoPilotStyles.drawerMenuIcon,
                    title: Text(
                      'Restaurant Reporting',
                      style: MyAutoPilotStyles.listTileTitle,
                    ),
                    onTap: () {
                      setState(() {
                        Navigator.pop(context);
                        widget.pageController.jumpToPage(28);
                      });
                    },
                  ),
                  ListTile(
                    leading: MyAutoPilotStyles.drawerMenuIcon,
                    title: Text(
                      'Eat Out Help Out Report',
                      style: MyAutoPilotStyles.listTileTitle,
                    ),
                    onTap: () {
                      setState(() {
                        Navigator.pop(context);
                        widget.pageController.jumpToPage(29);
                      });
                    },
                  ),
                  ListTile(
                    leading: MyAutoPilotStyles.drawerMenuIcon,
                    title: Text(
                      'System Reporting',
                      style: MyAutoPilotStyles.listTileTitle,
                    ),
                    onTap: () {
                      setState(() {
                        Navigator.pop(context);
                        widget.pageController.jumpToPage(30);
                      });
                    },
                  ),
                  ListTile(
                    leading: MyAutoPilotStyles.drawerMenuIcon,
                    title: Text(
                      'Website Reporting',
                      style: MyAutoPilotStyles.listTileTitle,
                    ),
                    onTap: () {
                      setState(() {
                        Navigator.pop(context);
                        widget.pageController.jumpToPage(31);
                      });
                    },
                  ),
                  ListTile(
                    leading: MyAutoPilotStyles.drawerMenuIcon,
                    title: Text(
                      'DineOrder Reporting',
                      style: MyAutoPilotStyles.listTileTitle,
                    ),
                    onTap: () {
                      setState(() {
                        Navigator.pop(context);
                        widget.pageController.jumpToPage(32);
                      });
                    },
                  ),
                  ListTile(
                    leading: MyAutoPilotStyles.drawerMenuIcon,
                    title: Text(
                      'Payment Reporting',
                      style: MyAutoPilotStyles.listTileTitle,
                    ),
                    onTap: () {
                      setState(() {
                        Navigator.pop(context);
                        widget.pageController.jumpToPage(35);
                      });
                    },
                  ),
                  ListTile(
                    leading: MyAutoPilotStyles.drawerMenuIcon,
                    title: Text(
                      'Driver Reporting',
                      style: MyAutoPilotStyles.listTileTitle,
                    ),
                    onTap: () {
                      setState(() {
                        Navigator.pop(context);
                        widget.pageController.jumpToPage(36);
                      });
                    },
                  ),
                  ListTile(
                    leading: MyAutoPilotStyles.drawerMenuIcon,
                    title: Text(
                      'Product Reporting',
                      style: MyAutoPilotStyles.listTileTitle,
                    ),
                    onTap: () {
                      setState(() {
                        Navigator.pop(context);
                        widget.pageController.jumpToPage(37);
                      });
                    },
                  ),
                  ListTile(
                    leading: MyAutoPilotStyles.drawerMenuIcon,
                    title: Text(
                      'Cashdrawer Reporting',
                      style: MyAutoPilotStyles.listTileTitle,
                    ),
                    onTap: () {
                      setState(() {
                        Navigator.pop(context);
                        widget.pageController.jumpToPage(38);
                      });
                    },
                  ),
                  ListTile(
                    leading: MyAutoPilotStyles.drawerMenuIcon,
                    title: Text(
                      'Delete Void Transactions',
                      style: MyAutoPilotStyles.listTileTitle,
                    ),
                    onTap: () {
                      setState(() {
                        Navigator.pop(context);
                        widget.pageController.jumpToPage(39);
                      });
                    },
                  ),
                  ListTile(
                    leading: MyAutoPilotStyles.drawerMenuIcon,
                    title: Text(
                      'Delete Transactions',
                      style: MyAutoPilotStyles.listTileTitle,
                    ),
                    onTap: () {
                      setState(() {
                        Navigator.pop(context);
                        widget.pageController.jumpToPage(40);
                      });
                    },
                  ),
                ],
              ),
            ),
            MyAutoPilotStyles.menuItemDivider,
            Theme(
              data: Theme.of(context).copyWith(
                dividerColor: Colors.transparent,
              ),
              child: ExpansionTile(
                trailing: MyAutoPilotStyles.menuTrailingIcon,
                title: Text(
                  'Manage Staff',
                  style: MyAutoPilotStyles.listTileHeaderTitle,
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(
                    top: 8.0,
                    bottom: 8.0,
                  ),
                  child: Text(
                    'Staff, Staff Groups and Privileges',
                    style: MyAutoPilotStyles.listTileSubTitle,
                  ),
                ),
                children: <Widget>[
                  ListTile(
                    leading: MyAutoPilotStyles.drawerMenuIcon,
                    title: Text(
                      'Staff',
                      style: MyAutoPilotStyles.listTileTitle,
                    ),
                    onTap: () {
                      setState(() {
                        Navigator.pop(context);
                        widget.pageController.jumpToPage(49);
                      });
                    },
                  ),
                  ListTile(
                    leading: MyAutoPilotStyles.drawerMenuIcon,
                    title: Text(
                      'Staff Groups and Privileges',
                      style: MyAutoPilotStyles.listTileTitle,
                    ),
                    onTap: () {
                      setState(() {
                        Navigator.pop(context);
                        widget.pageController.jumpToPage(50);
                      });
                    },
                  ),
                ],
              ),
            ),
            MyAutoPilotStyles.menuItemDivider,
            Theme(
              data: Theme.of(context).copyWith(
                dividerColor: Colors.transparent,
              ),
              child: ExpansionTile(
                trailing: MyAutoPilotStyles.menuTrailingIcon,
                title: Text(
                  'Marketing Tools',
                  style: MyAutoPilotStyles.listTileHeaderTitle,
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(
                    top: 8.0,
                    bottom: 8.0,
                  ),
                  child: Text(
                    'SMS, Email',
                    style: MyAutoPilotStyles.listTileSubTitle,
                  ),
                ),
                children: <Widget>[
                  ListTile(
                    leading: MyAutoPilotStyles.drawerMenuIcon,
                    title: Text(
                      'SMS',
                      style: MyAutoPilotStyles.listTileTitle,
                    ),
                    onTap: () {
                      setState(() {
                        Navigator.pop(context);
                        widget.pageController.jumpToPage(51);
                      });
                    },
                  ),
                  ListTile(
                    leading: MyAutoPilotStyles.drawerMenuIcon,
                    title: Text(
                      'Email',
                      style: MyAutoPilotStyles.listTileTitle,
                    ),
                    onTap: () {
                      setState(() {
                        Navigator.pop(context);
                        widget.pageController.jumpToPage(52);
                      });
                    },
                  ),
                ],
              ),
            ),
            MyAutoPilotStyles.menuItemDivider,
            Theme(
              data: Theme.of(context).copyWith(
                dividerColor: Colors.transparent,
              ),
              child: ExpansionTile(
                trailing: MyAutoPilotStyles.menuTrailingIcon,
                title: Text(
                  'Rules & Conditions',
                  style: MyAutoPilotStyles.listTileHeaderTitle,
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(
                    top: 8.0,
                    bottom: 8.0,
                  ),
                  child: Text(
                    'Rules, Tax etc.',
                    style: MyAutoPilotStyles.listTileSubTitle,
                  ),
                ),
                children: <Widget>[
                  ListTile(
                    leading: MyAutoPilotStyles.drawerMenuIcon,
                    title: Text(
                      'Rules V1',
                      style: MyAutoPilotStyles.listTileTitle,
                    ),
                    onTap: () {
                      setState(() {
                        Navigator.pop(context);
                        widget.pageController.jumpToPage(53);
                      });
                    },
                  ),
                  ListTile(
                    leading: MyAutoPilotStyles.drawerMenuIcon,
                    title: Text(
                      'Rules V2',
                      style: MyAutoPilotStyles.listTileTitle,
                    ),
                    onTap: () {
                      setState(() {
                        Navigator.pop(context);
                        widget.pageController.jumpToPage(63);
                      });
                    },
                  ),
                  ListTile(
                    leading: MyAutoPilotStyles.drawerMenuIcon,
                    title: Text(
                      'Tax',
                      style: MyAutoPilotStyles.listTileTitle,
                    ),
                    onTap: () {
                      setState(() {
                        Navigator.pop(context);
                        widget.pageController.jumpToPage(55);
                      });
                    },
                  ),
                  ListTile(
                    leading: MyAutoPilotStyles.drawerMenuIcon,
                    title: Text(
                      'Restricted Area',
                      style: MyAutoPilotStyles.listTileTitle,
                    ),
                    onTap: () {
                      setState(() {
                        Navigator.pop(context);
                        widget.pageController.jumpToPage(56);
                      });
                    },
                  ),
                ],
              ),
            ),
            MyAutoPilotStyles.menuItemDivider,
            Theme(
              data: Theme.of(context).copyWith(
                dividerColor: Colors.transparent,
              ),
              child: ExpansionTile(
                trailing: MyAutoPilotStyles.menuTrailingIcon,
                title: Text(
                  'Discount & Loyalty',
                  style: MyAutoPilotStyles.listTileHeaderTitle,
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(
                    top: 8.0,
                    bottom: 8.0,
                  ),
                  child: Text(
                    'Discount & Loyalty',
                    style: MyAutoPilotStyles.listTileSubTitle,
                  ),
                ),
                children: <Widget>[
                  ListTile(
                    leading: MyAutoPilotStyles.drawerMenuIcon,
                    title: Text(
                      'Discount & Coupon',
                      style: MyAutoPilotStyles.listTileTitle,
                    ),
                    onTap: () {
                      setState(() {
                        Navigator.pop(context);
                        widget.pageController.jumpToPage(54);
                      });
                    },
                  ),
                  /* ListTile(
                    leading: MyAutoPilotStyles.drawerMenuIcon,
                    title: Text(
                      'Discount Coupon',
                      style: MyAutoPilotStyles.listTileTitle,
                    ),
                    onTap: () {
                      setState(() {
                        Navigator.pop(context);
                        widget.pageController.jumpToPage(54);
                      });
                    },
                  ), */
                  ListTile(
                    leading: MyAutoPilotStyles.drawerMenuIcon,
                    title: Text(
                      'Loyalty',
                      style: MyAutoPilotStyles.listTileTitle,
                    ),
                    onTap: () {
                      setState(() {
                        Navigator.pop(context);
                        widget.pageController.jumpToPage(64);
                      });
                    },
                  ),
                ],
              ),
            ),
            MyAutoPilotStyles.menuItemDivider,
            // Theme(
            //   data: Theme.of(context).copyWith(
            //     dividerColor: Colors.transparent,
            //   ),
            //   child: ExpansionTile(
            //     trailing: MyAutoPilotStyles.menuTrailingIcon,
            //     title: Text(
            //       'Customers',
            //       style: MyAutoPilotStyles.listTileHeaderTitle,
            //     ),
            //     subtitle: Padding(
            //       padding: const EdgeInsets.only(
            //         top: 8.0,
            //         bottom: 8.0,
            //       ),
            //       child: Text(
            //         'Customers, Feedbacks, Queries etc.',
            //         style: MyAutoPilotStyles.listTileSubTitle,
            //       ),
            //     ),
            //     children: <Widget>[
            //       ListTile(
            //         leading: MyAutoPilotStyles.drawerMenuIcon,
            //         title: Text(
            //           'Customers',
            //           style: MyAutoPilotStyles.listTileTitle,
            //         ),
            //         onTap: () {
            //           setState(() {
            //             Navigator.pop(context);
            //             widget.pageController.jumpToPage(57);
            //           });
            //         },
            //       ),
            //       ListTile(
            //         leading: MyAutoPilotStyles.drawerMenuIcon,
            //         title: Text(
            //           'Feedbacks',
            //           style: MyAutoPilotStyles.listTileTitle,
            //         ),
            //         onTap: () {
            //           setState(() {
            //             Navigator.pop(context);
            //             widget.pageController.jumpToPage(58);
            //           });
            //         },
            //       ),
            //       ListTile(
            //         leading: MyAutoPilotStyles.drawerMenuIcon,
            //         title: Text(
            //           'Queries',
            //           style: MyAutoPilotStyles.listTileTitle,
            //         ),
            //         onTap: () {
            //           setState(() {
            //             Navigator.pop(context);
            //             widget.pageController.jumpToPage(59);
            //           });
            //         },
            //       ),
            //       ListTile(
            //         leading: MyAutoPilotStyles.drawerMenuIcon,
            //         title: Text(
            //           'Phone Logs',
            //           style: MyAutoPilotStyles.listTileTitle,
            //         ),
            //         onTap: () {
            //           setState(() {
            //             Navigator.pop(context);
            //             widget.pageController.jumpToPage(60);
            //           });
            //         },
            //       ),
            //     ],
            //   ),
            // ),
            // MyAutoPilotStyles.menuItemDivider,
            /* ListTile(
              title: Padding(
                padding: const EdgeInsets.only(
                  bottom: 8.0,
                ),
                child: Text(
                  'APay',
                  style: MyAutoPilotStyles.listTileHeaderTitle,
                ),
              ),
              onTap: () async {
                List<Application> apps =
                    await DeviceApps.getInstalledApplications(
                  onlyAppsWithLaunchIntent: true,
                  includeSystemApps: true,
                  includeAppIcons: true,
                );

                for (var app in apps) {
                  print(' Package Name : ${app.packageName}');
                  if (app.packageName.trim() == 'eft.com.apay') {
                    setState(() {
                      Navigator.pop(context);
                      widget.pageController.jumpToPage(61);
                    });
                  }
                }
              },
            ),
            MyAutoPilotStyles.menuItemDivider, */
            /* ListTile(
              trailing: Padding(
                padding: const EdgeInsets.only(
                  bottom: 8.0,
                ),
                child: MyAutoPilotStyles.menuLogoutTrailingIcon,
              ),
              title: Padding(
                padding: const EdgeInsets.only(
                  bottom: 8.0,
                ),
                child: Text(
                  'Log Out',
                  style: MyAutoPilotStyles.listTileHeaderTitle,
                ),
              ),
              onTap: () async {
                await deleteLoginChecker();
                Navigator.pushReplacementNamed(context, '/slider');
                //Navigator.popAndPushNamed(context, '/home');
              },
            ), */
          ],
        ),
      ),
    );
  }
}

/* Future<int> deleteLoginChecker() {
  DatabaseHelper helper = DatabaseHelper.instance;
  var deletedData = helper.deleteFromDineOrderCCLoginCheckerTable();
  return deletedData;
} */

buildExitButton(BuildContext context) {
  return Container(
    color: Colors.indigo[50],
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: MaterialButton(
            onPressed: () {
              Navigator.pop(context);
            },
            height: 50.0,
            minWidth: 50.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
            ),
            child: Icon(
              Icons.clear,
              color: Colors.grey[800],
            ),
          ),
        )
      ],
    ),
  );
}
