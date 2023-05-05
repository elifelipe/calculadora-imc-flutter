import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:calculadora_imc/main.dart';

void main() {
  group('Double', () {
    test('parse valid input', () {
      expect(double.parse('3.14'), equals(3.14));
      expect(double.parse('-3.14'), equals(-3.14));
      expect(double.parse('0.0'), equals(0.0));
      expect(double.parse('1e5'), equals(100000.0));
      expect(double.parse('1E-5'), equals(0.00001));
    });

    test('double.parse throws FormatException when given invalid input', () {
      expect(() => double.parse('invalid'), throwsA(isA<FormatException>()));
      expect(() => double.parse('1.2.3'), throwsA(isA<FormatException>()));
      expect(() => double.parse('1e'), throwsA(isA<FormatException>()));
      expect(() => double.parse('1e+'), throwsA(isA<FormatException>()));
      expect(() => double.parse('1e-'), throwsA(isA<FormatException>()));
    });

    test('tryParse valid input', () {
      expect(double.tryParse('3.14'), equals(3.14));
      expect(double.tryParse('-3.14'), equals(-3.14));
      expect(double.tryParse('0.0'), equals(0.0));
      expect(double.tryParse('1e5'), equals(100000.0));
      expect(double.tryParse('1E-5'), equals(0.00001));
    });
  });
}
