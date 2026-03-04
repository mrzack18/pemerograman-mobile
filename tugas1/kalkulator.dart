import 'dart:io';

// Class Kalkulator
class Kalkulator {
  // Metode untuk penjumlahan
  double tambah(double a, double b) {
    return a + b;
  }

  // Metode untuk pengurangan
  double kurang(double a, double b) {
    return a - b;
  }

  // Metode untuk perkalian
  double kali(double a, double b) {
    return a * b;
  }

  // Metode untuk pembagian
  double bagi(double a, double b) {
    if (b == 0) {
      throw ArgumentError('Pembagi tidak boleh nol');
    }
    return a / b;
  }
}

// Fungsi untuk mendapatkan input angka dari pengguna dengan validasi
double inputAngka(String pesan) {
  while (true) {
    stdout.write(pesan);

    String? input = stdin.readLineSync();

    if (input != null && input.trim().isNotEmpty) {
      double? angka = double.tryParse(input);

      if (angka != null) {
        return angka;
      } else {
        print('Error: Harap masukkan format angka yang benar!\n');
      }
    } else {
      print('Error: Input tidak boleh kosong!\n');
    }
  }
}

// fungsi utama
void main() {
  Kalkulator kalkulator = Kalkulator();

  print('=== PROGRAM KALKULATOR DART ===');

  double angka1 = inputAngka('Masukkan angka pertama : ');
  double angka2 = inputAngka('Masukkan angka kedua   : ');

  print('\n=== HASIL PERHITUNGAN ===');
  print('Hasil Penjumlahan : ${kalkulator.tambah(angka1, angka2)}');
  print('Hasil Pengurangan : ${kalkulator.kurang(angka1, angka2)}');
  print('Hasil Perkalian   : ${kalkulator.kali(angka1, angka2)}');

  try {
    double hasilBagi = kalkulator.bagi(angka1, angka2);
    print('Hasil Pembagian   : $hasilBagi');
  } catch (e) {
    print('Hasil Pembagian   : Gagal (${e.toString()})');
  }
}
