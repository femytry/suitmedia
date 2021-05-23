class Utils{
  static bool isPalindrome(String text){
    var temp = text.toLowerCase().replaceAll(RegExp(r'[\W_]'), '');
    return temp == temp.split('').reversed.join('');
  }

  static bool isPrimeNumber(int number){
    if (number <= 1) {
      return false;
    } else if (number <= 3) {
      return true;
    }

    for(var i = 2; i*i <= number; i++){
      if (number % i == 0)
        return false;
    }

    return true;
  }
}