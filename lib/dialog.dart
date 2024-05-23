import 'package:flutter/material.dart';

class Dialogs extends StatefulWidget {
  const Dialogs({super.key});

  @override
  State<Dialogs> createState() => _DialogsState();
}

class _DialogsState extends State<Dialogs> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: const EdgeInsets.only(top: 20, bottom: 20),
        width: 840,
        height: 360,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Container(
          child: Column(
            children: [
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      'Group Members',
                      style: TextStyle(
                        fontFamily: 'Founders Grotesk',
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff182330),
                      ),
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const CircleAvatar(
                        radius: 11,
                        backgroundColor: Colors.grey,
                        child: Icon(
                          Icons.close,
                          color: Colors.white,
                          size: 15,
                          weight: 1,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Divider(color: const Color(0xffEAEAEA)),
              SizedBox(height: 10),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: RichText(
                      text: const TextSpan(
                        text: 'Group Name :',
                        style: TextStyle(
                          fontFamily: 'Founders Grotesk',
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff182330),
                        ),
                        children: [
                          TextSpan(
                            text: '  Picnic',
                            style: TextStyle(
                              fontFamily: 'Founders Grotesk',
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff182330),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Spacer(),
                  const Padding(
                    padding: EdgeInsets.only(right: 20),
                    child: Text(
                      'Total Count : 45',
                      style: TextStyle(
                        fontFamily: 'Founders Grotesk',
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff182330),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Table(
                    defaultColumnWidth: const FixedColumnWidth(200),
                    border: TableBorder.all(
                        color: Colors.grey.shade500, width: 0.1),
                    children: [
                      const TableRow(
                        decoration: BoxDecoration(
                          color: Color(0xffF1F3F6),
                        ),
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'S.No.',
                              style: TextStyle(
                                fontFamily: 'gilroy',
                                fontSize: 13,
                                fontWeight: FontWeight.w800,
                                color: Color(0xff7E7A88),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Name',
                              style: TextStyle(
                                fontFamily: 'gilroy',
                                fontSize: 13,
                                fontWeight: FontWeight.w800,
                                color: Color(0xff7E7A88),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Class-Section',
                              style: TextStyle(
                                fontFamily: 'gilroy',
                                fontSize: 13,
                                fontWeight: FontWeight.w800,
                                color: Color(0xff7E7A88),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Mobile Number',
                              style: TextStyle(
                                fontFamily: 'gilroy',
                                fontSize: 13,
                                fontWeight: FontWeight.w800,
                                color: Color(0xff7E7A88),
                              ),
                            ),
                          ),
                        ],
                      ),
                      _buildTableRows(
                        [
                          '1',
                          'Adithya A.',
                          'XII-A',
                          '9989034183',
                        ],
                        index: 0,
                      ),
                      _buildTableRows(
                        [
                          '2',
                          'Sandeep A.',
                          'XII-B',
                          '8885416261',
                        ],
                        index: 1,
                      ),
                      _buildTableRows(
                        [
                          '3',
                          'battu B.',
                          'XII-A',
                          '9515934183',
                        ],
                        index: 2,
                      ),
                      _buildTableRows(
                        [
                          '4',
                          'Vishnu k.',
                          'XII-C',
                          '9863624482',
                        ],
                        index: 3,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

TableRow _buildTableRows(List<dynamic> cells, {required int index}) {
  bool isEvenRow = index % 2 != 0;
  return TableRow(
    decoration:
        isEvenRow ? const BoxDecoration(color: Color(0xffF1F3F6)) : null,
    children: cells.map((cell) {
      if (cell is Widget) {
        return cell;
      } else {
        return Padding(
          padding: const EdgeInsets.all(4.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              cell.toString(),
              style: const TextStyle(
                  fontFamily: 'gilroy',
                  fontWeight: FontWeight.w600,
                  color: Color(0xff182330),
                  fontSize: 13),
            ),
          ),
        );
      }
    }).toList(),
  );
}
