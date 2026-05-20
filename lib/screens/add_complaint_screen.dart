import 'package:flutter/material.dart';

class AddComplaintScreen extends StatefulWidget {
  final Map<String, String>? complaint;

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

    if (widget.complaint != null) {
      roomController.text = widget.complaint!["room"] ?? "";

      titleController.text = widget.complaint!["title"]!;

      descriptionController.text = widget.complaint!["description"]!;

      selectedStatus = widget.complaint!["status"]!;
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

        child: Column(
          children: [
            TextField(
              controller: roomController,

              keyboardType: TextInputType.number,

              decoration: const InputDecoration(
                labelText: "Room Number",

                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              controller: titleController,

              decoration: const InputDecoration(
                labelText: "Title",

                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              controller: descriptionController,

              maxLines: 4,

              decoration: const InputDecoration(
                labelText: "Description",

                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            DropdownButtonFormField(
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

            SizedBox(
              width: double.infinity,

              child: ElevatedButton(
                onPressed: () {
                  if (roomController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Please Enter Room No")),
                      //const SnackBar(content: Text("Please enter Room No.")),
                    );

                    return;
                  }

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
    );
  }
}
