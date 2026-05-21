import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'add_complaint_screen.dart';
import '../models/complaint_model.dart';

class ComplaintListScreen extends StatefulWidget {
  const ComplaintListScreen({super.key});

  @override
  State<ComplaintListScreen> createState() => _ComplaintListScreenState();
}

class _ComplaintListScreenState extends State<ComplaintListScreen> {
  // DUMMY DATA (OBJECTS)
  List<ComplaintModel> complaints = [
    ComplaintModel(
      room: "101",
      title: "Water Problem",
      description: "No water supply",
      status: "Pending",
    ),

    ComplaintModel(
      room: "102",
      title: "Road Damage",
      description: "Road is broken",
      status: "In Progress",
    ),

    ComplaintModel(
      room: "103",
      title: "Electricity Issue",
      description: "Power cut in area",
      status: "Solved",
    ),
  ];

  String selectedFilter = "All";

  // FILTER METHOD
  List<ComplaintModel> get filteredComplaints {
    if (selectedFilter == "All") {
      return complaints;
    }

    return complaints.where((complaint) {
      return complaint.status == selectedFilter;
    }).toList();
  }

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

                const Text("Complaints"),
              ],
            ),

            Text(
              DateFormat('dd MMM yyyy').format(DateTime.now()),

              style: const TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),

      // ADD BUTTON
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.push(
            context,

            MaterialPageRoute(builder: (context) => const AddComplaintScreen()),
          );

          // ADD NEW COMPLAINT
          if (result != null) {
            setState(() {
              complaints.add(
                ComplaintModel(
                  room: result["101"],
                  title: result["title"],
                  description: result["description"],
                  status: result["status"],
                ),
              );
            });
          }
        },

        child: const Icon(Icons.add),
      ),

      body: Column(
        children: [
          // FILTER BUTTONS
          Container(
            color: Colors.blue.shade100,

            padding: const EdgeInsets.all(10),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      selectedFilter = "All";
                    });
                  },

                  child: const Text("All"),
                ),

                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      selectedFilter = "Pending";
                    });
                  },

                  child: const Text("Pending"),
                ),

                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      selectedFilter = "In Progress";
                    });
                  },

                  child: const Text("In Progress"),
                ),

                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      selectedFilter = "Solved";
                    });
                  },

                  child: const Text("Solved"),
                ),
              ],
            ),
          ),

          // LIST
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(10),

              itemCount: filteredComplaints.length,

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
                              // TITLE
                              Text(
                                "Room No.: ${filteredComplaints[index].room}",

                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,

                                  color: Colors.grey,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                filteredComplaints[index].title,

                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              const SizedBox(height: 8),

                              // DESCRIPTION
                              Text(filteredComplaints[index].description),

                              const SizedBox(height: 10),

                              // STATUS
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 6,
                                ),

                                decoration: BoxDecoration(
                                  color: Colors.blue.shade100,
                                  borderRadius: BorderRadius.circular(20),
                                ),

                                child: Text(filteredComplaints[index].status),
                              ),
                            ],
                          ),
                        ),

                        // EDIT + DELETE BUTTONS
                        if (filteredComplaints[index].status != "In Progress")
                          Column(
                            children: [
                              // EDIT
                              IconButton(
                                onPressed: () async {
                                  final result = await Navigator.push(
                                    context,

                                    MaterialPageRoute(
                                      builder: (context) => AddComplaintScreen(
                                        //complaint: filteredComplaints[index],
                                      ),
                                    ),
                                  );

                                  if (result != null) {
                                    setState(() {
                                      filteredComplaints[index] =
                                          ComplaintModel(
                                            room: result["room"],
                                            title: result["title"],
                                            description: result["description"],
                                            status: result["status"],
                                          );
                                    });
                                  }
                                },

                                icon: const Icon(Icons.edit),
                              ),

                              // DELETE
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    complaints.remove(
                                      filteredComplaints[index],
                                    );
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
          ),
        ],
      ),
    );
  }
}
