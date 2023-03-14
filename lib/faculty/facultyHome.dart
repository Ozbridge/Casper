import 'package:casper/faculty/enrollmentsPageFaculty.dart';
import 'package:casper/faculty/panelListPage.dart';
import 'package:casper/utilites.dart';
import 'package:flutter/material.dart';

import 'loggedinscaffoldFaculty.dart';

class FacultyHome extends StatefulWidget {
  final role;

  const FacultyHome({Key? key, this.role = 'su'}) : super(key: key);

  @override
  State<FacultyHome> createState() => _FacultyHomeState();
}

class _FacultyHomeState extends State<FacultyHome> {
  void onPressed() {}
  dynamic shownpage;
  var option;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    option = 1;
    shownpage = EnrollmentsPageFaculty(
      role: widget.role,
    );
  }

  @override
  Widget build(BuildContext context) {
    // setState(
    //   () {
    //     shownpage = EnrollmentsPageFaculty(
    //       role: widget.role,
    //     );
    //   },
    // );
    return LoggedInScaffoldFaculty(
      scaffoldbody: Row(
        children: [
          Container(
            width: 300,
            color: Color(0xff545161),
            child: ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: 80,
                      child: TextButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              option == 1 ? const Color(0xff302c42) : null),
                          shape: MaterialStateProperty.all(
                            const ContinuousRectangleBorder(),
                          ),
                        ),
                        onPressed: () {
                          setState(
                            () {
                              option = 1;
                              shownpage = EnrollmentsPageFaculty(
                                role: widget.role,
                              );
                            },
                          );
                        },
                        child: Text(
                          'Enrollments',
                          style: SafeGoogleFont(
                            'Montserrat',
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Color(0xffffffff),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 80,
                      child: TextButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              option == 2 ? const Color(0xff302c42) : null),
                          shape: MaterialStateProperty.all(
                            const ContinuousRectangleBorder(),
                          ),
                        ),
                        onPressed: () {
                          setState(
                            () {
                              option = 2;
                              shownpage = PanelPageFaculty(
                                role: widget.role,
                              );
                            },
                          );
                        },
                        child: Text(
                          'Panels',
                          style: SafeGoogleFont(
                            'Montserrat',
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Color(0xffffffff),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          shownpage,
        ],
      ),
    );
  }
}
