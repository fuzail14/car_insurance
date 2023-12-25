import 'package:car_insurance_app/Module/MarketPlace/View/market_place_screen.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:car_insurance_app/Constants/Extensions/extensions.dart';
import 'package:car_insurance_app/Routes/set_routes.dart';

import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../../Constants/constants.dart';
import '../../../Services/Shared Preferences/MySharedPreferences.dart';
import '../../../Widgets/admin_screen_custom_button.dart';
import '../../Menu/View/menu_screen.dart';
import '../Controller/home_screen_controller.dart';

class HomeScreen extends GetView {
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  HomeScreen({super.key});

  List<Widget> _buildScreens() {
    return [
      CustomLineChart(),
      MarketPlaceScreen(),
      Container(),
      Container(),
      Menu(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.home),
        title: ("Home"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.macwindow),
        title: ("MarketPlace"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.app_badge_fill),
        title: ("Approvals"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.waveform_circle),
        title: ("Employee Center"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.tortoise_fill),
        title: ("Menu"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      // Add more items as needed
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows: true,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style6,
    );
  }
}

class CustomLineChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      //resizeToAvoidBottomInset: true,
      navigationBar: CupertinoNavigationBar(
        middle: Text('Home'),
      ),
      child: SafeArea(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IncomeExpenseCard(),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xff020227),
                  borderRadius: BorderRadius.circular(18),
                ),
                padding: EdgeInsets.all(16),
                margin: EdgeInsets.all(16),
                child: LineChart(
                  LineChartData(
                    lineTouchData: LineTouchData(
                      touchTooltipData: LineTouchTooltipData(
                        tooltipBgColor: Colors.blueAccent,
                        getTooltipItems: (List<LineBarSpot> touchedBarSpots) {
                          return touchedBarSpots.map((barSpot) {
                            final flSpot = barSpot;
                            return LineTooltipItem(
                              '${flSpot.y}m',
                              const TextStyle(color: Colors.white),
                            );
                          }).toList();
                        },
                      ),
                      touchCallback: (FlTouchEvent, LineTouchResponse) {},
                      handleBuiltInTouches: true,
                    ),
                    gridData: FlGridData(
                      show: true,
                      drawHorizontalLine: true,
                      horizontalInterval: 1,
                      getDrawingVerticalLine: (value) {
                        return FlLine(
                          color: Colors.white10,
                          strokeWidth: 1,
                        );
                      },
                      getDrawingHorizontalLine: (value) {
                        return FlLine(
                          color: Colors.white10,
                          strokeWidth: 1,
                        );
                      },
                    ),
                    titlesData: FlTitlesData(
                      show: true,
                      rightTitles:
                          AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      topTitles:
                          AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: _bottomTitleWidgets,
                          reservedSize: 42,
                        ),
                      ),
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: _leftTitleWidgets,
                          reservedSize: 42,
                        ),
                      ),
                    ),
                    borderData: FlBorderData(
                      show: true,
                      border: Border.all(color: Color(0xff37434d), width: 1),
                    ),
                    minX: 0,
                    maxX: 11,
                    minY: 0,
                    maxY: 6,
                    lineBarsData: _linesBarData(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<LineChartBarData> _linesBarData() {
    LineChartBarData lineChartBarData1 = LineChartBarData(
      spots: [
        FlSpot(0, 1),
        FlSpot(2, 3),
        FlSpot(4, 1.5),
        FlSpot(6, 4),
        FlSpot(8, 3.2),
        FlSpot(10, 4),
      ],
      isCurved: true,
      color: Colors.purpleAccent,
      barWidth: 4,
      isStrokeCapRound: true,
      dotData: FlDotData(show: true),
      belowBarData: BarAreaData(show: false),
    );

    LineChartBarData lineChartBarData2 = LineChartBarData(
      spots: [
        FlSpot(0, 2.8),
        FlSpot(2, 1.9),
        FlSpot(4, 3),
        FlSpot(6, 2.5),
        FlSpot(8, 2.2),
        FlSpot(10, 2.8),
      ],
      isCurved: true,
      color: Colors.blueAccent,
      barWidth: 4,
      isStrokeCapRound: true,
      dotData: FlDotData(show: true),
      belowBarData: BarAreaData(show: false),
    );

    LineChartBarData lineChartBarData3 = LineChartBarData(
      spots: [
        FlSpot(0, 2.5),
        FlSpot(2, 1),
        FlSpot(4, 2.8),
        FlSpot(6, 1.5),
        FlSpot(8, 1.7),
        FlSpot(10, 2.5),
      ],
      isCurved: true,
      color: Colors.tealAccent,
      barWidth: 4,
      isStrokeCapRound: true,
      dotData: FlDotData(show: true),
      belowBarData: BarAreaData(show: false),
    );

    return [lineChartBarData1, lineChartBarData2, lineChartBarData3];
  }

  Widget _bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff68737d),
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );
    Widget text;
    switch (value.toInt()) {
      case 2:
        text = Text('SEPT', style: style);
        break;
      case 5:
        text = Text('OCT', style: style);
        break;
      case 8:
        text = Text('DEC', style: style);
        break;
      default:
        text = Text('', style: style);
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 8.0,
      child: text,
    );
  }

  Widget _leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff67727d),
      fontWeight: FontWeight.bold,
      fontSize: 15,
    );
    return Text('${value.toInt()}m', style: style, textAlign: TextAlign.left);
  }
}

class IncomeExpenseCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Income Vs Expense',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey,
              ),
            ),
            Divider(),
            SizedBox(height: 16),
            IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _InfoItem(
                    title: 'Income Today',
                    value: '\$15000.10',
                    iconColor: Colors.blue,
                    iconData: Icons.account_balance_wallet,
                  ),
                  VerticalDivider(),
                  _InfoItem(
                    title: 'Expense Today',
                    value: '\$7342.40',
                    iconColor: Colors.red,
                    iconData: Icons.money_off,
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _InfoItem(
                    title: 'Income This Month',
                    value: '\$200000.890',
                    iconColor: Colors.orange,
                    iconData: Icons.account_balance_wallet,
                  ),
                  VerticalDivider(),
                  _InfoItem(
                    title: 'Expense This Month',
                    value: '\$83500.90',
                    iconColor: Colors.pink,
                    iconData: Icons.money_off,
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

class _InfoItem extends StatelessWidget {
  final String title;
  final String value;
  final Color iconColor;
  final IconData iconData;

  const _InfoItem({
    Key? key,
    required this.title,
    required this.value,
    required this.iconColor,
    required this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Icon(
            iconData,
            color: iconColor,
            size: 48,
          ),
          SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black54,
            ),
          ),
          SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: iconColor,
            ),
          ),
        ],
      ),
    );
  }
}

// class LineChartSample extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: LineChart(
//         LineChartData(
//           gridData: FlGridData(
//             show: true,
//             drawVerticalLine: true,
//             getDrawingHorizontalLine: (value) {
//               return FlLine(
//                 color: const Color(0xff37434d),
//                 strokeWidth: 1,
//               );
//             },
//             getDrawingVerticalLine: (value) {
//               return FlLine(
//                 color: const Color(0xff37434d),
//                 strokeWidth: 1,
//               );
//             },
//           ),
//           titlesData: FlTitlesData(
//             show: true,
//             bottomTitles: AxisTitles(
//               sideTitles: SideTitles(
//                 showTitles: true,
//                 reservedSize: 35,
//                 getTitlesWidget: (double value, TitleMeta meta) {
//                   return Text(value.toInt().toString(),
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 12,
//                       ));
//                 },
//                 interval: 1,
//               ),
//             ),
//             leftTitles: AxisTitles(
//               sideTitles: SideTitles(
//                 showTitles: true,
//                 getTitlesWidget: (double value, TitleMeta meta) {
//                   return Text(value.toInt().toString(),
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 12,
//                       ));
//                 },
//                 reservedSize: 40,
//                 interval: 1,
//               ),
//             ),
//           ),
//           borderData: FlBorderData(
//             show: true,
//             border: Border.all(color: const Color(0xff37434d), width: 1),
//           ),
//           minX: 0,
//           maxX: 10,
//           minY: 0,
//           maxY: 6,
//           lineBarsData: [
//             LineChartBarData(
//               spots: [
//                 FlSpot(0, 3),
//                 FlSpot(2.6, 2),
//                 FlSpot(4.9, 5),
//                 FlSpot(6.8, 2.5),
//                 FlSpot(8, 4),
//                 FlSpot(9.5, 3),
//                 FlSpot(11, 4),
//               ],
//               isCurved: true,
//               color: Colors.blue,
//               barWidth: 5,
//               isStrokeCapRound: true,
//               dotData: FlDotData(
//                 show: false,
//               ),
//               belowBarData: BarAreaData(
//                 show: false,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class BarChartSample extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: BarChart(
//         BarChartData(
//           alignment: BarChartAlignment.spaceAround,
//           maxY: 20,
//           barTouchData: BarTouchData(
//             enabled: false,
//           ),
//           titlesData: FlTitlesData(
//             show: true,
//             bottomTitles: AxisTitles(
//               sideTitles: SideTitles(
//                 showTitles: true,
//                 reservedSize: 22,
//                 getTitlesWidget: (double value, TitleMeta meta) {
//                   String text;
//                   switch (value.toInt()) {
//                     case 0:
//                       text = 'Mon';
//                       break;
//                     case 1:
//                       text = 'Tue';
//                       break;
//                     case 2:
//                       text = 'Wed';
//                       break;
//                     case 3:
//                       text = 'Thu';
//                       break;
//                     case 4:
//                       text = 'Fri';
//                       break;
//                     case 5:
//                       text = 'Sat';
//                       break;
//                     case 6:
//                       text = 'Sun';
//                       break;
//                     default:
//                       text = '';
//                   }
//                   return SideTitleWidget(
//                     axisSide: meta.axisSide,
//                     space: 16.0,
//                     child: Text(text,
//                         style: TextStyle(
//                             color: Colors.black,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 14)),
//                   );
//                 },
//               ),
//             ),
//             leftTitles: AxisTitles(
//               sideTitles: SideTitles(showTitles: false),
//             ),
//           ),
//           gridData: FlGridData(
//             show: false,
//           ),
//           borderData: FlBorderData(
//             show: false,
//           ),
//           barGroups: [
//             BarChartGroupData(
//               x: 0,
//               barRods: [BarChartRodData(color: Colors.lightBlueAccent, toY: 8)],
//               showingTooltipIndicators: [0],
//             ),
//             BarChartGroupData(
//               x: 1,
//               barRods: [
//                 BarChartRodData(toY: 10, color: Colors.lightBlueAccent)
//               ],
//               showingTooltipIndicators: [0],
//             ),
//             BarChartGroupData(
//               x: 2,
//               barRods: [
//                 BarChartRodData(toY: 14, color: Colors.lightBlueAccent)
//               ],
//               showingTooltipIndicators: [0],
//             ),
//             BarChartGroupData(
//               x: 3,
//               barRods: [
//                 BarChartRodData(toY: 15, color: Colors.lightBlueAccent)
//               ],
//               showingTooltipIndicators: [0],
//             ),
//             BarChartGroupData(
//               x: 4,
//               barRods: [
//                 BarChartRodData(toY: 13, color: Colors.lightBlueAccent)
//               ],
//               showingTooltipIndicators: [0],
//             ),
//             BarChartGroupData(
//               x: 5,
//               barRods: [
//                 BarChartRodData(toY: 10, color: Colors.lightBlueAccent)
//               ],
//               showingTooltipIndicators: [0],
//             ),
//             BarChartGroupData(
//               x: 6,
//               barRods: [BarChartRodData(toY: 5, color: Colors.lightBlueAccent)],
//               showingTooltipIndicators: [0],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
