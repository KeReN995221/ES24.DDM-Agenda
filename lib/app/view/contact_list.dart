import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_flutter/app/database/script.dart';
import 'package:projeto_flutter/app/my_app.dart';
import 'package:sqflite/sqflite.dart';

class ContactList extends StatelessWidget {
  final lista = {
    {'nome':'Telma', 'telefone':'(44)9 995221354', 'url_avatar': 'https://www.google.com/imgres?imgurl=https%3A%2F%2Fst5.depositphotos.com%2F51587144%2F62564%2Fv%2F1600%2Fdepositphotos_625641412-stock-illustration-profile-image-female-avatar-social.jpg&tbnid=2qrX905LpKzmuM&vet=10CBQQxiAoB2oXChMI0KKdnIH4hgMVAAAAAB0AAAAAEBI..i&imgrefurl=https%3A%2F%2Fdepositphotos.com%2Fpt%2Fvector%2Fprofile-image-female-avatar-social-networks-half-circle-fashion-beauty-625641412.html&docid=Xu7HaC_BRLfz8M&w=1600&h=1700&itg=1&q=avatar%20para&ved=0CBQQxiAoB2oXChMI0KKdnIH4hgMVAAAAAB0AAAAAEBI'},
    {'nome':'Keren', 'telefone':'(44)9 995221354', 'url_avatar': 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fdepositphotos.com%2Fbr%2Fvector%2Fprofile-image-female-avatar-social-networks-half-circle-fashion-beauty-625756526.html&psig=AOvVaw1gQCxwhwUihomWVyoiRvol&ust=1719448016424000&source=images&cd=vfe&opi=89978449&ved=0CBEQjRxqFwoTCNCinZyB-IYDFQAAAAAdAAAAABAU'},
    {'nome':'Wesley', 'telefone':'(44)9 995221354', 'url_avatar': 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.freepik.es%2Fvector-premium%2Fperfil-avatar-hombre-icono-redondo_2651713.htm&psig=AOvVaw1gQCxwhwUihomWVyoiRvol&ust=1719448016424000&source=images&cd=vfe&opi=89978449&ved=0CBEQjRxqFwoTCNCinZyB-IYDFQAAAAAdAAAAABA7'},

  };

  Future<List<Map<String,dynamic>>> _buscar() async{
    String path= join(await getDatabasesPath(), 'bd');
    Database db = await openDatabase(
      path,
      version: 1,
      onCreate: (db, v){
        db.execute(createTable);
        db.execute(insert);
        db.execute(insert1);
        db.execute(insert2);
      }
    );

    return db.query('contact');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _buscar(),
      builder: (context, futuro){
        if(futuro.hasData){
          var lista = futuro.data;
          return  Scaffold(
                  appBar: AppBar(
                    title: Text('Lista de Contatos'),
                    actions: [
                      IconButton(onPressed: (){
                        Navigator.of(context).pushNamed(MyApp.CNTOACT_FORM);
                      }, icon: Icon(Icons.add))
                    ],
                  ),
                  body:ListView.builder(
                    itemCount: lista.length,
                    itemBuilder:(context, j){
                      var contato=lista[j];
                      var avatar = CircleAvatar(backgroundImage: NetworkImage(contato['avatar']),);
                      return ListTile(
                      leading: avatar,
                      title: Text(contato['nome']),
                      subtitle: Text(contato['telefone']),
                      trailing: Container(
                        width:100,
                        child: Row(children: [
                          IconButton(onPressed: null, icon: Icon(Icons.edit)),
                          IconButton(onPressed: null, icon: Icon(Icons.delete)),

                        ],)
                        ,),

                      );
                    },
                  ),
              );
        }else{
          return Scaffold();
        }
      }
      );
    /*return  Scaffold(
        appBar: AppBar(
          title: Text('Lista de Contatos'),
          actions: [
            IconButton(onPressed: (){
              Navigator.of(context).pushNamed(MyApp.CNTOACT_FORM);
            }, icon: Icon(Icons.add))
          ],
        ),
        body:ListView.builder(
          itemCount: lista.length,
          itemBuilder:(context, j){
            var contato=lista[j];
            var avatar = CircleAvatar(backgroundImage: NetworkImage(contato['avatar']),);
            return ListTile(
             leading: avatar,
             title: Text(contato['nome']),
             subtitle: Text(contato['telefone']),
             trailing: Container(
              width:100,
              child: Row(children: [
                IconButton(onPressed: null, icon: Icon(Icons.edit)),
                IconButton(onPressed: null, icon: Icon(Icons.delete)),

              ],)
              ,),

            );
          },
        ),
    );*/
  }
}