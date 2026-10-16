// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:tugas_pertemuan4/main.dart';

void main() {
  testWidgets('menu navigates between biodata, grades, and profile', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Biodata Mahasiswa'), findsOneWidget);
    expect(find.text('Biodata Pribadi'), findsOneWidget);

    await tester.tap(find.text('Nilai'));
    await tester.pumpAndSettle();
    expect(find.text('Input Nilai'), findsOneWidget);

    await tester.tap(find.text('Profil'));
    await tester.pumpAndSettle();
    expect(find.text('Profil Pengguna'), findsOneWidget);
    expect(find.text('mahasiswa@example.com'), findsOneWidget);
  });

  testWidgets('grade form validates and adds a record to the ListView', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());
    await tester.tap(find.text('Nilai'));
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key('grade-submit')));
    await tester.pumpAndSettle();
    expect(find.text('Nama wajib diisi'), findsOneWidget);

    await tester.ensureVisible(find.byKey(const Key('grade-name')));
    await tester.enterText(find.byKey(const Key('grade-name')), 'Ayu Putri');
    await tester.ensureVisible(find.byKey(const Key('grade-id')));
    await tester.enterText(find.byKey(const Key('grade-id')), '24001');
    await tester.ensureVisible(find.byKey(const Key('grade-course')));
    await tester.enterText(
      find.byKey(const Key('grade-course')),
      'Pemrograman Mobile',
    );
    await tester.ensureVisible(find.byKey(const Key('grade-score')));
    await tester.enterText(find.byKey(const Key('grade-score')), '88');
    tester.testTextInput.hide();
    await tester.pumpAndSettle();
    await tester.ensureVisible(find.byKey(const Key('grade-submit')));
    await tester.tap(find.byKey(const Key('grade-submit')));
    await tester.pumpAndSettle();

    expect(find.text('Pemrograman Mobile'), findsOneWidget);
    expect(find.text('Ayu Putri · 24001'), findsOneWidget);
    expect(find.text('88.0'), findsOneWidget);
    expect(find.text('Huruf A'), findsOneWidget);
  });
}
