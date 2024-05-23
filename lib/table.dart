import 'package:erp_project/dialog.dart';
import 'package:erp_project/tabledata.dart';
import 'package:flutter/material.dart';

class Tables extends StatefulWidget {
  const Tables({Key? key}) : super(key: key);

  @override
  State<Tables> createState() => _TablesState();
}

class _TablesState extends State<Tables> {
  
 final _years = [
    '2023-2024',
    '2022-2023',
    '2021-2022',
    '2020-2021',
    '2019-2020'
  ];
  var selectedItem = '2023-2024';
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.all(20),
              height: 320,
              width: double.infinity,
              child: Column(
                children: [
                  Row(
                    children: [
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Communication Group',
                          style: TextStyle(
                            fontFamily: 'gilroy',
                            fontSize: 15,
                            fontWeight: FontWeight.w800,
                            color: Color(0xff182330),
                          ),
                        ),
                      ),
                      const SizedBox(width: 30),
                      const Text(
                        'Academic Year',
                        style: TextStyle(
                          fontFamily: 'gilroy',
                          fontSize: 12,
                          fontWeight: FontWeight.w800,
                          color: Color(0xff7E7A88),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Card(
                        elevation: 1,
                        child: Container(
                          height: 35,
                          width: 180,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: Colors.white,
                            border: Border.all(color: const Color(0xffCAC6D3)),
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
                                    fontFamily: 'gilroy',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 13,
                                    color: Color(0xff182330),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                      const Spacer(),
                      Container(
                        margin: const EdgeInsets.all(10),
                        height: 35,
                        width: 210,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          border: Border.all(color: const Color(0xffCAC6D3)),
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            filled: true,
                            fillColor: Colors.white,
                            suffixIcon: const Icon(
                              Icons.search,
                              color: Color(0xff7E7A88),
                              size: 20,
                            ),
                            hintText: 'Search',
                            hintStyle: const TextStyle(
                              fontFamily: 'gilroy',
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff7E7A88),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          cursorColor: Colors.black,
                          style: const TextStyle(
                            fontFamily: 'gilroy',
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) => const Dialogs());
                        },
                        child: Container(
                          height: 35,
                          width: 110,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.orange,
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 12,
                              ),
                              SizedBox(width: 2),
                              Text(
                                'Add Group',
                                style: TextStyle(
                                  fontFamily: 'gilroy',
                                  fontWeight: FontWeight.w800,
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: _widgetTablewidget(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Tabledata _widgetTablewidget() {
    return Tabledata();
  }
}