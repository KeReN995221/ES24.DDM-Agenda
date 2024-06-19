import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page 2'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final foto = const CircleAvatar(
    backgroundImage: NetworkImage("https://lh3.googleusercontent.com/a/ACg8ocJezeS8yznuiOX-SxM4NXlSzefDAupjSM93o6S2S6wSuhiqOhiqXQ=s360-c-no"),
    radius: 150,
  );
  final name = const Text(
    'Keren Apuque Cardoso de Morais',
    style: TextStyle(fontSize: 30 ),
    textAlign: TextAlign.center,
  );
  final buttonTelefone = IconButton(
    color: const Color.fromARGB(255, 163, 137, 209),
    icon: const Icon(Icons.phone),
    onPressed: (){

    },
  );

  final buttonEmail = IconButton(
    color: const Color.fromARGB(255, 163, 137, 209),
    icon: const Icon(Icons.email),
    onPressed: (){
      
    },
  );

  final buttonSms = IconButton(
    color: const Color.fromARGB(255, 163, 137, 209),
    icon: const Icon(Icons.sms),
    onPressed: (){
      
    },
  );


  Widget build(BuildContext contexto){
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          foto,
          name,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buttonTelefone, buttonEmail, buttonEmail
            ],
            
          ),
        ],
      )

    );
  }
  
}
