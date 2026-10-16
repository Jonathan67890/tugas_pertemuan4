/// Mengubah angka menjadi format rupiah, contoh: 2500000 -> "Rp 2.500.000"
String formatRupiah(int? angka) {
  final s = (angka ?? 0).toString();
  final buf = StringBuffer();
  for (int i = 0; i < s.length; i++) {
    final sisa = s.length - i;
    buf.write(s[i]);
    if (sisa > 1 && sisa % 3 == 1) buf.write('.');
  }
  return 'Rp $buf';
}