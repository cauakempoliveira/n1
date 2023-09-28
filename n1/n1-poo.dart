
class NumeroPorExtenso {
  static const List<String> unidades = ['', 'um', 'dois', 'três', 'quatro', 'cinco', 'seis', 'sete', 'oito', 'nove'];
  static const List<String> dezenas = ['', '', 'vinte', 'trinta', 'quarenta', 'cinquenta', 'sessenta', 'setenta', 'oitenta', 'noventa'];
  static const List<String> dezenasEspeciais = ['dez', 'onze', 'doze', 'treze', 'quatorze', 'quinze', 'dezesseis', 'dezessete', 'dezoito', 'dezenove'];
  static const List<String> centenas = ['', 'cento', 'duzentos', 'trezentos', 'quatrocentos', 'quinhentos', 'seiscentos', 'setecentos', 'oitocentos', 'novecentos'];

  static String numeroPorExtenso(int numero) {

    //Condição específica pra caso o valor seja 0
    if (numero == 0) {
      return 'zero';
    }

    else if (numero < 10) {
      return unidades[numero];
    }
    else if (numero < 20) {
      return dezenasEspeciais[numero - 10];
    }
    else if (numero < 100) {
      int unidade = numero % 10;
      int dezena = (numero ~/ 10);
      return '${dezenas[dezena]}${unidade != 0 ? ' e ${unidades[unidade]}' : ''}';
    }

    //Condição específica pra caso o valor seja 100
    else if (numero == 100) {
      return 'cem';
    }
    
    //Condição específica pra caso o valor seja 1000
    else if(numero==1000) {
      return 'mil';
    }
     else if (numero < 1000) {
      int centena = numero ~/ 100;
      int resto = numero % 100;
      return '${centenas[centena]}${resto != 0 ? ' e ${numeroPorExtenso(resto)}' : ''}';
    }
    else if(numero < 2000) {
      int resto = numero % 1000;
      return 'mil${resto != 0 ? ' e ${numeroPorExtenso(resto)}' : ''}';
    }
     else if (numero < 100000) {
      int milhar = numero ~/ 1000;
      int resto = numero % 1000;
      return '${numeroPorExtenso(milhar)} mil${resto != 0 ? ' e ${numeroPorExtenso(resto)}' : ''}';
    } 
    
    else {
      return 'Número inválido. Número fora do intervalo';
    }

  }
}


void main() {
  int numero = 25; // Digite um valor aqui
  String extenso = NumeroPorExtenso.numeroPorExtenso(numero);
  print('O número $numero por extenso é: $extenso');
}