import 'package:bigoodee/constants.dart';
import 'package:bigoodee/enums.dart';
import 'package:bigoodee/helpers/coustom_bottom_nav_bar.dart';
import 'package:bigoodee/services/planningServices.dart';
import 'package:bigoodee/services/userServices.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class PlanningScreen extends StatefulWidget {
  const PlanningScreen({Key? key}) : super(key: key);

  @override
  _PlanningScreenState createState() => _PlanningScreenState();
}

class _PlanningScreenState extends State<PlanningScreen> {
  late int _page = 0;
  UserServices _userServices = UserServices();
  PlanningServices _planningServices = PlanningServices();
  User? user;
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();
  bool _switchValueC = false;
  bool _switchValueA = false;
  bool _switchValueB = false;

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    // _page = 0;
    super.setState(fn);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    user = _userServices.getUser();
    initializeDateFormatting();
    var dateFormat = new DateFormat.yMMMMd('cs');
    var timeFormat = new DateFormat.Hms('cs');
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width / 12;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        centerTitle: true,
        title: Text(
          'Mon planning',
          style: headingStyle,
        ),
        leading: IconButton(
          icon: SvgPicture.asset('icons/back.svg'),
          onPressed: () {
            Get.back();
            // Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(onPressed: () {}, icon: SvgPicture.asset('icons/Bell.svg'))
        ],
        backgroundColor: Colors.transparent,
        bottomOpacity: 0,
        elevation: 0,
      ),
      bottomNavigationBar: CustomBottomNavBar(
        selectedMenu: MenuState.planning,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFF54514C).withOpacity(0.1),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: ToggleSwitch(
                  minWidth: double.infinity,
                  minHeight: 45.0,
                  fontSize: 16.0,
                  initialLabelIndex: _page,
                  activeBgColor: [kPrimaryColor],
                  activeFgColor: Colors.white,
                  inactiveBgColor: kSecondaryColor,
                  inactiveFgColor: kPrimaryColor,
                  totalSwitches: 2,
                  labels: ['RÉSERVATIONS', 'DISPONIBILITÉS'],
                  // customTextStyles: [
                  //   TextStyle(fontWeight: FontWeight.w800),
                  //   TextStyle(fontWeight: FontWeight.w800),
                  // ],
                  onToggle: (index) {
                    print('switched to: $index');
                    setState(() {
                      _page = index;
                    });
                    if (_page == 0) {
                      _switchValueC = false;
                      _switchValueA = false;
                      _switchValueB = false;
                    } else {
                      //fonction defini
                    }
                  },
                ),
              ),
            ),
            (_page == 0)
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        TableCalendar(
                          focusedDay: selectedDay,
                          firstDay: DateTime(1990),
                          lastDay: DateTime(2050),
                          calendarFormat: format,
                          onFormatChanged: (CalendarFormat _format) {
                            setState(() {
                              format = _format;
                            });
                          },
                          startingDayOfWeek: StartingDayOfWeek.sunday,
                          daysOfWeekVisible: true,

                          //Day Changed
                          onDaySelected:
                              (DateTime selectDay, DateTime focusDay) async {
                            setState(() {
                              selectedDay = selectDay;
                              focusedDay = focusDay;
                            });
                            var test = await _planningServices.fetchPlanning(
                                user!.uid, focusedDay.toString());
                            if (test!.length != 0) {
                              print('object ${test.length}');
                              for (var i = 0; i < test.length; i++) {
                                if (test[i].plage == "08h - 12h") {
                                  setState(() {
                                    _switchValueA = true;
                                  });
                                } else if (test[i].plage == "12h - 18h") {
                                  setState(() {
                                    _switchValueB = true;
                                  });
                                } else if (test[i].plage == "18h - 22h") {
                                  setState(() {
                                    _switchValueC = true;
                                  });
                                }
                              }
                            }

                            setState(() {
                              _page = 1;
                            });

                            print(focusedDay);
                          },
                          selectedDayPredicate: (DateTime date) {
                            return isSameDay(selectedDay, date);
                          },

                          //To style the Calendar
                          calendarStyle: CalendarStyle(
                            isTodayHighlighted: true,
                            selectedDecoration: BoxDecoration(
                              color: kPrimaryColor,
                              shape: BoxShape.circle,
                              // borderRadius: BorderRadius.circular(5.0),
                            ),
                            selectedTextStyle: TextStyle(color: Colors.white),
                            todayDecoration: BoxDecoration(
                              color: kPrimaryColor.withOpacity(0.5),
                              shape: BoxShape.circle,
                              // borderRadius: BorderRadius.circular(5.0),
                            ),
                            defaultDecoration: BoxDecoration(
                              shape: BoxShape.circle,
                              // borderRadius: BorderRadius.circular(5.0),
                            ),
                            weekendDecoration: BoxDecoration(
                              shape: BoxShape.circle,
                              // borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          headerStyle: HeaderStyle(
                            formatButtonVisible: false,
                            titleCentered: true,
                            formatButtonShowsNext: false,
                            formatButtonDecoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            formatButtonTextStyle: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20.0, right: 20, top: 24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Mardi 01 septembre",
                              style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.black.withOpacity(0.7),
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        thickness: 1.5,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "08h - 12h",
                              style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.black.withOpacity(0.7),
                                  fontWeight: FontWeight.w400),
                            ),
                            CupertinoSwitch(
                              value: _switchValueA,
                              onChanged: (value) {
                                setState(() {
                                  _switchValueA = value;
                                });
                                if (value) {
                                  _planningServices.createPlanning(user!.uid,
                                      focusedDay.toString(), "08h - 12h");
                                } else {
                                  _planningServices.deletePlannig(user!.uid,
                                      focusedDay.toString(), "08h - 12h");
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        thickness: 1.5,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "12h - 18h",
                              style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.black.withOpacity(0.7),
                                  fontWeight: FontWeight.w400),
                            ),
                            CupertinoSwitch(
                              value: _switchValueB,
                              onChanged: (value) {
                                setState(() {
                                  _switchValueB = value;
                                });
                                if (value) {
                                  _planningServices.createPlanning(user!.uid,
                                      focusedDay.toString(), "12h - 18h");
                                } else {
                                  _planningServices.deletePlannig(user!.uid,
                                      focusedDay.toString(), "12h - 18h");
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        thickness: 1.5,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "18h - 22h",
                              style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.black.withOpacity(0.7),
                                  fontWeight: FontWeight.w400),
                            ),
                            CupertinoSwitch(
                              value: _switchValueC,
                              onChanged: (value) {
                                setState(() {
                                  _switchValueC = value;
                                });
                                if (value) {
                                  _planningServices.createPlanning(user!.uid,
                                      focusedDay.toString(), "18h - 22h");
                                } else {
                                  _planningServices.deletePlannig(user!.uid,
                                      focusedDay.toString(), "18h - 22h");
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        thickness: 1.5,
                      )
                    ],
                  )
          ],
        ),
      ),
    );
  }
}

class Disponibilite extends StatefulWidget {
  const Disponibilite({Key? key}) : super(key: key);

  @override
  _DisponibiliteState createState() => _DisponibiliteState();
}

class _DisponibiliteState extends State<Disponibilite> {
  bool _switchValueC = true;
  bool _switchValueA = true;
  bool _switchValueB = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20, top: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Mardi 01 septembre",
                style: TextStyle(
                    fontSize: 22,
                    color: Colors.black.withOpacity(0.7),
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
        Divider(
          thickness: 1.5,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "08h - 12h",
                style: TextStyle(
                    fontSize: 22,
                    color: Colors.black.withOpacity(0.7),
                    fontWeight: FontWeight.w400),
              ),
              CupertinoSwitch(
                value: _switchValueA,
                onChanged: (value) {
                  setState(() {
                    _switchValueA = value;
                  });
                },
              ),
            ],
          ),
        ),
        Divider(
          thickness: 1.5,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "12h - 18h",
                style: TextStyle(
                    fontSize: 22,
                    color: Colors.black.withOpacity(0.7),
                    fontWeight: FontWeight.w400),
              ),
              CupertinoSwitch(
                value: _switchValueB,
                onChanged: (value) {
                  setState(() {
                    _switchValueB = value;
                  });
                },
              ),
            ],
          ),
        ),
        Divider(
          thickness: 1.5,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "18h - 22h",
                style: TextStyle(
                    fontSize: 22,
                    color: Colors.black.withOpacity(0.7),
                    fontWeight: FontWeight.w400),
              ),
              CupertinoSwitch(
                value: _switchValueC,
                onChanged: (value) {
                  setState(() {
                    _switchValueC = value;
                  });
                },
              ),
            ],
          ),
        ),
        Divider(
          thickness: 1.5,
        )
      ],
    );
  }
}

class ReservationCalendar extends StatefulWidget {
  @override
  _ReservationCalendarState createState() => _ReservationCalendarState();
}

class _ReservationCalendarState extends State<ReservationCalendar> {
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();
  @override
  Widget build(BuildContext context) {
    var _selectedDay = DateTime.now();
    var _focusedDay = DateTime.now();
    double width = MediaQuery.of(context).size.width / 12;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          TableCalendar(
            focusedDay: selectedDay,
            firstDay: DateTime(1990),
            lastDay: DateTime(2050),
            calendarFormat: format,
            onFormatChanged: (CalendarFormat _format) {
              setState(() {
                format = _format;
              });
            },
            startingDayOfWeek: StartingDayOfWeek.sunday,
            daysOfWeekVisible: true,

            //Day Changed
            onDaySelected: (DateTime selectDay, DateTime focusDay) {
              setState(() {
                selectedDay = selectDay;
                focusedDay = focusDay;
              });
              print(focusedDay);
            },
            selectedDayPredicate: (DateTime date) {
              return isSameDay(selectedDay, date);
            },

            //To style the Calendar
            calendarStyle: CalendarStyle(
              isTodayHighlighted: true,
              selectedDecoration: BoxDecoration(
                color: kPrimaryColor,
                shape: BoxShape.circle,
                // borderRadius: BorderRadius.circular(5.0),
              ),
              selectedTextStyle: TextStyle(color: Colors.white),
              todayDecoration: BoxDecoration(
                color: kPrimaryColor.withOpacity(0.5),
                shape: BoxShape.circle,
                // borderRadius: BorderRadius.circular(5.0),
              ),
              defaultDecoration: BoxDecoration(
                shape: BoxShape.circle,
                // borderRadius: BorderRadius.circular(5.0),
              ),
              weekendDecoration: BoxDecoration(
                shape: BoxShape.circle,
                // borderRadius: BorderRadius.circular(5.0),
              ),
            ),
            headerStyle: HeaderStyle(
              formatButtonVisible: false,
              titleCentered: true,
              formatButtonShowsNext: false,
              formatButtonDecoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(5.0),
              ),
              formatButtonTextStyle: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
