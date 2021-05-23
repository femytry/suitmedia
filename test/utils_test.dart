import 'package:test/test.dart';
import 'package:suitmedia/app/utils/utils.dart';

void main(){
  test('Check is number prime', (){
    expect(Utils.isPrimeNumber(17), true);
  });
  test('Check is phrase palindrome', (){
    expect(Utils.isPalindrome('Kasur rusak'), true);
  });
}