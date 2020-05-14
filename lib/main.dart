import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/widgets.dart';
import 'package:easy_localization/easy_localization.dart';

//import 'app_localization.dart';

void main() {
  runApp(EasyLocalization(
      child: MyApp(),
      supportedLocales: [Locale('en', 'US'), Locale('ar', 'DZ')],
      path: 'assets',
      // fallbackLocale: Locale('en', 'US'),
      useOnlyLangCode: true,
      assetLoader: RootBundleAssetLoader()
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    log(EasyLocalization.of(context).locale.toString(), name: this.toString());
    log(Intl.defaultLocale.toString(), name: this.toString());

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Localization',
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        EasyLocalization.of(context).delegate,
      ],
      supportedLocales: EasyLocalization.of(context).supportedLocales,
      locale: EasyLocalization.of(context).locale,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool darkMode = false;

  @override
  Widget build(BuildContext context) {
    Locale locale;

    return Scaffold(
      backgroundColor: darkMode ? Color(0xff303030) : Color(0xffeeeeee),

      appBar: AppBar(
        title: Text("title",
                style: TextStyle(
                    color: darkMode ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold))
            .tr(context: context),
        centerTitle: true,
        backgroundColor: darkMode ? Color(0xff303030) : Color(0xffeeeeee),
        elevation: 0,
        leading: Icon(
          Icons.arrow_back_ios,
          color: darkMode ? Colors.white : Colors.black,
        ),
        actions: <Widget>[
          GestureDetector(
            child: Image.asset(
              'assets/images/moon.png',
              height: 30,
              width: 30,
              color: darkMode ? Colors.white : Colors.black,
            ),
            onTap: () {
              setState(() {
                if (darkMode) {
                  darkMode = false;
                } else {
                  darkMode = true;
                }
//                darkMode = !darkMode;
              });
            },
          ),
          SizedBox(
            width: 8,
          )
        ],
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: buildSettingName(context),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.3,
                  decoration: BoxDecoration(
                      color: darkMode ? Color(0xff424242) : Colors.white,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: darkMode ? Color(0xff2b2b2b) : Colors.grey,
                          offset: Offset(4.0, 4.0),
                          blurRadius: 4,
                        ),
                      ]),
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        title: Text(
                          "cardPassword",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: darkMode ? Colors.white : Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ).tr(context: context),
                        onTap: () {},
                        leading: Icon(
                          Icons.lock,
                          color: Color(0xff9c27b3),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: darkMode ? Colors.white : Colors.black,
                        ),
                      ),
                      Divider(
                        color: Colors.grey,
                        thickness: 1,
                        endIndent: 15,
                        indent: 15,
                      ),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Icon(
                                  Icons.translate,
                                  color: Color(0xff9c27b3),
                                ),
                                Text(
                                  "cardLang",textAlign: TextAlign.center,
                                  style: TextStyle(

                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: darkMode
                                          ? Colors.white
                                          : Colors.black),
                                ).tr(context: context),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: darkMode ? Colors.white : Colors.black,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        color: Colors.grey,
                        thickness: 1,
                        endIndent: 15,
                        indent: 15,
                      ),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Icon(
                                  Icons.location_on,
                                  color: Color(0xff9c27b3),
                                ),
                                Text(
                                  "cardLoc",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: darkMode
                                          ? Colors.white
                                          : Colors.black),
                                ).tr(context: context),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: darkMode ? Colors.white : Colors.black,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment:
                      EasyLocalization.of(context).locale.languageCode == "en"
                          ? Alignment.centerLeft
                          : Alignment.centerRight,
                  padding: EdgeInsets.only(top: 30, bottom: 25, left: 30),
                  child: Text(
                    "notificationSetting",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff4052b8)),
                  ).tr(context: context),
                ),
                Container(
                  child: SwitchListTile(
                    onChanged: (v) {},
                    value: true,
                    title: Text(
                      "not1",
                      style: TextStyle(fontSize: 20 ,
                      color: darkMode
                          ? Colors.white
                          : Colors.black),
                    ).tr(context: context),
                    activeTrackColor: Color(0xffc58ace),
                    activeColor: Color(0xff9c27b3),
                    //  selected: switchControl,
                  ),
                ),
                Container(
                  child: SwitchListTile(
                    onChanged: (v) {},
                    value: false,
                    title: Text(
                      "not2",
                      style: TextStyle(fontSize: 20, color:
                      Colors.grey),
                    ).tr(context: context),
                    activeTrackColor: Color(0xffc58ace),
                    activeColor: Color(0xff9c27b3),
                    inactiveThumbColor: Colors.grey[700],
                    //  selected: switchControl,
                  ),
                ),
                Container(
                  child: SwitchListTile(
                    onChanged: (v) {},
                    value: true,
                    title: Text(
                      "not3",
                      style: TextStyle(
                        fontSize: 20,
                        color: darkMode
                            ? Colors.white
                            : Colors.black
                      ),
                    ).tr(context: context),
                    activeTrackColor: Color(0xffc58ace),
                    activeColor: Color(0xff9c27b3),
                    //  selected: switchControl,
                  ),
                ),
                Container(
                  child: SwitchListTile(
                    onChanged: (v) {},
                    value: false,
                    title: Text(
                      "not4",
                      style: TextStyle(fontSize: 20, color: Colors.grey),
                    ).tr(context: context),
                    activeTrackColor: Color(0xffc58ace),
                    activeColor: Color(0xff9c27b3),
                    inactiveThumbColor: Colors.grey[700],

                    //  selected: switchControl,
                  ),
                ),
                SizedBox(
                  height: 60,
                )
              ],
            ),
          ),
          Positioned(
            bottom: -18.0,
            left: -18.0,
            width: 80,
            height: 80,
            child: GestureDetector(
              onTap: () {
                if (EasyLocalization.of(context).locale.languageCode == "en") {
                  locale = Locale("ar", "DZ");
                  log(locale.toString(), name: this.toString());

                  EasyLocalization.of(context).locale = locale;
                } else {
                  locale = Locale("en", "US");

                  log(locale.toString(), name: this.toString());

                  EasyLocalization.of(context).locale = locale;
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.purple,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.power_settings_new,
                  color: Colors.white,
                  size: 35,
                ),
              ),
            ),
          )
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Container buildSettingName(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.1,
      height: 70,
      decoration: BoxDecoration(
          color: Color(0xff9c27b3),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: darkMode ? Color(0xff2b2b2b) : Colors.grey,
              offset: Offset(4.0, 4.0),
              blurRadius: 4,
            ),
          ]),
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: darkMode ? Colors.black : Color(0xff1976d3)),
              width: 50,
              height: 50,
            ),
          ),
          Text(
            'John Doe',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Spacer(),
          Icon(
            Icons.edit,
            color: Colors.white,
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }
}
