import 'package:flutter/material.dart';

import 'chalanmodel.dart';
class ChalanView extends StatefulWidget {
  const ChalanView({super.key});

  @override
  State<ChalanView> createState() => _ChalanViewState();
}

class _ChalanViewState extends State<ChalanView> {
  List<ChalanModel>  list=[
    ChalanModel(name: 'Helmet', fine: 400),
    ChalanModel(name: 'Speed', fine: 600),
    ChalanModel(name: 'Number Plate', fine: 800),
    ChalanModel(name: 'Signal', fine: 400),
  ];
  int novoilation=0,totalfine=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chalan'),
      ),
      body: Padding(padding: EdgeInsets.all(10),
      child:Column(
        children: [
          Container(
            height: 250,
            child:ListView.builder(
                itemCount: list.length,
                itemBuilder: (ctx,index){
              return Row(
                children: [
                  Checkbox(value: list[index].checked, onChanged: (bool ?value)
            {
              list[index].checked=value!;
              setState(() {

              });
            }
            ),
                  Text('${list[index].name} RS:'),
                  Text('${list[index].fine}')
                ],
              );
            }),
          ),
          ElevatedButton(onPressed: (){
            var checkedlist=list.where((element)=> element.checked);
        novoilation=checkedlist.length;
         totalfine=checkedlist.map((item)=>item.fine).toList().reduce((a,b)=>a+b);
         setState(() {

         });
          }, child: Text('Calculate')),
          Text('Total Voilation:${novoilation}'),
          Text('Total Fine:${totalfine}'),

        ],
      ),
      ),
    );
  }
}
