import '/ui/tampil_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FormData extends StatefulWidget {
  const FormData({Key? key}) : super(key: key);

  @override
  FormDataState createState() => FormDataState();
}

class FormDataState extends State<FormData> {
  final _namaController = TextEditingController();
  final _nimController = TextEditingController();
  final _tahunController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade300,
        title: const Text("Input Data"),
      ),
      body: Container(
        color: Colors.blue.shade100,
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            _buildFormCard(_textboxNama()),
            const SizedBox(height: 10),
            _buildFormCard(_textboxNIM()),
            const SizedBox(height: 10),
            _buildFormCard(_textboxTahun()),
            const SizedBox(height: 20),
            _tombolSimpan(),
          ],
        ),
      ),
    );
  }

  Widget _buildFormCard(Widget child) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: child,
      ),
    );
  }

  _textboxNama() {
    return TextField(
      decoration: const InputDecoration(
        labelText: "Nama",
        prefixIcon: Icon(Icons.person),
      ),
      controller: _namaController,
    );
  }

  _textboxNIM() {
    return TextField(
      decoration: const InputDecoration(
        labelText: "NIM",
        prefixIcon: Icon(Icons.badge),
      ),
      controller: _nimController,
    );
  }

  _textboxTahun() {
    return TextField(
      decoration: const InputDecoration(
        labelText: "Tahun Lahir",
        prefixIcon: Icon(Icons.calendar_today),
      ),
      controller: _tahunController,
    );
  }

  _tombolSimpan() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          String nama = _namaController.text;
          String nim = _nimController.text;
          int tahun = int.parse(_tahunController.text);
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) =>
                  TampilData(nama: nama, nim: nim, tahun: tahun)));
        },
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 5,
        ),
        child: const Text(
          'Simpan',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
