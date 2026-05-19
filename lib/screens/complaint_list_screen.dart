import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'add_complaint_screen.dart';

class ComplaintListScreen extends StatefulWidget {
  const ComplaintListScreen({super.key});

  @override
  State<ComplaintListScreen> createState() => _ComplaintListScreenState();
}

class _ComplaintListScreenState extends State<ComplaintListScreen> {
  List<Map<String, String>> complaints = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
            Row(
              children: [
                Image.asset("assets/logo.png", height: 30),

                const SizedBox(width: 10),

                const Text("Complains"),
              ],
            ),

            Text(
              DateFormat('dd MMM yyyy').format(DateTime.now()),

              style: const TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.push(
            context,

            MaterialPageRoute(builder: (context) => const AddComplaintScreen()),
          );

          if (result != null) {
            setState(() {
              complaints.add({
                "title": result["title"],

                "description": result["description"],

                "status": result["status"],
              });
            });
          }
        },

        // backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),

      body: ListView.builder(
        padding: const EdgeInsets.all(10),

        itemCount: complaints.length,

        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.only(bottom: 15),

            child: Padding(
              padding: const EdgeInsets.all(12),

              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Text(
                          complaints[index]["title"]!,

                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 8),

                        Text(complaints[index]["description"]!),

                        const SizedBox(height: 10),

                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),

                          decoration: BoxDecoration(
                            color: Colors.blue.shade100,

                            borderRadius: BorderRadius.circular(20),
                          ),

                          child: Text(complaints[index]["status"]!),
                        ),
                      ],
                    ),
                  ),

                  Column(
                    children: [
                      IconButton(
                        onPressed: () async {
                          final result = await Navigator.push(
                            context,

                            MaterialPageRoute(
                              builder: (context) => AddComplaintScreen(
                                complaint: complaints[index],
                              ),
                            ),
                          );

                          if (result != null) {
                            setState(() {
                              complaints[index] = {
                                "title": result["title"],

                                "description": result["description"],

                                "status": result["status"],
                              };
                            });
                          }
                        },

                        icon: const Icon(Icons.edit),
                      ),

                      IconButton(
                        onPressed: () {
                          setState(() {
                            complaints.removeAt(index);
                          });
                        },

                        icon: const Icon(Icons.delete),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
