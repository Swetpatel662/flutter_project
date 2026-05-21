import 'package:flutter/material.dart';

import '../models/complaint_model.dart';

class AddComplaintScreen extends StatefulWidget {
  final ComplaintModel? complaint;

  const AddComplaintScreen({super.key, this.complaint});

  @override
  State<AddComplaintScreen> createState() => _AddComplaintScreenState();
}

class _AddComplaintScreenState extends State<AddComplaintScreen> {
  TextEditingController roomController = TextEditingController();

  TextEditingController titleController = TextEditingController();

  TextEditingController descriptionController = TextEditingController();

  String selectedStatus = "Pending";

  @override
  void initState() {
    super.initState();

    // EDIT MODE
    if (widget.complaint != null) {
      roomController.text = widget.complaint!.room;

      titleController.text = widget.complaint!.title;

      descriptionController.text = widget.complaint!.description;

      selectedStatus = widget.complaint!.status;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.complaint == null ? "Add Complaint" : "Edit Complaint",
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: SingleChildScrollView(
          child: Column(
            children: [
              // ROOM NUMBER
              TextField(
                controller: roomController,

                keyboardType: TextInputType.number,

                decoration: const InputDecoration(
                  labelText: "Room Number",

                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 20),

              // TITLE
              TextField(
                controller: titleController,

                decoration: const InputDecoration(
                  labelText: "Title",

                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 20),

              // DESCRIPTION
              TextField(
                controller: descriptionController,

                maxLines: 4,

                decoration: const InputDecoration(
                  labelText: "Description",

                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 20),

              // STATUS
              DropdownButtonFormField<String>(
                value: selectedStatus,

                items: const [
                  DropdownMenuItem(value: "Pending", child: Text("Pending")),

                  DropdownMenuItem(
                    value: "In Progress",
                    child: Text("In Progress"),
                  ),

                  DropdownMenuItem(value: "Solved", child: Text("Solved")),
                ],

                onChanged: (value) {
                  setState(() {
                    selectedStatus = value!;
                  });
                },

                decoration: const InputDecoration(
                  labelText: "Status",

                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 20),

              // BUTTON
              SizedBox(
                width: double.infinity,

                child: ElevatedButton(
                  onPressed: () {
                    // ROOM VALIDATION
                    if (roomController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Please Enter Room No")),
                      );

                      return;
                    }

                    // TITLE VALIDATION
                    if (titleController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Please Enter Title")),
                      );

                      return;
                    }

                    // DESCRIPTION VALIDATION
                    if (descriptionController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Please Enter Description"),
                        ),
                      );

                      return;
                    }

                    // RETURN DATA
                    Navigator.pop(context, {
                      "room": roomController.text,

                      "title": titleController.text,

                      "description": descriptionController.text,

                      "status": selectedStatus,
                    });
                  },

                  child: Text(widget.complaint == null ? "Add" : "Update"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
