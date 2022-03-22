import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../injection_container.dart';
import '../../data/models/complaint_test.dart';
import '../../presentation/pages/complaint_detail_page.dart';
import '../bloc/complaint_bloc.dart';

class ComplaintListPage extends StatelessWidget {
  static const nameRoute = '/complaint_list_page';

  const ComplaintListPage({Key? key}) : super(key: key);

  // TODO : trigger event "fetchComplaints" on first render

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text('Daftar Aduan'),
            backgroundColor: Color(0xFF2E2EFF),
            elevation: 0,
          ),
          body: BlocProvider(
            create: (context) => sl<ComplaintBloc>(),
            child: buildBlocBuilder(),
          )),
    );
  }

  BlocConsumer<ComplaintBloc, ComplaintState> buildBlocConsumer() {
    return BlocConsumer<ComplaintBloc, ComplaintState>(
      listenWhen: (previous, current) => current is Initial,
      listener: (context, state) {
        if (state is Initial) {
          log('listener : ${state.toString()}');
          BlocProvider.of<ComplaintBloc>(context).add(fetchComplaint());
        }
      },
      buildWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      builder: (context, state) {
        log('builder : ${state.toString()}');
        if (state is Loading) {
          return Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is Success) {
          return Container(
            padding: EdgeInsets.all(16.0),
            child: ListView.separated(
              itemBuilder: (context, index) {
                final complaint = state.complaints[index];
                return Card(
                  child: InkWell(
                    onTap: () {
                      //do action item's click.
                    },
                    child: Container(
                      padding: EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Visibility(
                            visible: complaint.priority == 1 ? false : true,
                            child: Text(
                              'High Priority',
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                          Text(
                            '${complaint.title}',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          Row(
                            children: [
                              Container(
                                width: 12.0,
                                height: 12.0,
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    shape: BoxShape.circle),
                              ),
                              SizedBox(
                                width: 4.0,
                              ),
                              Text(
                                '${complaint.state}'.toLowerCase(),
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Spacer(),
                              Text(
                                '${complaint.date}',
                                style: TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey,
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 12.0,
                          ),
                          Divider(
                            color: Color(0xFFE0E0E0),
                            thickness: 1,
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          Row(
                            children: [
                              assignIndicatorAlternatifOne(complaint),
                              Spacer(),
                              commentIndicator(complaint),
                              SizedBox(
                                width: 4.0,
                              ),
                              attachIndicator(complaint)
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (_, __) => SizedBox(
                height: 8.0,
              ),
              itemCount: state.complaints.length,
            ),
          );
        } else if (state is Error) {
          return Container(
            child: Center(
              child: Text('Error'),
            ),
          );
        }
        return Container(
          child: Center(
            child: Text('Empty'),
          ),
        );
      },
    );
  }

  BlocBuilder<ComplaintBloc, ComplaintState> buildBlocBuilder() {
    return BlocBuilder<ComplaintBloc, ComplaintState>(
      builder: (context, state) {
        if (state is Initial) {
          BlocProvider.of<ComplaintBloc>(context).add(fetchComplaint());
          return Container(
            child: Center(
              child: Text('Initial'),
            ),
          );
        } else if (state is Loading) {
          return Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is Success) {
          final complaints = state.complaints;
          return Container(
            padding: EdgeInsets.all(16.0),
            child: ListView.separated(
              itemBuilder: (context, index) {
                final complaint = complaints[index];
                return Card(
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        ComplaintDetailPage.nameRoute,
                        arguments: <String, dynamic>{
                          'id': complaint.id,
                          'title': complaint.title,
                          'complainant': complaint.complainant,
                        }
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Visibility(
                            visible: complaint.priority == 1 ? false : true,
                            child: Text(
                              'High Priority',
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                          Text(
                            '${complaint.title}',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          Row(
                            children: [
                              Container(
                                width: 12.0,
                                height: 12.0,
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    shape: BoxShape.circle),
                              ),
                              SizedBox(
                                width: 4.0,
                              ),
                              Text(
                                '${complaint.state}'.toLowerCase(),
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Spacer(),
                              Text(
                                '${complaint.date}',
                                style: TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey,
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 12.0,
                          ),
                          Divider(
                            color: Color(0xFFE0E0E0),
                            thickness: 1,
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          Row(
                            children: [
                              assignIndicatorAlternatifOne(complaint),
                              Spacer(),
                              commentIndicator(complaint),
                              SizedBox(
                                width: 4.0,
                              ),
                              attachIndicator(complaint)
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (_, __) => SizedBox(
                height: 8.0,
              ),
              itemCount: complaints.length,
            ),
          );
        } else if (state is Error) {
          return Container(
            child: Center(
              child: Text('Error'),
            ),
          );
        }
        return Container(
          child: Center(
            child: Text('Empty'),
          ),
        );
      },
    );
  }

  Visibility commentIndicator(ComplaintTest complaint) {
    return Visibility(
      visible: _countComments(complaint.activities) > 0,
      child: Row(
        children: [
          Icon(Icons.comment_outlined, color: Colors.grey, size: 18.0),
          SizedBox(
            width: 4.0,
          ),
          Padding(
            padding: EdgeInsets.only(
              bottom: 2.0,
            ),
            child: Text(
              _countComments(complaint.activities).toString(),
            ),
          ),
        ],
      ),
    );
  }

  Visibility attachIndicator(ComplaintTest complaint) {
    return Visibility(
      visible: _countAttach(complaint.attachments) > 0,
      child: Row(
        children: [
          Icon(Icons.attach_file_outlined, color: Colors.grey, size: 18.0),
          SizedBox(
            width: 4.0,
          ),
          Padding(
            padding: EdgeInsets.only(
              bottom: 2.0,
            ),
            child: Text(
              _countAttach(complaint.attachments).toString(),
            ),
          ),
        ],
      ),
    );
  }

  Row assignIndicatorAlternatifOne(ComplaintTest complaint) {
    final totalAssigns = complaint.assignments!.length + 1;
    return Row(
      children: [
        Container(
          width: 70.0,
          height: 16.0,
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              ...List.generate(
                totalAssigns > 5 ? 5 : totalAssigns,
                (index) => Positioned(
                  left: index * 10,
                  child: Container(
                    height: 16.0,
                    child: CircleAvatar(
                      backgroundColor:
                          index % 2 == 1 ? Colors.blueAccent : Colors.redAccent,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Visibility(
            visible: totalAssigns + 1 > 5,
            child: Padding(
              padding: EdgeInsets.only(
                left: 4.0,
                bottom: 2.0,
              ),
              child: Text(
                '+${totalAssigns - 5}',
              ),
            ),
          ),
        ),
      ],
    );
  }

  Row assignIndicatorAlternatifTwo(ComplaintTest complaint) {
    final totalAssigns = complaint.assignments!.length + 1;
    return Row(
      children: [
        Container(
          width: 85.0,
          height: 16.0,
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: complaint.assignments!.length + 1 > 5
                ? 5
                : complaint.assignments!.length + 1,
            itemBuilder: (context, index) => AspectRatio(
              aspectRatio: 1 / 1,
              child: CircleAvatar(
                  backgroundColor:
                      index % 2 == 1 ? Colors.blueAccent : Colors.redAccent),
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Visibility(
            child: Text('+${totalAssigns - 5}'),
          ),
        ),
      ],
    );
  }

  int _countComments(List<Activities>? activities) {
    return activities!
        .where((activity) => activity.type == 'COMMENT' ? true : false)
        .toList()
        .length;
  }

  int _countAttach(List<Attachments>? attachments) {
    return attachments!.length;
  }
}
