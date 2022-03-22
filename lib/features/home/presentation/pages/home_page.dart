import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:renofax/core/assets/constantas.dart' as Constants;
import 'package:renofax/features/complainant/presentation/pages/complaint_list_page.dart';

import '../../domain/entities/menu.dart';

class HomePage extends StatefulWidget {
  static const nameRoute = '/home_page';

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final menus = [
    Menu(
        title: 'Buat Aduan',
        description: 'Buat aduan anda sekarang',
        icon: 'assets/images/ic_add_report.svg'),
    Menu(
        title: 'Daftar Aduan',
        description: 'Lihat perkemabangan aduan anda disini',
        icon: 'assets/images/ic_list_report.svg'),
    Menu(
        title: 'Riwayat Aduan',
        description: 'Periksa kembali aduan yang sudah selesai',
        icon: 'assets/images/ic_history_report.svg')
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 3,
              decoration: BoxDecoration(
                color: Color(0xFF2E2EFF),
              ),
            ),
            Container(
              child: Column(
                children: [
                  //toolbar
                  customHomeToolbar(),
                  //content home page
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          // welcome text
                          Container(
                            margin: EdgeInsets.only(top: 18.0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Selamat Datang, Heru',
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                          //role text
                          Container(
                            margin: EdgeInsets.only(top: 8.0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Logged in as Admin',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(
                                top: 32.0,
                              ),
                              child: ListView.separated(
                                physics: const NeverScrollableScrollPhysics(),
                                separatorBuilder: (_, __) => SizedBox(
                                  height: 8.0,
                                ),
                                itemCount: menus.length,
                                itemBuilder: (context, index) => Card(
                                  child: InkWell(
                                    onTap: () {
                                      switch(index) {
                                        case 0:
                                          //go to complaint page
                                          break;
                                        case 1:
                                          Navigator.pushNamed(context, ComplaintListPage.nameRoute);
                                          break;
                                        case 2:
                                          //go to history page
                                          break;
                                      }
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(18),
                                      child: Row(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(
                                              right: 16.0,
                                            ),
                                            child: SvgPicture.asset(
                                              menus[index].icon,
                                            ),
                                          ),
                                          Expanded(
                                            child: Column(
                                              children: [
                                                Align(
                                                  alignment: Alignment.centerLeft,
                                                  child: Text(
                                                    menus[index].title,
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.w600,
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment: Alignment.centerLeft,
                                                  child: Text(
                                                    menus[index].description,
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: Color(0xFF828282)),
                                                  ),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          //list menu
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class customHomeToolbar extends StatelessWidget {
  const customHomeToolbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF2E2EFF),
      height: MediaQuery.of(context).size.height / 10,
      padding: EdgeInsets.all(16),
      child: Row(
        children: [
          AspectRatio(
            aspectRatio: 1 / 1,
            child: SvgPicture.asset('assets/images/ic_renofax.svg'),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(
                left: 8,
                right: 8,
              ),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Lokasi',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.place_outlined,
                        color: Colors.white,
                        size: 16,
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          left: 4,
                        ),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Lokasi',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          AspectRatio(
            aspectRatio: 1 / 1,
            child: Icon(
              Icons.notifications_none_outlined,
              color: Colors.white,
            ),
          ),
          AspectRatio(
            aspectRatio: 1 / 1,
            child: CircleAvatar(
              backgroundColor: Colors.deepOrange,
              child: Icon(
                Icons.person,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
