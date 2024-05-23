// ignore_for_file: prefer_const_constructors

import 'package:erp_project/table.dart';
import 'package:flutter/material.dart';

import 'package:erp_project/tabbar.dart';

class Erp extends StatefulWidget {
  const Erp({Key? key}) : super(key: key);

  @override
  State<Erp> createState() => _ErpState();
}

class _ErpState extends State<Erp> {
  final _years = ['2023-24', '2022-23', '2021-22', '2020-21', '2019-20'];
  var selectedItem = '2023-24';
  var selectedIndex = 0;

  final List<Map<String, dynamic>> _destinations = [
    {'icon': Icons.location_city_rounded, 'label': 'Manage Institute'},
    {'icon': Icons.person, 'label': 'Students'},
    {'icon': Icons.person_3_rounded, 'label': 'Employees'},
    {'icon': Icons.person_add_alt_1_rounded, 'label': 'Admissions'},
    {'icon': Icons.timer, 'label': 'Attendance'},
    {'icon': Icons.calendar_month_rounded, 'label': 'Time Table'},
    {'icon': Icons.paste_outlined, 'label': 'Lesson Planning'},
    {'icon': Icons.featured_play_list_outlined, 'label': 'Exam'},
    {'icon': Icons.money_rounded, 'label': 'Fees'},
    {'icon': Icons.person_search_rounded, 'label': 'Account'},
  ];

  List<String> get itemsList => [
     'Configuration',
    'Push Notifications',
    'SMS',
    'Notice Board',
    'Email',
    'FeedBack',
    'Survey',
    'WhatsApp',
    'Discussion Board',
    'Digital Dairy',
  ];

  String markerSelectionValue = "Configuration";

  int tabIndexValue = 0;

  void changeMarkerSelectionValue(String value) {
    setState(() {
      markerSelectionValue = value;
    });
  }

  void getTabIndexValue(int index) {
    setState(() {
      tabIndexValue = index;
    });
  }

   List<String> tabsList(String value) {
    switch (value) {
      case 'Configuration':
        return [""]; // Adjust based on your tab configuration
      case 'Push Notifications':
        return [""]; // Adjust based on your tab configuration
      case 'SMS':
        return [""]; // Adjust based on your tab configuration
      case 'Notice Board':
        return [""]; // Adjust based on your tab configuration
      case 'Email':
        return [""]; // Adjust based on your tab configuration
      case 'FeedBack':
        return [""]; // Adjust based on your tab configuration
      case 'Survey':
        return [""]; // Adjust based on your tab configuration
      case 'WhatsApp':
        return [""]; // Adjust based on your tab configuration
      case 'Discussion Board':
        return [""]; // Adjust based on your tab configuration
      case 'Digital Dairy':
        return [""]; // Adjust based on your tab configuration
      default:
        return ["Tab1"];
    }
  }

  List<double> getMarkerPositions(String value) {
    switch (value) {
      case 'Configuration':
        return [50.0, 57.0, 64.0];
      case 'Push Notifications':
        return [170.0, 177.0, 184.0]; 
      case 'SMS':
        return [250.0, 257.0, 264.0]; 
      case 'Notice Board':
        return [320.0, 327.0, 334.0]; 
      case 'Email':
        return [390.0, 397.0, 404.0]; 
      case 'FeedBack':
        return [460.0, 467.0, 473.0]; 
      case 'Survey':
        return [530.0, 537.0, 544.0]; 
      case 'WhatsApp':
        return [600.0, 607.0, 614.0]; 
      case 'Discussion Board':
        return [700.0, 707.0, 714.0]; 
      case 'Digital Dairy':
        return [800.0, 807.0, 814.0]; 
      default:
        return [50.0, 57.0, 64.0]; 
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff197AE9),
        leading: Padding(
          padding: const EdgeInsets.only(left: 12, top: 8, bottom: 8, right: 0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              'assets/sv.jpg',
              fit: BoxFit.cover,
              height: 20,
              width: 50,
            ),
          ),
        ),
        centerTitle: false,
        title: const Text(
          'Swami Vivekanand English Medium School',
          style: TextStyle(
            fontFamily: 'Founders Grotesk',
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.all(10),
            height: 40,
            width: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xff0061CF),
            ),
            child: TextFormField(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                filled: true,
                fillColor: const Color(0xff0061CF),
                suffixIcon: const Icon(
                  Icons.search,
                  color: Colors.white,
                  size: 20,
                ),
                hintText: 'Search',
                hintStyle: const TextStyle(
                  fontFamily: 'Founders Grotesk',
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
              cursorColor: Colors.white,
              style: const TextStyle(
                fontFamily: 'Founders Grotesk',
                fontWeight: FontWeight.w500,
                fontSize: 13,
                color: Colors.black,
              ),
            ),
          ),
          Card(
            elevation: 1,
            child: Container(
              height: 37,
              width: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: DropdownButton<String>(
                isExpanded: true,
                value: selectedItem,
                underline: const SizedBox(),
                onChanged: (item) {
                  setState(() {
                    selectedItem = item!;
                  });
                },
                icon: const Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: Colors.black,
                  size: 20,
                ),
                items: _years.map((item) {
                  return DropdownMenuItem(
                    value: item,
                    child: Text(
                      item,
                      style: const TextStyle(
                        fontFamily: 'Founders Grotesk',
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                        color: Colors.black,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.favorite_rounded,
              color: Colors.white,
              size: 20,
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.notifications_rounded,
              color: Colors.white,
              size: 20,
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.settings,
              color: Colors.white,
              size: 20,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 8, right: 20),
            child: CircleAvatar(
              backgroundImage: AssetImage(
                'assets/boy.jpg',
              ),
              radius: 13,
            ),
          ),
        ],
      ),
      body: Row(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Container(
      width: 155,
      color: Color(0xff197AE9), // Set a fixed width for the ListView
      child: ListView.builder(
        shrinkWrap: true, // Add this line
        itemCount: _destinations.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              const Divider(
                color: Colors.white24,
                thickness: 0.5,
                height: 2,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: Container(
                  width: double.infinity,
                  height: 70,
                  color: selectedIndex == index
                      ? Colors.orange
                      : Colors.transparent,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        _destinations[index]['icon'],
                        color: Colors.white,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        _destinations[index]['label'],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontFamily: 'gilroy',
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    ),
    Expanded(
      child: Column(
        children: [
         // const SizedBox(height: 10),
          Expanded(
            child: IGuruPrepCommonHeaderTabBar(
              mainOptionList: itemsList,
              markerSelectionValue: markerSelectionValue,
              changeMarkerSelectionValue: changeMarkerSelectionValue,
              getMarkerPositions: getMarkerPositions,
              isHaveTabs: true,
              tabsList: tabsList,
              getTabsIndex: getTabIndexValue,
              child: markerSelectionValue == "Configuration"
                  ? Tables()
                  : AdminGenerateQuestionPaperOverView(
                      tabIndex: tabIndexValue,
                    ),
            ),
          ),
        ],
      ),
    ),
  ],
),

    );
  }
}

class AdminGenerateQuestionPaperOverView extends StatelessWidget {
  const AdminGenerateQuestionPaperOverView({super.key, required int tabIndex});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Generate Question Paper Overview"),
    );
  }
}
