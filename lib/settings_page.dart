import 'package:mapy/localeString.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: LocalString(),
      locale: Get.locale == null ? LocalString.varsayilan : Get.locale,
      fallbackLocale: Locale('tr', 'TR'),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Map<String, dynamic>> locale = [
    {'isim': 'Türkçe', 'locale': Locale('tr', 'TR')},
    {'isim': 'English', 'locale': Locale('en', 'US')}
  ];

  updatelanguage(Locale locale) {
    Get.back();
    Get.updateLocale(locale);
  }

  builddialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("dil sec".tr),
            content: Container(
              width: double.maxFinite,
              child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                          onTap: () {
                            Get.updateLocale(locale[index]['locale']);
                            Get.back();
                          },
                          child: Text(locale[index]['isim'])),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider(
                      color: Colors.blue,
                    );
                  },
                  itemCount: locale.length),
            ),
          );
        });
  }

  bool _switch = false;
  bool _switch2 = true;

  ThemeData _dark = ThemeData(brightness: Brightness.dark);
  ThemeData _light = ThemeData(brightness: Brightness.light);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: _switch ? _dark : _light,
        home: Scaffold(
          appBar: AppBar(
            title: Text("ayarlar".tr, style: TextStyle(fontSize: 22)),
            leading: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
          ),
          body: Container(
            padding: const EdgeInsets.all(10),
            child: ListView(
              children: [
                SizedBox(height: 40),
                Row(
                  children: [
                    Icon(
                      Icons.person,
                      color: Colors.blue,
                    ),
                    SizedBox(width: 10),
                    Text(
                      "hesap".tr,
                      style:
                      TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Divider(
                  height: 20,
                  thickness: 1,
                ),
                SizedBox(height: 10),
                ElevatedButton(
                    onPressed: () {
                      builddialog(context);
                    },
                    child: Text("dil".tr)),

                /*buildAccountOption(context, "Şifreyi değiştir"),
                buildAccountOption(context, "Dil seçenekleri"),
                buildAccountOption(context, "Gizlilik ve Güvenlik"),*/
                SizedBox(height: 40),
                Row(
                  children: [
                    Icon(
                      Icons.volume_up_outlined,
                      color: Colors.blue,
                    ),
                    SizedBox(width: 10),
                    Text("bildirimler".tr,
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold))
                  ],
                ),
                Divider(height: 20, thickness: 1),
                SizedBox(height: 10),
                buildNoficationOption("koyu tema".tr, _switch, (_newvalue) {
                  setState(() {
                    _switch = _newvalue;
                  });
                }),
                buildNoficationOption("hesap aktifliği".tr, _switch2,
                        (_newvalue2) {
                      setState(() {
                        _switch2 = _newvalue2;
                      });
                    }),
                SizedBox(height: 20),
                Center(
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        backgroundColor: Colors.red),
                    onPressed: () {},
                    child: Text("çıkış yap".tr,
                        style: TextStyle(
                            fontSize: 16,
                            letterSpacing: 2.2,
                            color: Colors.black)),
                  ),
                )
              ],
            ),
          ),
        ));
  }

  Padding buildNoficationOption(
      String title, bool value, Function onChangeMethod) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.grey[600]),
          ),
          Transform.scale(
            scale: 0.7,
            child: CupertinoSwitch(
              activeColor: Colors.blue,
              trackColor: Colors.grey,
              value: value,
              onChanged: (bool newValue) {
                onChangeMethod(newValue);
              },
            ),
          )
        ],
      ),
    );
  }

/*GestureDetector buildAccountOption(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext content) {
              return AlertDialog(
                title: Text(title),
                content: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [Text("seçenek1"), Text("seçenek2")],

                ),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("Kapat"))


                ],
              );
            });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[600])),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
            )
          ],
        ),
      ),
    );
  }*/
}
