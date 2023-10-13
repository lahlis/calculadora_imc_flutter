import 'package:bmicalculator/repository/bmi_repository.dart';
import 'package:flutter/material.dart';

import '../model/bmi_model.dart';

class DataPage extends StatefulWidget {
  const DataPage({super.key});

  @override
  State<DataPage> createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  var nameController = TextEditingController();
  var weightController = TextEditingController();
  var heightController = TextEditingController();

  var bmiRepository = BMIRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 240, 221),
      appBar: AppBar(
        title: const Text(
          "Calculadora IMC",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 179, 96, 224),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: Column(
            children: [
              Column(
                children: [
                  const Text(
                    "Informe os seus dados abaixo:",
                    style: TextStyle(
                        fontFamily: "Fredoka",
                        fontSize: 20,
                        color: Color.fromARGB(255, 85, 39, 110)),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                        label: Text("Nome:"),
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18)),
                  ),
                  TextField(
                    controller: weightController,
                    decoration: const InputDecoration(
                        label: Text("Peso (em kg):"),
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18)),
                  ),
                  TextField(
                    controller: heightController,
                    decoration: const InputDecoration(
                        label: Text("Altura (em m):"),
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18)),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Container(
                    width: double.infinity,
                    child: TextButton(
                      onPressed: () {
                        if (nameController.text.trim() == "") {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("O nome deve ser preenchido")));
                          return;
                        }
                        if (weightController.text.trim() == "") {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("O peso deve ser preenchido")));
                          return;
                        }
                        if (heightController.text.trim() == "") {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("A altura deve ser preenchida")));
                          return;
                        }

                        FocusManager.instance.primaryFocus?.unfocus();

                        setState(() {
                          bmiRepository.add(
                            BMI(
                              nameController.text,
                              double.parse(weightController.text),
                              double.parse(heightController.text),
                            ),
                          );

                          nameController.clear();
                          weightController.clear();
                          heightController.clear();
                        });
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          const Color.fromARGB(255, 179, 96, 224),
                        ),
                      ),
                      child: const Text(
                        " Calcular IMC ",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                  InkWell(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 20,
                      ),
                      width: double.infinity,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.info_outline_rounded,
                            color: Color.fromARGB(255, 238, 113, 138),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Saiba mais sobre o que é IMC",
                            style: TextStyle(
                                color: Color.fromARGB(255, 202, 90, 112)),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (BuildContext bc) {
                            return Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 16),
                              child: const Column(
                                children: [
                                  Text("Índice de Massa Corporal (IMC)",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontFamily: "Fredoka",
                                        decoration: TextDecoration.underline,
                                      )),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "Criado no século 19 pelo matemático Lambert Quételet, o Índice de Massa Corporal, trata-se de uma medida do peso de cada pessoa, sendo uma relação entre a massa da pessoa e a sua altura ao quadrado. A partir desse cálculo é possível avaliar se a pessoa está com um peso ideal ou se está abaixo ou acima do peso. Tanto níveis abaixo, como níveis acima do peso ideal, podem oferecer riscos à saúde do indivíduo. O IMC  é uma medida de referência internacional reconhecida pela OMS (Organização Mundial da Saúde).",
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ],
                              ),
                            );
                          });
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Resultados:",
                style: TextStyle(
                  fontFamily: "Fredoka",
                  fontSize: 20,
                  color: Color.fromARGB(255, 85, 39, 110),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: bmiRepository.count,
                itemBuilder: (context, index) {
                  final BMI element = bmiRepository.getBMIByIndex(index);
                  return ListTile(
                    title: Text("Usuário: ${element.name}",),
                    subtitle: Text("IMC: ${element.bmiTable()}", style: TextStyle(color: Colors.purple),),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
