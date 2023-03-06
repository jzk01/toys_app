import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';



class ToysDetails extends StatefulWidget {
  const ToysDetails({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ToysState();
  }

}

class _ToysState extends State<ToysDetails> {

  List<String> kidAge = ['less than year', '1+ years', '3+ years', '6+ years', '8+ years', '10+ years', '12+ years'];
  List<String> toysCategory =['Animal toys', 'Spinning toys', 'Sound toys', 'Dolls', 'Puzzles', 'Food-related toys', 'Educational toys',
    'Electronic toys', 'Cars', 'Sports toys', 'Other'];
    final _formKey = GlobalKey<FormState>();
   String? selectedAge;
   String? selectedCategory;
   XFile? imageFile;
   String? fileName;
   String? phone;
   String? price;
   String? selectedGender;
   String? selectedCondition;

  _openGallery(BuildContext context) async {
    var picture = await ImagePicker().pickImage(source: ImageSource.gallery,maxHeight:500,maxWidth: 500);
      setState(() {
      imageFile = picture;
      fileName = basename(imageFile!.path);
    });
    if (!mounted) return;
    Navigator.of(context).pop();
  }
  _openCamera(BuildContext context) async {
    var picture = await ImagePicker().pickImage(source: ImageSource.camera,maxHeight:500,maxWidth: 500);
    setState(() {
      imageFile = picture;
      fileName = basename(imageFile!.path);
    });
    if (!mounted) return;
    Navigator.of(context).pop();
  }
  Future<void> _showChoiceDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Upload From:"),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  GestureDetector(
                      child: Row(
                        children: const [
                          Icon(Icons.photo_outlined, color: Colors.indigoAccent,),
                           Padding(
                             padding: EdgeInsets.only(left: 8.0),
                             child: Text("Gallery"),
                           ),
                        ],
                      ),
                      onTap: () {
                        _openGallery(context);
                      }),
                  const Padding(
                      padding: EdgeInsets.all(8.0)
                  ),
                  GestureDetector(
                      child: Row(
                        children: const [
                          Icon(Icons.camera_alt_outlined, color: Colors.indigoAccent,),
                           Padding(
                             padding: EdgeInsets.only(left: 8.0),
                             child: Text("Camera"),
                           ),
                        ],
                      ),
                      onTap: () {
                        _openCamera(context);
                      }),
                ],
              ),
            ),
          );
        });
  }
  Widget _imageView() {
    if (imageFile == null) {
      return const Text("No Image Selected!");
    } else {
      return Image.file(File(imageFile!.path), height: 400, width: 400);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
           SliverAppBar(
            expandedHeight: 200,
             floating: false,
             pinned: true,
              flexibleSpace:FlexibleSpaceBar(
                title: const Padding(
              padding: EdgeInsets.only(right:20),
                child:  Text("Toys Details",
                style: TextStyle(fontSize: 22),

              ),
          ),
              background: ColorFiltered(
              colorFilter:
              ColorFilter.mode(Colors.indigo.withOpacity(0.9), BlendMode.hardLight),
              child:  Image.asset('assets/toy2.jpg',
                fit:BoxFit.cover,
                height: 500,
                width: 500,
              ),
              ),
            ),
          ),
          ];
        },
    body: SingleChildScrollView(
         child: Padding(
           padding: const EdgeInsets.all(5.0),
           child: Column(
             children: [
              const Align(
                 alignment: Alignment.centerLeft,
                 child:  Text(
                   '*  is required',
                   style: TextStyle(color: Colors.grey, fontStyle: FontStyle.italic, fontSize: 16),
                 ),
               ),
            Form(
             key: _formKey,
            child: Column(
            children: [
               Padding(
                 padding: const EdgeInsets.only(top:6),
                 child: DropdownButtonFormField(
                   autovalidateMode: AutovalidateMode.onUserInteraction,
                   validator: (value){
                     if (value == null) {
                       return "Please select a value";
                     }
                     return null;
                   },
                   decoration: InputDecoration(
                     border: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(50.0),
                     ),
                   ),
                   value: selectedAge,
                     hint: const Text("Select Child Age *"),
                     items: kidAge.map((item) => DropdownMenuItem(
                         value: item,
                         child: Text(item, style: const TextStyle(fontSize: 17,),)))
                         .toList(),
                     onChanged: (item){
                       setState(() {
                       selectedAge = item;
                     });
                     },
                   icon: const Icon(Icons.arrow_forward_ios, color: Colors.indigoAccent, size: 22,),
                 ),
               ),
              Padding(
                padding: const EdgeInsets.only(top:15),
                child: DropdownButtonFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value){
                    if (value == null) {
                      return "Please select a value";
                    }
                    return null;
                  },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                ),
                  value: selectedCategory,
                  hint: const Text("Select Toy Category *"),
                  items: toysCategory.map((item) => DropdownMenuItem(
                      value: item,
                      child: Text(item, style: const TextStyle(fontSize: 17),)))
                      .toList(),
                  onChanged: (item){
                    setState(() {
                      selectedCategory = item;
                    });
                  },
                  icon: const Icon(Icons.arrow_forward_ios, color: Colors.indigoAccent, size: 22,),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:15),
                child: SizedBox(
                  height: 62,
                  child: GestureDetector(
                    onTap: ()  async {
                       selectedCondition = await displayCondition(context);
                       setState(() {});

                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black45,
                        ),
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 9,
                            child: Padding(
                              padding: const EdgeInsets.only(left:10.0),
                              child: selectedCondition != null
                                  ? Text(selectedCondition!, style: const TextStyle(fontSize: 17))
                                  :  const Text("Select Toy Condition *", style: TextStyle(fontSize: 17, color: Colors.black54
                              ),
                              ),
                            ),
                          ),
                          const Expanded(
                            flex:1,
                              child: Icon(Icons.arrow_forward_ios, color: Colors.indigoAccent, size: 22,)),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:15),
                child: SizedBox(
                  height: 62,
                  child: GestureDetector(
                    onTap: () async {
                      selectedGender = await displayGender(context);
                      setState(() {});

                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black45,
                        ),
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                        child:  Row(
                          children: [
                               Expanded(
                                flex:9,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: selectedGender != null
                                      ? Text(selectedGender!, style: const TextStyle(fontSize: 17))
                                      : const Text("Select Child Gender *", style: TextStyle(fontSize: 17, color: Colors.black54
                                  ),
                                  ),
                                ),
                              ),
                           const Expanded(
                              flex:1,
                                child: Icon(Icons.arrow_forward_ios, color: Colors.indigoAccent, size: 22,)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

              Padding(
                padding: const EdgeInsets.only(top:15),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,

                  validator: validatePrice,
                  onChanged: (value) {
                    price = value;

                  },
                  decoration:  InputDecoration(
                    prefixIcon:const Icon(Icons.attach_money,color:Colors.indigoAccent),
                    labelText: 'Price (in dollars) *',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:15),
                child: TextFormField(
                  decoration:  InputDecoration(
                    prefixIcon:const Icon(Icons.description,color:Colors.indigoAccent),
                    labelText: 'Description',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                  ),
                ),
              ),
            const SizedBox(height: 20.0),
              _imageView(),
              ElevatedButton(
            onPressed: () {
            _showChoiceDialog(context);
            },
               child: const Text("Upload Image"),
      ),
               SizedBox(
                height: 60,
                width: 390,
               child: Padding(
                 padding: const  EdgeInsets.all(8.0),
                 child:  ElevatedButton(
                   onPressed:  (imageFile!=null && price!=null && selectedAge!=null && selectedCategory!=null && selectedGender!=null && selectedCondition!=null) ? () { submitted(context); }: null,
                   style:  ButtonStyle(
                     backgroundColor:  const MaterialStatePropertyAll<Color>(Colors.redAccent) ,
                     shape: MaterialStatePropertyAll<OutlinedBorder>( RoundedRectangleBorder( borderRadius: BorderRadius.circular(50))),
                   ),
                   child: const Text("Submit",
                   style:  TextStyle(
                     color: Colors.white,
                     fontSize: 23,
                   ),
                 ),
                 ),
                 ),
               ),
            ],
            ),
      ),

           ],
           ),
         ),
       ),
    ),
    );
  }
   String? validateNumber(String? value) {
    if (value!.isEmpty) {
      return "Phone Number is required!";
    }
    if (value.length != 8){
      return 'Mobile Number must be of 8 digits';
    }
    return null;
  }

   String? validatePrice(String? value) {
    if (value!.isEmpty) {
      return "Price in dollars is Required!";
    }
    return null;
  }

  void submitted(BuildContext context) {
    Widget okButton = TextButton(
      child: const Text("OK"),
      onPressed: (){
        Navigator.popUntil(context, ModalRoute.withName('/'));

      },
    );
    var alertDialog =  AlertDialog(
      title: const Text("Your post has been added successfully"),
      content: const Text("Refresh the list to check your post") ,

      actions: [
        okButton,
      ],
    );

    showDialog(context: context,
        builder: (BuildContext context){
          return alertDialog;
        }
    );
  }
  Future<String?> displayGender(BuildContext context) async {
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('Select Gender:'),
          children: <Widget>[
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, 'Boys');
              },
              child: Row(
                children: const [
                  Icon(Icons.boy, color: Colors.indigoAccent, size: 30,),
                   Padding(
                     padding: EdgeInsets.all(5.0),
                     child: Text('Boys',style: TextStyle(fontSize: 16),),
                   ),
                ],
              ),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, 'Girls');
              },
              child: Row(
                children: const[
                  Icon(Icons.girl,color:Colors.indigoAccent,size: 30,),
                   Padding(
                     padding: EdgeInsets.all(5.0),
                     child: Text('Girls',style: TextStyle(fontSize: 16),),
                   ),
                ],
              ),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, 'Works For Both');
              },
              child: Row(
                children: const [
                  Icon(Icons.people,color:Colors.indigoAccent,size: 30,),
                   Padding(
                     padding: EdgeInsets.all(5.0),
                     child: Text('Works For Both',style: TextStyle(fontSize: 16),),
                   ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
  Future<String?> displayCondition(BuildContext context) async {
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('Select Condition:'),
          children: <Widget>[
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, 'Excellent');
              },
              child: Row(
                children: const [
                  Icon(Icons.sentiment_satisfied_rounded, color: Colors.indigoAccent, size: 25,),
                  Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Text('Excellent',style: TextStyle(fontSize: 16),),
                  ),
                ],
              ),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, 'Good');
              },
              child: Row(
                children: const[
                  Icon(Icons.sentiment_neutral,color:Colors.indigoAccent,size: 25,),
                  Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Text('Good',style: TextStyle(fontSize: 16),),
                  ),
                ],
              ),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, 'Bad');
              },
              child: Row(
                children: const [
                  Icon(Icons.sentiment_dissatisfied_sharp,color:Colors.indigoAccent,size: 25,),
                  Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Text('Bad',style: TextStyle(fontSize: 16),),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
