import 'package:sil1/shared_provider.dart';
import 'package:flutter/material.dart';
import 'package:sil1/constant.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SharedProvider>(
          create: (context) => SharedProvider(),
        )
      ],
      child: const MaterialApp(
        title: 'Flutter Hello World',
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _textEditingController = TextEditingController();
  SharedPreferences? sharedPreferencs;
//  List<String> saveList = [];
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    sharedPreferencs = await SharedPreferences.getInstance();
    var data = Provider.of<SharedProvider>(context, listen: false);
    listem = await data.getData();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<SharedProvider>(context);
    return Scaffold(
      appBar: AppBar(
          // The title text which will be shown on the action bar
          title: const Text('Demo')),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: listem.length,
                itemBuilder: (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ListTile(
                      title: Text(listem[index]),
                    ),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _textEditingController,
              obscureText: false,
              decoration: const InputDecoration(
                filled: true,
                labelText: 'Kayıt Ekle',
                labelStyle: TextStyle(color: Colors.red),
                border: InputBorder.none,
                fillColor: Colors.white,
                focusColor: Colors.grey,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 40,
              width: 250,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (_textEditingController.text.isNotEmpty) {
                      data.setData(_textEditingController.text);
                    }
                  });

                  print(data.getData());
                },
                child: const Text('Ekle'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
