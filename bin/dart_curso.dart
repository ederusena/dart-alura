void main() {
  String nome = "Laranja";
  double peso = 100.2;
  String cor = "Verde e Amarela";
  String sabor = "Doce e cítrica";
  int diasDesdeColheita = 40;
  bool? isMadura;

  if (diasDesdeColheita >= 30) {
    isMadura = true;
  } else {
    isMadura = false;
  }

  Legumes mandioca = Legumes(true, "Mandioca", 10, "Marrom");
  Fruta laranja = Fruta(
      "Laranja", 100.2, "Verddde e Amarela", "Doce e cítrica", 40,
      isMadura: isMadura);

  Nozes macadamia =
      Nozes(10, "Macadamia", 10, "Marrom", "Doce", 40, isMadura: isMadura);
  Citricas limao =
      Citricas(10, "Limão", 10, "Verde", "Azedo", 40, isMadura: isMadura);

  laranja.fazerSuco();
  laranja.separarIngredientes();
  laranja.fazerMassa();
  laranja.assarBolo();

  macadamia.separarIngredientes();
  macadamia.fazerMassa();
  macadamia.assarBolo();
}

bool? funcEstaMadura(int dias) {
  if (dias >= 30) {
    return true;
  } else {
    return false;
  }
}

mostrarMadura(String nome, int dias, {required String cor}) {
  if (dias >= 30) {
    print("A $nome está madura.");
  } else {
    print("A $nome não está madura.");
  }

  print("A $nome é $cor.");
}

int funcQuantosDiasMadura(int dias) {
  int diasParaMadura = 30;
  int quantosDiasFaltam = diasParaMadura - dias;
  return quantosDiasFaltam;
}

class Alimentos {
  String nome;
  double peso;
  String cor;
  Alimentos(this.nome, this.peso, this.cor);

  void printAlimento() {
    print('O alimento é $nome, pesa $peso e é da cor $cor');
  }
}

class Fruta extends Alimentos implements Bolo {
  String sabor;
  int diasDesdeColheita;
  bool? isMadura;

  Fruta(
      String nome, double peso, String cor, this.sabor, this.diasDesdeColheita,
      {this.isMadura})
      : super(nome, peso, cor);

  void estaMadura(int diasParaMadura) {
    isMadura = diasDesdeColheita >= diasParaMadura;
    print('A sua $nome foi colhida a $diasDesdeColheita dias e precisa de'
        ' $diasParaMadura dias para poder comer!'
        'Ela está Madura? $isMadura');
  }

  void fazerSuco() {
    print('O suco de $nome é muito bom!');
  }

  @override
  void separarIngredientes() {
    // TODO: implement separarIngredientes
    print('Separando ingredientes - $nome');
  }

  @override
  void fazerMassa() {
    // TODO: implement fazerMassa
    print('Misturar ingredientes - $nome');
  }

  @override
  void assarBolo() {
    // TODO: implement assarBolo
    print('Colocar no forno - $nome');
  }
}

class Legumes extends Alimentos implements Bolo {
  bool isPrecisaCozinhar;
  Legumes(this.isPrecisaCozinhar, String nome, double peso, String cor)
      : super(nome, peso, cor);

  void cozinhar() {
    if (isPrecisaCozinhar) {
      print('O $nome precisa ser cozinhado!');
    } else {
      print('O $nome não precisa ser cozinhado!');
    }
  }

  @override
  void separarIngredientes() {
    // TODO: implement separarIngredientes
  }

  @override
  void fazerMassa() {
    // TODO: implement fazerMassa
  }

  @override
  void assarBolo() {
    // TODO: implement assarBolo
  }
}

class Citricas extends Fruta {
  double nivelAzedo;

  Citricas(this.nivelAzedo, String nome, double peso, String cor, String sabor,
      int diasDesdeColheita,
      {bool? isMadura})
      : super(nome, peso, cor, sabor, diasDesdeColheita, isMadura: isMadura);

  void existeRefri(bool existe) {
    if (existe) {
      print('Existe refrigerante de $nome');
    } else {
      print('Não existe refrigerante de $nome');
    }
  }

  @override
  void fazerMassa() {
    print('Tirar a casca - $nome');
    super.fazerMassa();
  }
}

class Nozes extends Fruta {
  double porcentagemGordura;

  Nozes(this.porcentagemGordura, String nome, double peso, String cor,
      String sabor, int diasDesdeColheita,
      {bool? isMadura})
      : super(nome, peso, cor, sabor, diasDesdeColheita, isMadura: isMadura);

  @override
  void fazerMassa() {
    print('Tirar a casca - $nome');
    super.fazerMassa();
  }
}

abstract class Bolo {
  void separarIngredientes();
  void fazerMassa();
  void assarBolo();
}
