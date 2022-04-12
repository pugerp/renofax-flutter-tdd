import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:renofax/features/complainant/presentation/bloc/complaint_bloc.dart';

import '../../../../injection_container.dart';
import '../../data/models/complaint.dart';

class ComplaintDetailPage extends StatelessWidget {
  static const nameRoute = '/complaint_detail_page';

  const ComplaintDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments as Map;
    return SafeArea(
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Aduan'),
            backgroundColor: Color(0xFF2E2EFF),
            elevation: 0,
            bottom: TabBar(
              indicatorPadding: EdgeInsets.only(
                left: 18.0,
                right: 18.0,
              ),
              labelColor: Color(0xFF2E2EFF),
              unselectedLabelColor: Colors.white,
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50.0),
              ),
              tabs: [
                AspectRatio(
                  aspectRatio: 3 / 1,
                  child: Tab(text: 'Detail'),
                ),
                AspectRatio(
                  aspectRatio: 3 / 1,
                  child: Tab(text: 'Member'),
                ),
                AspectRatio(
                  aspectRatio: 3 / 1,
                  child: Tab(text: 'Aktivitas'),
                ),
              ],
            ),
          ),
          body: BlocProvider(
            create: (context) => sl<ComplaintBloc>(),
            child: BlocBuilder<ComplaintBloc, ComplaintState>(
              builder: (context, state) {
                if (state is Initial) {
                  BlocProvider.of<ComplaintBloc>(context)
                      .add(fetchComplaintById(id: arguments['id']));
                  return Container();
                } else if (state is Loading) {
                  return Container(
                    color: Color(0xFF2E2EFF),
                    padding: EdgeInsets.all(16.0),
                    child: Card(
                      elevation: 2.0,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  );
                } else if (state is SuccessById) {
                  final complaint = state.complaint;
                  return TabBarView(
                    children: [
                      DetailTab(complaint: complaint),
                      MembersTab(complaint: complaint),
                      ActivitiesTab(complaint: complaint),
                    ],
                  );
                } else if (state is Error) {
                  return Container(
                    color: Color(0xFF2E2EFF),
                    padding: EdgeInsets.all(16.0),
                    child: Card(
                      elevation: 2.0,
                      child: Center(
                        child: FloatingActionButton.extended(
                          onPressed: () =>
                              BlocProvider.of<ComplaintBloc>(context)
                                  .add(fetchComplaintById(id: arguments['id'])),
                          label: Text('Refresh'),
                          icon: Icon(Icons.refresh),
                          backgroundColor: Colors.blue,
                        ),
                      ),
                    ),
                  );
                } else {
                  return Container(
                    color: Color(0xFF2E2EFF),
                    padding: EdgeInsets.all(16.0),
                    child: Card(
                      elevation: 2.0,
                      child: Center(
                        child: Text('Page Aktivitas'),
                      ),
                    ),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}

class ActivitiesTab extends StatelessWidget {
  final Complaint complaint;

  const ActivitiesTab({
    Key? key,
    required this.complaint,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final activities = complaint.activities;
    return Container(
      color: Color(0xFF2E2EFF),
      padding: EdgeInsets.all(16.0),
      child: Card(
          elevation: 2.0,
          child: ListView.separated(
            padding: EdgeInsets.all(12.0),
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              final activity = activities![index];
              return Container(
                child: Row(
                  children: [
                    Container(
                      child: CircleAvatar(
                        radius: MediaQuery.of(context).size.width * 0.04,
                        backgroundColor: Colors.deepOrange,
                        child: Icon(Icons.person),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(
                          left: 8.0,
                        ),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'User ID : ${activity.id}',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                '${activity.comment}',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'time ago',
                                style: TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
            separatorBuilder: (_, __) => SizedBox(
              height: 16.0,
            ),
            itemCount: complaint.activities!.length,
          )),
    );
  }
}

class MembersTab extends StatelessWidget {
  final Complaint complaint;

  const MembersTab({
    Key? key,
    required this.complaint,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF2E2EFF),
      padding: EdgeInsets.all(16.0),
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Card(
            elevation: 0,
            child: Container(
              height: 60,
            ),
          );
        },
        separatorBuilder: (_, __) => SizedBox(
          height: 8.0,
        ),
        itemCount: complaint.assignments!.length,
      ),
    );
  }
}

class DetailTab extends StatelessWidget {
  final Complaint complaint;

  const DetailTab({
    Key? key,
    required this.complaint,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final latitude = double.parse(complaint.latitude!);
    final longitude = double.parse(complaint.longitute!);
    return Container(
      color: Color(0xFF2E2EFF),
      padding: EdgeInsets.all(16.0),
      child: Card(
        elevation: 2.0,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            padding: EdgeInsets.all(12.0),
            child: Column(
              children: [
                contentText(label: 'Aduan', content: complaint.title!),
                contentText(
                    label: 'Deskripsi', content: complaint.description!),
                contentText(label: 'Kategori', content: complaint.category!),
                contentText(
                    label: 'Operasional',
                    content: complaint.vendors != null
                        ? 'inhouse'
                        : complaint.vendors![0].external!),
                contentText(
                    label: 'Priority',
                    content: complaint.priority! == 1
                        ? 'Normal Priority'
                        : 'High Priority'),
                contentText(
                    label: 'Status', content: complaint.state!.toUpperCase()),
                contentAlbum(
                    label: 'Foto',
                    contens: List.from(complaint.attachments!
                        .map((attachment) => attachment.photo))),
                contentText(
                    label: 'Lokasi',
                    content: '${complaint.latitude}/${complaint.longitute}'),
                Container(
                  height: screenSize.height * 0.25,
                  child: Card(
                    child: GoogleMap(
                      mapType: MapType.normal,
                      initialCameraPosition: CameraPosition(
                        zoom: 17.0,
                        target: LatLng(
                          latitude,
                          longitude,
                        ),
                      ),
                      markers: {
                        Marker(
                          markerId: MarkerId('${latitude}, ${longitude}'),
                          position: LatLng(latitude, longitude),
                          icon: BitmapDescriptor.defaultMarker,
                        ),
                      },
                      zoomControlsEnabled: false,
                      zoomGesturesEnabled: false,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class contentText extends StatelessWidget {
  final String label;
  final String content;

  const contentText({
    Key? key,
    required this.label,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: content != null && content.isNotEmpty,
      child: Padding(
        padding: EdgeInsets.only(bottom: 16.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                content,
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class contentAlbum extends StatelessWidget {
  final String label;
  final List<String> contens;

  const contentAlbum({
    Key? key,
    required this.label,
    required this.contens,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: contens != null && contens.length > 0,
      child: Padding(
        padding: EdgeInsets.only(bottom: 16.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            GridView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  mainAxisSpacing: 1.0,
                ),
                children: List.generate(contens.length > 5 ? 5 : contens.length,
                    (index) => Card(child: Image.network(contens[index])))
                // children: [
                //   Card(
                //     color: Colors.blueAccent,
                //     child: Image.network(contens[0]),
                //   ),
                //   Card(
                //     color: Colors.blueAccent,
                //     child: Image.network(contens[1]),
                //   ),
                //   Card(
                //     color: Colors.blueAccent,
                //     child: Image.network(contens[2]),
                //   ),
                //   Card(
                //     color: Colors.blueAccent,
                //     child: Image.network(contens[3]),
                //   ),
                //   if (contens.length > 5)
                //     Card(
                //       color: Color(0xFFE0E0E0),
                //       child: Center(
                //         child: Text(
                //           '+${contens.length - 5}',
                //           style: TextStyle(
                //               fontWeight: FontWeight.w400, fontSize: 16.0),
                //         ),
                //       ),
                //     )
                //   else
                //     Card(
                //       color: Colors.blueAccent,
                //       child: Image.network(contens[4]),
                //     ),
                // ],
                )
          ],
        ),
      ),
    );
  }
}
