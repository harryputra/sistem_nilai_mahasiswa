import 'package:flutter/material.dart';
import 'matakuliah_page.dart';

class SemesterPage extends StatelessWidget {
  const SemesterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final semesters = ["Semester 3", "Semester 4"];

    return Scaffold(
      appBar: AppBar(title: const Text("Daftar Semester")),
      body: ListView.builder(
        itemCount: semesters.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(semesters[index]),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => MataKuliahPage(
                    semester: semesters[index],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
