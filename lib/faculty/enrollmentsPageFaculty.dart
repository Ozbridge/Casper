import 'package:casper/components/projecttile.dart';
import 'package:casper/faculty/loggedinscaffoldFaculty.dart';
import 'package:casper/student/project_page.dart';
import 'package:casper/utilites.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/customised_text.dart';
import '../components/text_field.dart';

class EnrollmentsPageFaculty extends StatefulWidget {
  final String role;

  EnrollmentsPageFaculty({Key? key, this.role = 'su'}) : super(key: key);

  @override
  State<EnrollmentsPageFaculty> createState() => _EnrollmentsPageFacultyState();
}

class _EnrollmentsPageFacultyState extends State<EnrollmentsPageFaculty> {
  final semester_controller = TextEditingController(),
      year_controller = TextEditingController(),
      supervisor_name_controller = TextEditingController(),
      project_title_controller = TextEditingController();

  bool? ischecked = false;

  Future<Map<String, dynamic>?> getDoc(String collection, String id) async {
    var doc =
        await FirebaseFirestore.instance.collection(collection).doc(id).get();
    return doc.data();
  }

  StreamBuilder supervisorEnrollments() {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('instructors')
          .where('uid', isEqualTo: FirebaseAuth.instance.currentUser?.uid)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemCount: snapshot.data?.docs[0]['number_of_projects_as_head'],
            itemBuilder: (context, index) {
              // return Text('0');
              return FutureBuilder(
                future: getDoc('projects',
                    snapshot.data?.docs[0]['project_as_head_ids'][index]),
                builder: (context, snaphot) {
                  if (snapshot.hasData) {
                    // print(snaphot.data);
                    return ProjectTile(
                      info:
                          'Student Name(s) - ${snaphot.data?['student_name'][0]}, ${snaphot.data?['student_name'][1]} \nSemester - ${snaphot.data?['semester']}\nYear - ${snaphot.data?['year']}\nProject Description - ${snaphot.data?['description']}',
                      title: '${snaphot.data?['title']}',
                      title_onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoggedInScaffoldFaculty(
                                role: widget.role,
                                scaffoldbody: Row(
                                  children: const [
                                    ProjectPage(
                                      project: ['', '', '', '', '', '', '', ''],
                                    )
                                  ],
                                )),
                          ),
                        );
                      },
                      type: '${snaphot.data?['type']}',
                      theme: 'w',
                      isLink: true,
                    );
                  } else {
                    return Text('loading...');
                  }
                },
              );
            },
          );
        } else {
          return const CustomisedText(text: 'loading...');
        }
      },
    );
  }

  StreamBuilder allEnrollments() {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('projects').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemCount: snapshot.data?.docs.length,
            itemBuilder: (context, index) {
              print(snapshot.data?.docs[index]);
              // var doc = snapshot.data?.docs[index];

              return ProjectTile(
                info:
                    'Student Name(s) - ${snapshot.data?.docs[index]['student_name'][0]}, ${snapshot.data?.docs[index]['student_name'][1]} \nSemester - ${snapshot.data?.docs[index]['semester']}\nYear - ${snapshot.data?.docs[index]['year']}\nProject Description - ${snapshot.data?.docs[index]['description']}',
                title: '${snapshot.data?.docs[index]['title']}',
                title_onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoggedInScaffoldFaculty(
                          role: widget.role,
                          scaffoldbody: Row(
                            children: const [
                              ProjectPage(
                                project: ['', '', '', '', '', '', '', ''],
                              )
                            ],
                          )),
                    ),
                  );
                },
                type: '${snapshot.data?.docs[index]['type']}',
                theme: 'w',
                isLink: true,
              );
            },
          );
        } else {
          return const CustomisedText(text: 'loading...');
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 1440;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Expanded(
      child: Container(
        color: const Color(0xff302c42),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  child: Text(
                    'Enrollments',
                    style: SafeGoogleFont(
                      'Ubuntu',
                      fontSize: 50,
                      fontWeight: FontWeight.w700,
                      color: Color(0xffffffff),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  child: SizedBox(
                    // height: 150,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: 250,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomTextField(
                                  hinttext: 'Semester',
                                  texteditingcontroller: semester_controller,
                                ),
                                CustomTextField(
                                  hinttext: 'Year',
                                  texteditingcontroller: year_controller,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: 250,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomTextField(
                                  hinttext: 'Supervisor Name',
                                  texteditingcontroller:
                                      supervisor_name_controller,
                                ),
                                CustomTextField(
                                  hinttext: 'Project Title',
                                  texteditingcontroller:
                                      project_title_controller,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.grey[300],
                                  ),
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.search,
                                    ),
                                    iconSize: 30,
                                  ),
                                ),
                              ),
                              (widget.role == 'co')
                                  ? SizedBox(
                                      width: 200,
                                      child: Row(
                                        children: [
                                          Checkbox(
                                            value: ischecked,
                                            onChanged: (bool? value) {
                                              setState(
                                                () {
                                                  ischecked = value;
                                                },
                                              );
                                            },
                                            checkColor: Colors.white,
                                            side: const BorderSide(
                                                color: Colors.white),
                                          ),
                                          Text(
                                            'My Enrolments Only',
                                            style: SafeGoogleFont(
                                              'Ubuntu',
                                              fontSize: 10,
                                              fontWeight: FontWeight.w700,
                                              color: const Color(0xffffffff),
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  : Container(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // supervisorEnrollments(),
                // allEnrollments(),
                (widget.role == 'su')
                    ? supervisorEnrollments()
                    : allEnrollments(),
                const SizedBox(
                  height: 100,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
