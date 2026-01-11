import 'package:flutter/material.dart';
import '../models/nilai_matakuliah.dart';
import 'detail_nilai_page.dart';

class MataKuliahPage extends StatelessWidget {
  final String semester;

  const MataKuliahPage({super.key, required this.semester});

  @override
  Widget build(BuildContext context) {

    // 1️⃣ Data dipetakan berdasarkan semester
    final Map<String, List<NilaiMataKuliah>> dataPerSemester = {
      "Semester 3": [
        NilaiMataKuliah(
          namaMatkul: "Algoritma",
          tugas1: 80,
          tugas2: 85,
          tugas3: 78,
          kuis: 75,
          uts: 82,
          uas: 88,
        ),
        NilaiMataKuliah(
          namaMatkul: "Struktur Data",
          tugas1: 78,
          tugas2: 80,
          tugas3: 82,
          kuis: 70,
          uts: 85,
          uas: 87,
        ),
      ],
      "Semester 4": [
        NilaiMataKuliah(
          namaMatkul: "Database",
          tugas1: 85,
          tugas2: 88,
          tugas3: 90,
          kuis: 80,
          uts: 87,
          uas: 92,
        ),
        NilaiMataKuliah(
          namaMatkul: "Pemrograman Mobile",
          tugas1: 82,
          tugas2: 84,
          tugas3: 86,
          kuis: 78,
          uts: 85,
          uas: 90,
        ),
      ],
    };

    // 2️⃣ Ambil data sesuai semester yang dipilih
    final List<NilaiMataKuliah> dataNilai =
        dataPerSemester[semester] ?? [];

    return Scaffold(
      appBar: AppBar(
        title: Text("Mata Kuliah $semester"),
      ),
      body: ListView.builder(
        itemCount: dataNilai.length,
        itemBuilder: (context, index) {

          // 3️⃣ Ambil satu data nilai
          final nilai = dataNilai[index];

          return ListTile(
            title: Text(nilai.namaMatkul),
            subtitle: Text(
              "Rata-rata: ${nilai.rataRata.toStringAsFixed(1)}",
            ),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => DetailNilaiPage(nilai: nilai),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
