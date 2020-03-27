import 'package:flutter/material.dart';
import 'package:aadhar_validator/aadhar_validator.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String aadharNumber = '';
  // bool show = false;
  TextEditingController _textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Aadhar Number Validator"),
        centerTitle: true,
        actions: <Widget>[
          ShowInfo()
        ],
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 50,
          ),
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(20),
                color: Colors.white),
            height: 300,
            width: 370,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: 5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height: 72,
                          width: 10,
                        ),
                        Container(
                          height: 72,
                          width: 50,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                      "https://upload.wikimedia.org/wikipedia/commons/thumb/5/55/Emblem_of_India.svg/496px-Emblem_of_India.svg.png"))),
                        ),
                        Container(
                          height: 72,
                          width: 10,
                        ),
                        Container(
                          height: 72,
                          // color: Colors.red,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                height: 24,
                                width: 150,
                                color: Colors.orange,
                              ),
                              Container(
                                height: 22,
                                width: 150,
                                color: Colors.white,
                              ),
                              Container(
                                height: 24,
                                width: 200,
                                color: Colors.green,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 100,
                    left: 20,
                    child: Row(
                      children: <Widget>[
                        Container(
                          // height: 50,
                          width: 300,
                          // color: Colors.red,
                          child: TextField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: 'Enter the 12 digit aadhar number',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            controller: _textController,
                          ),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                      bottom: 20,
                      right: 150,
                      child: FlatButton(
                        child: Text("Check"),
                        onPressed: () {
                          setState(() {
                            aadharNumber = _textController.text;
                          });
                        },
                        color: Colors.amber,
                      )),
                  Positioned(
                      bottom: 20,
                      right: 30,
                      child: FlatButton(
                        child: Text("Reset"),
                        onPressed: () {
                          setState(() {
                            _textController.text = '';
                            aadharNumber = '';
                          });
                        },
                        color: Colors.amber,
                      ))
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          aadharNumber.length < 12
              ? Container()
              : AadharValidator.validateAadhar(aadharNumber: aadharNumber)
                  ? Text(
                      'The Aadhar number is valid.',
                      style: TextStyle(color: Colors.green),
                    )
                  : Text(
                      'The Aadhar number is invalid.',
                      style: TextStyle(color: Colors.red),
                    )
        ],
      )),
    );
  }
}

class ShowInfo extends StatelessWidget {
  const ShowInfo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(icon: Icon(Icons.info), onPressed: (){
      showDialog(context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 3,
        title: Text("About Aadhar Validator"),
        content: Container(
          height: 220,
          child: Column(
            children: <Widget>[
              Container(
                height: 140,
                child: Text("Aadhar validator is just a simple tool that uses Verhoeff Algorithm to validate if the entered number represents a valid 12 digits aadhar number. To verify the authenticity, always visit UIDAI official website at https://uidai.gov.in/")
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 50,
                child: Text("The app is in no way associated with UIDAI or Indian Government. ")
              )
            ],
          ),
        ),
      )
      );
    });
  }
}
