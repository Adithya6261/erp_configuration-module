import 'package:flutter/material.dart';

class Tabledata extends StatefulWidget {
  const Tabledata({super.key});

  @override
  State<Tabledata> createState() => _TabledataState();
}

class _TabledataState extends State<Tabledata> {
  final List<Map<String, String>> _tableData = [
    {
      'year': '2023-2024',
      'name': 'Picnic',
      'type': 'Student',
      'count': '54',
     
    },
    {
      'year': '2023-2024',
      'name': 'English Team',
      'type': 'Employee',
      'count': '09',
     
    },
    {
      'year': '2023-2024',
      'name': 'English Team',
      'type': 'Employee',
      'count': '45',
      
    },
    {
      'year': '2023-2024',
      'name': 'English Team',
      'type': 'Student',
      'count': '07',
      
    },
  ];

  final List<String> _headerdata = [
    'Actions',
    'Academic Year',
    'Group Name',
    'Type',
    'Count',
    'Group',
  ];
  

  void _deleteRow(int index) {
    setState(() {
      _tableData.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Table(
        defaultColumnWidth: const FixedColumnWidth(175),
        border: TableBorder.all(color: Colors.grey.shade500, width: 0.1),
        children: [
          TableRow(
            decoration: const BoxDecoration(
              color: Color(0xffF1F3F6),
            ),
            children: _headerdata.map((header) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  header,
                  style: const TextStyle(
                    fontFamily: 'gilroy',
                    fontSize: 13,
                    fontWeight: FontWeight.w800,
                    color: Color(0xff7E7A88),
                  ),
                ),
              );
            }).toList(),
          ),
          for (int i = 0; i < _tableData.length; i++)
            _buildTableRow(
              [
                _buildActionButtons(i),
                _tableData[i]['year']!,
                _tableData[i]['name']!,
                _tableData[i]['type']!,
                _tableData[i]['count']!,
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.remove_red_eye_rounded,
                      color: Color(0xff7E7A88),
                      size: 20,
                    ),
                  ),
                ),
              ],
              index: i,
            ),
        ],
      ),
    );
  }

  TableRow _buildTableRow(List<dynamic> cells, {required int index}) {
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

  Widget _buildActionButtons(int index) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            _editRow(index);
          },
          icon: const Icon(
            Icons.edit,
            color: Color(0Xff7E7A88),
            size: 20,
          ),
        ),
        IconButton(
          onPressed: () {
            _deleteRow(index);
          },
          icon: const Icon(
            Icons.delete_rounded,
            color: Color(0Xff7E7A88),
            size: 20,
          ),
        ),
      ],
    );
  }

  void _editRow(int index) {
    String editedYear = _tableData[index]['year']!;
    String editedName = _tableData[index]['name']!;
    String editedType = _tableData[index]['type']!;
    String editedCount = _tableData[index]['count']!;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: const Text('Edit Group'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                initialValue: editedYear,
                onChanged: (value) {
                  editedYear = value;
                },
                decoration: const InputDecoration(labelText: 'Academic Year'),
              ),
              TextFormField(
                initialValue: editedName,
                onChanged: (value) {
                  editedName = value;
                },
                decoration: const InputDecoration(labelText: 'Group Name'),
              ),
              TextFormField(
                initialValue: editedType,
                onChanged: (value) {
                  editedType = value;
                },
                decoration: const InputDecoration(labelText: 'Type'),
              ),
              TextFormField(
                initialValue: editedCount,
                onChanged: (value) {
                  editedCount = value;
                },
                decoration: const InputDecoration(labelText: 'Count'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _tableData[index]['year'] = editedYear;
                  _tableData[index]['name'] = editedName;
                  _tableData[index]['type'] = editedType;
                  _tableData[index]['count'] = editedCount;
                });
                Navigator.pop(context);
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }
}
