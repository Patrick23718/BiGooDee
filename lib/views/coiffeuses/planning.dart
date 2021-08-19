import 'package:bigoodee/constants.dart';
import 'package:bigoodee/enums.dart';
import 'package:bigoodee/helpers/coustom_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:toggle_switch/toggle_switch.dart';

class PlanningScreen extends StatefulWidget {
  const PlanningScreen({Key? key}) : super(key: key);

  @override
  _PlanningScreenState createState() => _PlanningScreenState();
}

class _PlanningScreenState extends State<PlanningScreen> {
  late int _page = 0;

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    _page = 0;
    super.setState(fn);
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
                  },
                ),
              ),
            ),
            (_page == 0) ? Reservation() : Text('data')
          ],
        ),
      ),
    );
  }
}

class Reservation extends StatefulWidget {
  @override
  _ReservationState createState() => _ReservationState();
}

class _ReservationState extends State<Reservation> {
  @override
  Widget build(BuildContext context) {
    var _selectedDay = DateTime.now().obs;
    var _focusedDay = DateTime.now().obs;
    double width = MediaQuery.of(context).size.width / 12;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          TableCalendar(
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            focusedDay: DateTime.now(),
            selectedDayPredicate: (DateTime date) {
              return isSameDay(_selectedDay.value, date);
            },
            onFormatChanged: (CalendarFormat _format) {},
            // shouldFillViewport: true,
            startingDayOfWeek: StartingDayOfWeek.monday,
            calendarStyle: CalendarStyle(
                selectedDecoration: BoxDecoration(
                  color: kPrimaryColor,
                ),
                todayDecoration: BoxDecoration(
                    color: kPrimaryColor, shape: BoxShape.circle)),
            headerStyle: HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
                formatButtonDecoration: BoxDecoration(color: kPrimaryColor),
                formatButtonTextStyle: TextStyle(color: kPrimaryColor)),
            // headerVisible: fals,
            // onDaySelected: (DateTime daySelected, DateTime focusDay){},
            //         selectedDayPredicate: (day) {
            //   return isSameDay(_selectedDay, day);
            // },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay.value = selectedDay;
                _focusedDay.value =
                    focusedDay; // update `_focusedDay` here as well
                print(_selectedDay.value);
              });
            },
            // locale: 'fr_FR'
          ),
        ],
      ),
    );
  }
}
