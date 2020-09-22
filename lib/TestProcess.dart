import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';
import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:Diabetic_Retinopathy_Scanner/TakePictureScreen.dart';

class TestProcess extends StatefulWidget {
  TestProcess({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _TestProcessState createState() => _TestProcessState();
}

class _TestProcessState extends State<TestProcess> {
  int selectedPos = 0;
  double bottomNavBarHeight = 60;
  List _outputs;
  File _image;
  bool _loading = false;
  int _color = 0xffc248bd; //default pink

  @override
  void initState() {
    super.initState();
    _loading = true;
    _navigationController = new CircularBottomNavigationController(selectedPos);

    loadModel().then((value) {
      setState(() {
        _loading = false;
      });
    });
  }

  List<TabItem> tabItems = List.of([
    new TabItem(Icons.home, "Home", Color(0xff00a5bd)),
    new TabItem(Icons.camera, "Scan Eye", Colors.green),
    new TabItem(Icons.photo_library, "Select Photo", Color(0xffff9000)),
    new TabItem(Icons.info, "About", Colors.black),
  ]);

  CircularBottomNavigationController _navigationController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Padding(
            child: bodyContainer(),
            padding: EdgeInsets.only(bottom: bottomNavBarHeight),
          ),
          Align(alignment: Alignment.bottomCenter, child: bottomNav())
        ],
      ),
    );
  }

  bodyContainer() {
    switch (selectedPos) {
      case 0:
        return homePage();
        break;
      case 1:
        return scanEye();
        break;
      case 2:
        return openGallery();
        break;
      case 3:
        return contactPage();
        break;
    }
  }

  Widget scanEye() {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,

        /*
        iconTheme: IconThemeData(color: Color(0xffff9000)),
        leading: IconButton(
          icon: Icon(Icons.chevron_left),
          onPressed: () => Navigator.of(context).pop(),
        ),
        */
        title: const Text(
          'Take a Photo',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w900,
            color: Colors.green,
          ),
        ),
      ),
      body: _loading
          ? Container(
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            )
          : Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _image == null
                      ? Container()
                      : Image.file(_image,
                          color: Colors.grey,
                          colorBlendMode: BlendMode.saturation),
                  SizedBox(
                    height: 20,
                  ),
                  _outputs != null
                      ? Text(
                          "Result: " + "${_outputs[0]["label"]}",
                          style: TextStyle(
                            color: Color(_color),
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            // background: Paint()..color = Colors.transparent,
                          ),
                        )
                      : Container()
                ],
              ),
              decoration: BoxDecoration(
                image: new DecorationImage(
                    image: new AssetImage("assets/images/back1.jpg"),
                    fit: BoxFit.cover),
              ),
            ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => CameraExampleHome()));
          },
          icon: Icon(Icons.camera_alt),
          label: Text("Scan"),
          foregroundColor: Colors.white,
          backgroundColor: Colors.green),
    );
  }

  Widget openGallery() {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,

        /*
        iconTheme: IconThemeData(color: Color(0xffff9000)),
        leading: IconButton(
          icon: Icon(Icons.chevron_left),
          onPressed: () => Navigator.of(context).pop(),
        ),
        */
        title: const Text(
          'Scan Photo from Gallery',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w900,
            color: Color(0xffff9000),
          ),
        ),
      ),
      body: _loading
          ? Container(
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            )
          : Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _image == null
                      ? Container()
                      : Image.file(_image,
                          color: Colors.grey,
                          colorBlendMode: BlendMode.saturation),
                  SizedBox(
                    height: 20,
                  ),
                  _outputs != null
                      ? Text(
                          "Result: " + "${_outputs[0]["label"]}",
                          style: TextStyle(
                            color: Color(_color),
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            // background: Paint()..color = Colors.transparent,
                          ),
                        )
                      : Container()
                ],
              ),
              decoration: BoxDecoration(
                // color: Colors.red[200],
                image: new DecorationImage(
                    image: new AssetImage("assets/images/back1.jpg"),
                    fit: BoxFit.cover),
              ),
            ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: pickImage,
        icon: Icon(Icons.remove_red_eye),
        label: Text("Start"),
        foregroundColor: Colors.white,
        backgroundColor: Color(0xffff9000),
      ),
    );
  }

  Widget homePage() {
    return Scaffold(
        body: Container(
      child: Container(
          child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 0, 24, 5),
              ),
              Padding(
                child: new Container(
                  child: new Card(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: new Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            new ListTile(
                              leading: new Icon(Icons.phone_iphone,
                                  color: Color(0xff00a5bd), size: 30),
                              title: new Text(
                                'Summary',
                                style: new TextStyle(
                                    fontFamily: "SF UI Display",
                                    fontSize: 18,
                                    color: Color(0xff00a5bd),
                                    fontWeight: FontWeight.w700),
                              ),
                              subtitle: Text(
                                '\nThe scope of this study is to detect the stage of DR in patients easily and early as possible with a mobile phone camera and a convolutional neural network that is trained with different images of DR using deep learning and image processing.',
                                style: TextStyle(
                                    fontFamily: "SF UI Display",
                                    fontSize: 14,
                                    color: Colors.grey[700],
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ]),
                    ),
                  ),
                  padding: const EdgeInsets.all(0.0),
                  alignment: Alignment.center,
                ),
                padding: const EdgeInsets.fromLTRB(24, 0, 24, 5),
              ),
              Padding(
                child: new Container(
                  child: new Card(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: new Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            new ListTile(
                              leading: new Icon(Icons.remove_red_eye,
                                  color: Color(0xff00a5bd), size: 30),
                              title: new Text(
                                'What is DR?',
                                style: new TextStyle(
                                    fontFamily: "SF UI Display",
                                    fontSize: 16,
                                    color: Color(0xff00a5bd),
                                    fontWeight: FontWeight.w700),
                              ),
                              subtitle: Text(
                                '\nIt has been proven by specialists that with the progression of diabetes, it causes various complications in the human body. The most prominent of these complications happens in the eyes. Because of diabetes, veins in retina become damaged and starts to leak or swollen. This results in blurry vision or even blindness.',
                                style: TextStyle(
                                    fontFamily: "SF UI Display",
                                    fontSize: 14,
                                    color: Colors.grey[700],
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ]),
                    ),
                  ),
                  padding: const EdgeInsets.all(0.0),
                  alignment: Alignment.center,
                ),
                padding: const EdgeInsets.fromLTRB(24, 0, 24, 5),
              ),
            ],
          ),
        ),
      )),
      decoration: BoxDecoration(
        image: new DecorationImage(
            image: new AssetImage("assets/images/back1.jpg"),
            fit: BoxFit.cover),
      ),
    ));
  }

  Widget contactPage() {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'About Us',
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.w900),
          ),
          centerTitle: true,
          backgroundColor: Color(0xffffffff),
          elevation: 0,
        ),
        body: Container(
          child: Container(
              child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 0, 24, 5),
                  ),
                  Padding(
                    child: new Container(
                      child: new Card(
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: new Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                new ListTile(
                                  leading: new Icon(Icons.info,
                                      color: Colors.black, size: 30),
                                  title: new Text(
                                    'Information',
                                    style: new TextStyle(
                                        fontFamily: "SF UI Display",
                                        fontSize: 14,
                                        color: Color(0xFF707070),
                                        fontWeight: FontWeight.w700),
                                  ),
                                  subtitle: Text(
                                      'This application was developed by students from OMU'),
                                ),
                              ]),
                        ),
                      ),
                      padding: const EdgeInsets.all(0.0),
                      alignment: Alignment.center,
                    ),
                    padding: const EdgeInsets.fromLTRB(24, 0, 24, 5),
                  ),
                  Padding(
                    child: new Container(
                      child: new Card(
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: new Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                new ListTile(
                                  leading: new Icon(Icons.person,
                                      color: Colors.black, size: 30),
                                  title: new Text(
                                    'Dr. Sercan DEMIRCI',
                                    style: new TextStyle(
                                        fontFamily: "SF UI Display",
                                        fontSize: 14,
                                        color: Color(0xFF707070),
                                        fontWeight: FontWeight.w700),
                                  ),
                                  subtitle: Text(
                                      'Ondokuz Mayis University\nsercan.demirci@omu.edu.tr'),
                                ),
                              ]),
                        ),
                      ),
                      padding: const EdgeInsets.all(0.0),
                      alignment: Alignment.center,
                    ),
                    padding: const EdgeInsets.fromLTRB(24, 0, 24, 5),
                  ),
                  Padding(
                    child: new Container(
                      child: new Card(
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: new Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                new ListTile(
                                  leading: new Icon(Icons.person,
                                      color: Colors.black, size: 30),
                                  title: new Text(
                                    'Ceyhun TUZUN',
                                    style: new TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xFF707070),
                                    ),
                                  ),
                                  subtitle: Text(
                                      'Ondokuz Mayis University\nceyhun.tuzun@bil.omu.edu.tr'),
                                ),
                              ]),
                        ),
                      ),
                      padding: const EdgeInsets.all(0.0),
                      alignment: Alignment.center,
                    ),
                    padding: const EdgeInsets.fromLTRB(24, 0, 24, 5),
                  ),
                  Padding(
                    child: new Container(
                      child: new Card(
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: new Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                new ListTile(
                                  leading: new Icon(Icons.person,
                                      color: Colors.black, size: 30),
                                  title: new Text(
                                    'Irem Turku CINAR',
                                    style: new TextStyle(
                                      fontFamily: "SF UI Display",
                                      fontSize: 14,
                                      color: Color(0xFF707070),
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  subtitle: Text(
                                      'Ondokuz Mayis University\nturku.cinar@bil.omu.edu.tr'),
                                ),
                              ]),
                        ),
                      ),
                      padding: const EdgeInsets.all(0.0),
                      alignment: Alignment.center,
                    ),
                    padding: const EdgeInsets.fromLTRB(24, 0, 24, 5),
                  ),
                  Padding(
                    child: new Container(
                      child: new Card(
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: new Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                new ListTile(
                                  leading: new Icon(Icons.person,
                                      color: Colors.black, size: 30),
                                  title: new Text(
                                    'Ali Murat CEVIK',
                                    style: new TextStyle(
                                      fontFamily: "SF UI Display",
                                      fontSize: 14,
                                      color: Color(0xFF707070),
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  subtitle: Text(
                                      'Ondokuz Mayis University\nmurat.cevik@bil.omu.edu.tr'),
                                ),
                              ]),
                        ),
                      ),
                      padding: const EdgeInsets.all(0.0),
                      alignment: Alignment.center,
                    ),
                    padding: const EdgeInsets.fromLTRB(24, 0, 24, 5),
                  ),
                ],
              ),
            ),
          )),
          decoration: BoxDecoration(color: Colors.grey[200]
              /* image: new DecorationImage(
                image: new AssetImage("assets/back1.jpg"), fit: BoxFit.cover),*/
              ),
        ));
  }

  Widget bottomNav() {
    return CircularBottomNavigation(
      tabItems,
      controller: _navigationController,
      barHeight: bottomNavBarHeight,
      barBackgroundColor: Colors.white,
      animationDuration: Duration(milliseconds: 300),
      selectedCallback: (int selectedPos) {
        setState(() {
          this.selectedPos = selectedPos;
          print(_navigationController.value);
        });
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _navigationController.dispose();
  }

  pickImage() async {
    var image =
        await ImagePicker.pickImage(source: ImageSource.gallery) as File;
    if (image == null) return null;
    setState(() {
      _loading = true;
      _image = image as File;
    });

    classifyImage(_image);
  }

  classifyImage(File image) async {
    var output = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 2,
      threshold: 0.1,
      imageMean: 125.5,
      imageStd: 125.5,
    );

    setState(() {
      _loading = false;
      _outputs = output;
      if (_outputs[0]["index"] == 0) {
        _color = 0xff006400; //green
      } else if (_outputs[0]["index"] == 1) {
        _color = 0xffff0000; //red
      } else {
        print("Error!");
      }
    });
  }

  loadModel() async {
    await Tflite.loadModel(
      model: "assets/tflite/model_unquant.tflite",
      labels: "assets/tflite/labels.txt",
    );
  }
}
