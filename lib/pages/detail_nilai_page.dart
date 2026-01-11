import 'package:flutter/material.dart';
import '../models/nilai_matakuliah.dart';

class DetailNilaiPage extends StatelessWidget {
  final NilaiMataKuliah nilai;

  const DetailNilaiPage({super.key, required this.nilai});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail ${nilai.namaMatkul}"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // ===== Bagian Nilai Komponen =====
            const Text(
              "Nilai Komponen",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),

            _itemNilai("Tugas 1", nilai.tugas1),
            _itemNilai("Tugas 2", nilai.tugas2),
            _itemNilai("Tugas 3", nilai.tugas3),
            _itemNilai("Kuis", nilai.kuis),
            _itemNilai("UTS", nilai.uts),
            _itemNilai("UAS", nilai.uas),

            const Divider(height: 32),

            // ===== Bagian Hasil Evaluasi =====
            const Text(
              "Hasil Evaluasi",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),

            Text(
              "Rata-rata : ${nilai.rataRata.toStringAsFixed(2)}",
              style: const TextStyle(fontSize: 16),
            ),
            Text(
              "Nilai Huruf : ${nilai.nilaiHuruf}",
              style: const TextStyle(fontSize: 16),
            ),
            Text(
              "Angka Mutu : ${nilai.angkaMutu}",
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  // Widget kecil untuk konsistensi tampilan
  Widget _itemNilai(String label, double nilai) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Text(
        "$label : $nilai",
        style: const TextStyle(fontSize: 15),
      ),
    );
  }
}
