import 'package:flutter/material.dart';

class Detail extends StatefulWidget {
  const Detail({Key? key}) : super(key: key);

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                    print("back");
                  },
                  child: const Icon(Icons.arrow_back,
                    color: Color(0xFF00008B),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Image.asset('assets/images/almond.png'),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.all(16),
                child:   Text('Discreption',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,),),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text("Ginger (Zingiber officinale) is a flowering plant whose rhizome, ginger root or ginger, is widely used as a spice and a folk medicine.[2] It is a herbaceous perennial which grows annual pseudostems (false stems made of the rolled bases of leaves) about one meter tall bearing narrow leaf blades. The inflorescences bear flowers having pale yellow petals with purple edges, and arise directly from the rhizome",
                  style: TextStyle(fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w400),),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text("Ginger (Zingiber officinale) is a flowering plant whose rhizome, ginger root or ginger, is widely used as a spice and a folk medicine.[2] It is a herbaceous perennial which grows annual pseudostems (false stems made of the rolled bases of leaves) about one meter tall bearing narrow leaf blades. The inflorescences bear flowers having pale yellow petals with purple edges, and arise directly from the rhizome",
                  style: TextStyle(fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w400),),
              )
            ],
          ),
        ),
      ),
    );
  }
}
