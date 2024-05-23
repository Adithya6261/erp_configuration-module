import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class IGuruPrepCommonHeaderTabBar extends StatefulWidget {
  final List<String> mainOptionList;
  final String markerSelectionValue;
  final Function(String value) changeMarkerSelectionValue;
  final List<double> Function(String value) getMarkerPositions;
  final bool isHaveTabs;
  final Widget child;
  final List<String> Function(String value)? tabsList;
  final Function(int index)? getTabsIndex;

  const IGuruPrepCommonHeaderTabBar({
    Key? key,
    required this.mainOptionList,
    required this.markerSelectionValue,
    required this.changeMarkerSelectionValue,
    required this.getMarkerPositions,
    required this.isHaveTabs,
    required this.child,
    this.tabsList,
    this.getTabsIndex,
  }) : super(key: key);

  @override
  _IGuruPrepCommonHeaderTabBarState createState() => _IGuruPrepCommonHeaderTabBarState();
}

class _IGuruPrepCommonHeaderTabBarState extends State<IGuruPrepCommonHeaderTabBar> {
  bool _isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          color: Colors.white,
          child: SingleChildScrollView(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.horizontal,
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ...List.generate(
                          widget.mainOptionList.length,
                          (index) => textWidget(widget.mainOptionList[index]),
                        ),
                        const SizedBox(width: 100),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Transform.scale(
                            scale: 0.7,
                            child: CupertinoSwitch(
                              activeColor: Colors.orange,
                              value: _isSwitched,
                              onChanged: (bool value) {
                                setState(() {
                                  _isSwitched = value;
                                });
                              },
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 5),
                          child: Text(
                            'Add to Favorite',
                            style: TextStyle(
                              fontFamily: 'gilroy',
                              fontSize: 12,
                              fontWeight: FontWeight.w800,
                              color: Color(0xff182330),
                            ),
                          ),
                        ),
                      ],
                    ),
                    CustomPaint(
                      size: Size(MediaQuery.of(context).size.width, 9),
                      painter: RPSCustomPainter(
                        sizeList: widget.getMarkerPositions(widget.markerSelectionValue),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
          Visibility(
          visible: widget.markerSelectionValue == 'Configuration',
          child: Column(
            children: [
              Container(
                height: 40,
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 13),
                    child: Text(
                      'Communication Group',
                      style: TextStyle(
                        fontFamily: 'gilroy',
                        fontSize: 12,
                        fontWeight: FontWeight.w800,
                        color: Colors.orange,
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  height: 4,
                  width: 134,
                  color: Colors.orange,
                  margin: const EdgeInsets.only(left: 13),
                ),
              ),
            ],
          ),
        ),
        if (widget.isHaveTabs && widget.tabsList != null)
          Visibility(
            visible: widget.markerSelectionValue == 'Configuration',
            child: Container(
              color: Colors.white,
              child: DefaultTabController(
                key: Key(widget.markerSelectionValue),
                initialIndex: 0,
                length: widget.tabsList!(widget.markerSelectionValue).length,
                child: Container(
                  height: 0,
                  child: TabBar(
                    padding: EdgeInsets.zero,
                    onTap: (int index) {
                      if (widget.getTabsIndex != null) {
                        widget.getTabsIndex!(index);
                      }
                    },
                    isScrollable: true,
                    labelColor: Colors.orange,
                    unselectedLabelColor: Colors.grey,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorColor: Colors.orange,
                    indicatorWeight: 4.0,
                    labelStyle: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      fontFamily: "gilroy",
                      color: Colors.grey,
                    ),
                    unselectedLabelStyle: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      fontFamily: "gilroy",
                      color: Colors.grey,
                    ),
                    tabs: [
                      ...List.generate(
                        widget.tabsList!(widget.markerSelectionValue).length,
                        (index) => Tab(
                          text: widget.tabsList!(widget.markerSelectionValue)[index],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        Expanded(
          child: SingleChildScrollView(
            child: widget.child,
          ),
        ),
      ],
    );
  }

  Widget textWidget(String value) {
    return SizedBox(
      height: 20,
      child: GestureDetector(
        onTap: () {
          widget.changeMarkerSelectionValue(value);
        },
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10,top: 5),
              child: Text(
                value,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 13,
                  fontFamily: "gilroy",
                  color: widget.markerSelectionValue == value ? Colors.orange : Colors.grey,
                ),
              ),
            ),
            const SizedBox(width: 7),
          ],
        ),
      ),
    );
  }
}

class RPSCustomPainter extends CustomPainter {
  final List<double> sizeList;

  RPSCustomPainter({super.repaint, required this.sizeList});

  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(-20, 8.5321);
    path_0.lineTo(sizeList[0], 8.5321);
    path_0.lineTo(sizeList[1], 1.00004);
    path_0.lineTo(sizeList[2], 8.5321);
    path_0.lineTo(2000, 7.5321);

    Paint paint_0_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.7
      ..color = Colors.grey.shade400;
    canvas.drawPath(path_0, paint_0_stroke);

    Paint paint_0_fill = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.white;
    canvas.drawPath(path_0, paint_0_fill);

    Path path_1 = Path();
    path_1.moveTo(sizeList[0] - 25.0, 8.5321);
    path_1.lineTo(sizeList[0], 8.5321);
    path_1.lineTo(sizeList[1], 1.00004);
    path_1.lineTo(sizeList[2], 8.5321);
    path_1.lineTo(sizeList[0] + 40.0, 8.5321);

    Paint paint_1_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.9
      ..color = Colors.orange;
    canvas.drawPath(path_1, paint_1_stroke);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
