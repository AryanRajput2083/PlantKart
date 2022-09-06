import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:plantkart/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'PlantKart',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Welcome'),
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/a': (context) => const MyPage(title: 'PlantKart'),
        '/b': (context) => const MyCart(title: 'My Cart'),
        '/c': (context) => Info(title: '', price: '', desc: '', img: '', iscart: true),
      },
    );
  }
}

List<String> p_title = ['Rose','Lily','Sunflower','Aloe vera','Ugaoo Christmas Cactus Plant','Luck Money Plant','Pink Desi Rose Plant','gudhal live flower plant','little jungle Anthurium pink'];
List<String> p_price = ['299',  '349','99'       ,'379'      ,'375'                         ,'299'             ,'280'                 ,'159'                     ,'459'];
List<String> p_image = ['assets/rose1.jpg','assets/lily.jpg','assets/sunflower.jpg','assets/aloevera.jpg','assets/cactus.jpg','assets/ugauPlant.jpg','assets/pinkRose.jpg','assets/gurhal.jpg','assets/antharim.jpg'];
List<String> p_descp = [
'''
Plant or Animal Product Type	Live plants
Indoor/Outdoor Usage	        Indoor
Brand	                        Mphmi
Material Feature	            Organic
Colour	                      Evergreen
Special Feature	              Air Purification''',
'''
Plant or Animal Product Type	Hedges & Shrubs
Brand	                        Mphmi
Material Feature	            Heirloom
Colour	                      Evergreen Plants
Special Feature	              Drought Tolerant, Deer Resistant, Pet Friendly, Fragrant, Air Purification
Expected Blooming Period	    Autumn''',
'''
Packager container: 50 seeds.
Sungold flower seeds germination rates up to 90% to 98%.
Flower season: mid-summer through fall.
Plant height: 1 to 2 feet.
Sungold seeds germinated 10 to 21 days to germinate at a temperature of 21 to 30 degrees.
Light Requirement In a day: 6-8 hours Full sunlight.
Soil type: farm yard manure, sand and cocopeat.
Easy to grow any pot and garden.
Germination instruction manual inside the packet.
Audhav trusted qualities seeds.''',
'''
Aloe thrive on neglect, are drought tolerant, sooth skin, and are one of the easiest low maintenance houseplants to grow on your home or office desk
Indoor or outdoor, they are beautiful and easy to care for; ideal size for shelves, tabletops, and counters in the dorm, home, office, or garden
This perfect beginner plant is in a 6" container measuring 8-10" Inches tall from the bottom of the pot to the top leaves; likes bright sunlight
Houseplants make your home more beautiful, purify your air, boost your mood, help you sleep, and relieve dryness by raising the humidity in your rooms
This clumping succulent form of green Aloe Vera flowers once a year with stunning fire red and yellow flowers on tall spikes''',
'''
The Christmas Cactus has segmented leaves and large flowers. It can tolerate dry soil and low light making it a perfect indoor plant for home.
It is gifted during Thanksgiving and Christmas as the flowers bloom in winters. It can be placed in living room or bedroom where there is indirect sunlight.
Watering requirement for the plant is generally just once a week. But it is ideal to water it whenever the top layer of the soil feels dry.
Plant height without the pot is - 4 to 5 inch. And the plant spread is ranging between - 3 to 5. And the Pot height is 4 inch.''',
'''
Money plant is an excellent indoor plant due to its ability ot survive in low light . It is an Air Purifier plant as it efficiently removes indoor pollutants. It is also an easy to care for plant suitable in living room, balcony, bedroom or in hanging baskets.
This plant with its beautiful heart shaped leaves with specles of cream or white markings is believed to bring good luck & prosperity to your home according to Feng Shui.
Watering requirement for the plant is generally twice a week. But it is ideal to water it whenever the top layer of the soil feels dry.
Plant height without the pot is - 6 to 9 inch. And the plant spread is ranging between - 8 to 11 inch. And the Pot height is 4 inch.''',
'''
Plant Size Upto 1-2 Feet
Easy Growing Plant
1 Healthy Live Pink Rose Plant Comes With Secure Packing
Place at Outdoor Gardening''',
'''
Natural live plant with pot
easy to maintanace live plant
quick and safe delivery''',
'''
Comes in 4.5" nursery pot
Healthy bushy Plant with at least 1-2 flowers
Safer Packaging For Healthy Plant Delivery
Seller support available, message seller in case of any problem'''];


// Page showing all items to purchase
class MyPage extends StatefulWidget{
  const MyPage({super.key, required this.title});

  final String title;
  @override
  State<StatefulWidget> createState() => _MyPageState();
}
class _MyPageState extends State<MyPage>{

  void do_Logout(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => MyDetail()));
  }
  // Widget listItem(String title, String price,String imag){
  //   return Card(
  //     shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.circular(5),
  //     ),
  //     child: InkWell(
  //         onTap: (){
  //           Navigator.push(context, MaterialPageRoute(builder: (context) => Info(title: title,
  //             price: price, desc: 'ya hoo', img: imag, iscart: true,)));
  //         },
  //         child: Row(
  //           mainAxisAlignment: MainAxisAlignment.start,
  //           children: [
  //             Image.asset(
  //               imag,
  //               height: 70,
  //             ),
  //             Expanded(
  //                 child: Column(
  //                   mainAxisAlignment: MainAxisAlignment.start,
  //                   children: [
  //                     Row(
  //                       children: [
  //                         Container(
  //                           margin: EdgeInsets.only(left: 20),
  //                           child: Text(
  //                             title,
  //                             style: TextStyle(
  //                               fontSize: 18,
  //                             ),
  //                           ),
  //                         ),
  //                       ]
  //                     ),
  //                     Row(
  //                       mainAxisAlignment: MainAxisAlignment.end,
  //                       children: [
  //                         Container(
  //                           margin: EdgeInsets.only(right: 20),
  //                           child: Text(
  //                             "Rs. "+price,
  //                             style: TextStyle(
  //                               fontSize: 14,
  //                             ),
  //                           ),
  //                         ),
  //                       ],
  //                     )
  //                     // Expanded(
  //                     //     child:Row(
  //                     //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                     //       children: [
  //                     //         // Text(
  //                     //         //   price,
  //                     //         //   style: TextStyle(
  //                     //         //     fontSize: 14,
  //                     //         //   ),
  //                     //         // ),
  //                     //         // IconButton(
  //                     //         //   onPressed: (){
  //                     //         //
  //                     //         //   },
  //                     //         //   icon: const Icon(
  //                     //         //       Icons.add_shopping_cart
  //                     //         //   ),
  //                     //         // ),
  //                     //       ],
  //                     //     )
  //                     // )
  //
  //                   ],
  //                 )
  //             ),
  //           ],
  //         ),
  //       )
  //   );
  // }
  // Widget lists(){
  //   return ListView.builder(
  //     itemCount: p_title.length,
  //     itemBuilder: (context, i){
  //       return listItem(p_title[i],p_price[i],p_image[i]);
  //     },
  //   );
  // }

  List<String> c_title=[];
  List<String> c_price=[];
  List<String> c_image=[];
  List<String> c_descp=[];
  Future<void> _listview() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      c_title = prefs.getStringList("title")??[];
      c_price = prefs.getStringList("price")??[];
      c_image = prefs.getStringList("image")??[];
      c_descp = prefs.getStringList("descp")??[];
    });
  }
  Widget glItem(String title, String price,String imag,String dsc){
    _listview();
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(7),
      ),
      child: InkWell(
        onTap: (){
          bool v= false;
          if(c_title.contains(title)){
            v = true;
          }
          Navigator.push(context, MaterialPageRoute(builder: (context) => Info(title: title,
            price: price, desc: dsc, img: imag, iscart: v)));
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AspectRatio(
              aspectRatio: 16/9,
              child: Image.asset(
                imag,
                // fit: BoxFit.fitWidth,

              ),
            ),

            Container(
              padding: EdgeInsets.all(3),
              child: Text(
                title,
                style: TextStyle(

                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(3),
              child: Text(
                "Rs. "+price,
                style: TextStyle(
                  color: Colors.purple,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  Widget glist(){
    return GridView.builder(
        itemCount: p_title.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 4.0,
            mainAxisSpacing: 4.0
        ),
        itemBuilder: (BuildContext context, int i){
          return glItem(p_title[i],p_price[i],p_image[i],p_descp[i]);
        },

    );
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        actions: [
          IconButton(
            tooltip: "Cart",
            icon: const Icon(
              Icons.shopping_cart,
            ),
            onPressed: () {
              Navigator.pushNamed(context, "/b");
            },
          ),
          IconButton(
            tooltip: "Account",
            icon: const Icon(
              Icons.account_circle_rounded,
            ),
            onPressed: () {
              do_Logout();
            },
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(8),
        margin:  EdgeInsets.all(10),
        child:   glist(),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


// Login and registration page
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

  bool login_p = true, _vis = false;
  String usrn = "Username", pasw = "Password";

  TextEditingController log_email = TextEditingController();
  TextEditingController log_passw = TextEditingController();
  TextEditingController reg_email = TextEditingController();
  TextEditingController reg_fname = TextEditingController();
  TextEditingController reg_lname = TextEditingController();
  TextEditingController reg_phone = TextEditingController();
  TextEditingController reg_passw = TextEditingController();
  TextEditingController reg_paswc = TextEditingController();

  void change(){
    Navigator.pushReplacementNamed(context, '/a');
  }
  void ssd(String ss){
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(ss),
        );
      },
    );
  }

  Future<void> chk() async {
    final prefs = await SharedPreferences.getInstance();
    String ss = prefs.getString("name").toString()??"";
    if(ss!="null"){
      change();
    }
  }
  Future<void> do_login(String email,String pasw) async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _vis = true;
      List<String> c_users = prefs.getStringList("users")??[];
      if(c_users.contains(email)){
        if(prefs.getString(email)==pasw){
          prefs.setString("name", email);
          change();
        }
        else{
          ssd("wrong password");
        }
      }
      else{
        ssd("invalid email");
      }
    });
  }
  Future<void> do_register(String fn,String ln,String email,String phone,String pasw) async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      _vis = true;
      List<String> c_users = prefs.getStringList("users")??[];
      c_users.add(email);
      prefs.setStringList("users", c_users);
      prefs.setString(email, pasw);
      prefs.setString("name_"+email, fn+" "+ln);
      prefs.setString("phone_"+email, phone);
      do_login(email, pasw);
    });
  }

  Widget login_page() {

    return Center(
      child : Container(

            // height: 340,
            constraints: BoxConstraints(
              minHeight: 0,
              maxHeight: 320,
            ),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),

              child: Center(
                // splashColor:     Theme.of(context).colorScheme.onSurface.withOpacity(1),
                // highlightColor: Colors.transparent,

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[

                    Container(
                      padding: EdgeInsets.all(4),
                      margin: EdgeInsets.all(6),
                      child: TextField(
                        keyboardType: TextInputType.emailAddress,
                        controller: log_email,
                        decoration: InputDecoration(
                          filled: true,
                          border: OutlineInputBorder(),
                          labelText: "email",
                        ),
                      ),
                    ),

                    Container(
                      padding: EdgeInsets.all(4),
                      margin: EdgeInsets.all(6),
                      child: TextField(
                        keyboardType: TextInputType.visiblePassword,
                        controller: log_passw,
                        obscureText: true,
                        decoration: InputDecoration(
                          filled: true,
                          border: OutlineInputBorder(),
                          labelText: pasw,
                          hintText: "Enter your Password",
                        ),
                      ),
                    ),

                    Container(
                      padding: EdgeInsets.all(4),
                      margin:  EdgeInsets.all(6),
                      child: ElevatedButton(
                        onPressed: (){
                          if(log_passw.text.isNotEmpty&&log_email.text.isNotEmpty){
                            do_login(log_email.text,log_passw.text);
                          }
                          else{
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  content: Text("Empty fields"),
                                );
                              },
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(double.infinity,50),
                        ),
                        child: Text(
                          "Login",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),

                      ),
                    ),

                    Container(
                      padding: EdgeInsets.all(4),
                      margin:  EdgeInsets.all(6),
                      child:  Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          TextButton(
                            onPressed: (){

                            },
                            child: Text(
                              "Forget Password",
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ),

                          TextButton(
                            onPressed: (){
                              setState(() {
                                login_p = false;
                              });
                            },
                            child: Text(
                              "Register",
                              style: TextStyle(
                                fontSize: 12,
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
  Widget register_page(){
    // return ListView.builder(
    //   itemCount: 1,
    //   itemBuilder: (context, i){
    //
    //   },
    //
    // );
    return Container(

      // height: 340,
      constraints: BoxConstraints(
        minHeight: 0,
        maxHeight: 550,
      ),

      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),

        child: Container(
          // splashColor:     Theme.of(context).colorScheme.onSurface.withOpacity(1),
          // highlightColor: Colors.transparent,

          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [

                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(4),
                      margin: EdgeInsets.all(4),
                      child: TextField(
                        keyboardType: TextInputType.name,
                        controller: reg_fname,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "First name",
                        ),
                      ),
                    ),
                  ),

                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(4),
                      margin: EdgeInsets.all(4),
                      child: TextField(
                        keyboardType: TextInputType.name,
                        controller: reg_lname,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Last Name",
                        ),
                      ),
                    ),
                  ),

                ],
              ),

              Container(
                padding: EdgeInsets.all(4),
                margin: EdgeInsets.all(4),
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  controller: reg_email,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "email",
                  ),
                ),
              ),

              Container(
                padding: EdgeInsets.all(4),
                margin: EdgeInsets.all(4),
                child: TextField(
                  keyboardType: TextInputType.phone,
                  controller: reg_phone,
                  maxLength: 10,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Phone",
                    prefixText: "+91",
                  ),
                ),
              ),

              Container(
                padding: EdgeInsets.all(4),
                margin: EdgeInsets.all(4),
                child: TextField(
                  keyboardType: TextInputType.visiblePassword,
                  controller: reg_passw,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Password",
                  ),
                ),
              ),

              Container(
                padding: EdgeInsets.all(4),
                margin: EdgeInsets.all(4),
                child: TextField(
                  keyboardType: TextInputType.visiblePassword,
                  controller: reg_paswc,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Confirm Password",
                  ),
                ),
              ),

              Container(
                padding: EdgeInsets.all(4),
                margin:  EdgeInsets.all(4),
                child: ElevatedButton(
                  onPressed: (){


                    if(reg_passw.text.isNotEmpty&&reg_phone.text.isNotEmpty&&reg_email.text.isNotEmpty&&reg_lname.text.isNotEmpty&&reg_fname.text.isNotEmpty){
                      if(reg_passw.text==reg_paswc.text)
                        do_register(reg_fname.text, reg_lname.text, reg_email.text, reg_phone.text, reg_passw.text);
                      else{
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              content: Text("mismatched password"),
                            );
                          },
                        );
                      }
                    }
                    else{
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: Text("empty fields"),
                          );
                        },
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity,50),
                  ),
                  child: Text(
                    "Register",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),

                ),
              ),

              Container(
                padding: EdgeInsets.all(4),
                margin:  EdgeInsets.all(4),
                child:  Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [

                    TextButton(
                      onPressed: (){
                        setState(() {
                          login_p = true;
                        });
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 12,
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

    );
  }
  Widget main_body(){
    if(login_p)
      return login_page();
    else
      return register_page();
  }

  @override
  void initState() {
    chk();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(8),
          margin:  EdgeInsets.all(10),
          child:   Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.all(5),
                  child: Visibility(
                      visible: _vis,
                      child: LinearProgressIndicator()
                  )
              ),
              main_body(),
            ],
          ),
        ),
      )
       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


// Page to show cart listView
class MyCart extends StatefulWidget{
  const MyCart({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyCart> createState() => _MyCartState();
}
class _MyCartState extends State<MyCart> with WidgetsBindingObserver{

  List<String> _title=[];
  List<String> _price=[];
  List<String> _image=[];
  List<String> _descp=[];

  void ssd(String ss){
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(ss),
        );
      },
    );
  }
  Widget listItem(String title, String price,String imag,String des){
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),

        child: InkWell(
          onTap: (){

            Navigator.push(context, MaterialPageRoute(builder: (context) => Info(title: title,
              price: price, desc: des, img: imag, iscart: true,)));
          },
          child: Container(
            padding: EdgeInsets.all(3),
            margin: EdgeInsets.all(3),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  imag,
                  height: 70,
                ),
                Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 20),
                                child: Text(
                                  title,
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ]
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 20),
                              child: Text(
                                "Price: "+price,
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        )
                        // Expanded(
                        //     child:Row(
                        //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //       children: [
                        //         // Text(
                        //         //   price,
                        //         //   style: TextStyle(
                        //         //     fontSize: 14,
                        //         //   ),
                        //         // ),
                        //         // IconButton(
                        //         //   onPressed: (){
                        //         //
                        //         //   },
                        //         //   icon: const Icon(
                        //         //       Icons.add_shopping_cart
                        //         //   ),
                        //         // ),
                        //       ],
                        //     )
                        // )

                      ],
                    )
                ),
              ],
            ),
          ),
        )
    );
  }
  Future<void> _listview() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      List<String> c_title = prefs.getStringList("title")??[];
      List<String> c_price = prefs.getStringList("price")??[];
      List<String> c_image = prefs.getStringList("image")??[];
      List<String> c_descp = prefs.getStringList("descp")??[];

      _title.clear();
      _descp.clear();
      _price.clear();
      _image.clear();

      for(int i=0;i<c_title.length;++i){
        _title.add(c_title[i]);
        _price.add(c_price[i]);
        _image.add(c_image[i]);
        _descp.add(c_descp[i]);
      }
    });
  }
  void ShowT(String s){
    Fluttertoast.showToast(
        msg: s,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }
  Widget _lstview(){
    // ShowT(_title.length.toString());
    if(_title.length==0){
      return Center(
        child: Text(
          "No item in cart",
          style: TextStyle(
            fontSize: 18
          ),
        ),
      );
    }
    else{
      return ListView.builder(
          itemCount: _title.length,
          itemBuilder: (context,i){
            return listItem(_title[i], _price[i], _image[i],_descp[i]);
          }
      );
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _listview();
  }
  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // if(state == AppLifecycleState.resumed){
    _listview();
  // }
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: _lstview()
    );
  }
  
}


// Info page to show individual details of a plant
class Info extends StatefulWidget{
  Info({super.key, required this.title,required this.price,required this.desc,required this.img,required this.iscart});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  String title,price,desc,img;
  bool iscart;

  @override
  State<Info> createState() => _InfoState();
}
class _InfoState extends State<Info>{

  void ssd(String ss){
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(ss),
        );
      },
    );
  }
  Future<void> _save() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      List<String> c_title = prefs.getStringList("title")??[];
      List<String> c_price = prefs.getStringList("price")??[];
      List<String> c_image = prefs.getStringList("image")??[];
      List<String> c_descp = prefs.getStringList("descp")??[];
      c_title.add(widget.title);
      c_price.add(widget.price);
      c_image.add(widget.img);
      c_descp.add(widget.desc);
      prefs.setStringList("price", c_price);
      prefs.setStringList("title", c_title);
      prefs.setStringList("image", c_image);
      prefs.setStringList("descp", c_descp);

      // ssd(c_title.length.toString());
      widget.iscart = true;

    });
  }
  Future<void> _remove() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      List<String> c_title = prefs.getStringList("title")??[];
      List<String> c_price = prefs.getStringList("price")??[];
      List<String> c_image = prefs.getStringList("image")??[];
      List<String> c_descp = prefs.getStringList("descp")??[];
      c_title.remove(widget.title);
      c_price.remove(widget.price);
      c_image.remove(widget.img);
      c_descp.remove(widget.desc);
      prefs.setStringList("price", c_price);
      prefs.setStringList("title", c_title);
      prefs.setStringList("image", c_image);
      prefs.setStringList("descp", c_descp);

      widget.iscart=false;
    });
  }

  Widget buton(){
    if(widget.iscart){
      return Container(
        padding: EdgeInsets.all(6),
        child: OutlinedButton(
          onPressed: _remove,
          child: Text(
            "Remove from cart",
            style: TextStyle(
              fontSize: 18
            ),
          ),
          style: OutlinedButton.styleFrom(
            minimumSize: Size(double.infinity, 50)
          )
        ),
      );
    }
    else{
      return Container(
        padding: EdgeInsets.all(6),
        child: ElevatedButton(
          onPressed: _save,
          style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, 50)
          ),
          child: Text(
            "Add to cart",
            style: TextStyle(
                fontSize: 18
            ),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, i){
            return Column(
              children: [
                Image.asset(
                  widget.img,
                  width: double.infinity,
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  width: double.infinity,
                  child: Text(
                    widget.desc,
                    style: TextStyle(
                        fontSize: 16
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(8),
                  child: Text(
                    "Price = "+widget.price,
                    style: TextStyle(
                      color: Colors.purple,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                buton(),

              ],
            );
          }
      ),
    );
  }

}


class MyDetail extends StatefulWidget{
  const MyDetail({super.key});

  @override
  State<StatefulWidget> createState() => _MyDetailState();
}
class _MyDetailState extends State<MyDetail> {

  String Name='',Phone='',Email='',uss='';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    inil();
  }

  Future<void> inil() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      uss = prefs.getString("name").toString();
      Name = prefs.getString("name_"+uss).toString();
      Email = uss;
      Phone = prefs.getString("phone_"+uss).toString();

    });
  }
  Future<void> _logout() async {
    final prefs = await SharedPreferences.getInstance();
      prefs.remove("name");
      SystemNavigator.pop();
  }
  Widget bod(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: double.infinity,
          child: Icon(
              Icons.account_box,
              size: 250
          ),
        ),
        Container(
          width: double.infinity,
          child: Card(
            child: Container(
              margin: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Name",
                        style: TextStyle(
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(
                        Name
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Phone",
                        style: TextStyle(
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(
                          Phone
                      )
                    ],
                  ),
                  Text(
                    "Email",
                    style: TextStyle(
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(Email),
                  Container(
                    padding: EdgeInsets.all(6),
                    child: OutlinedButton(
                      onPressed: _logout,
                      child: Text(
                        "Logout",
                        style: TextStyle(
                          fontSize: 18
                        ),
                      ),
                      style: OutlinedButton.styleFrom(
                        minimumSize: Size(double.infinity, 50)
                      )
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Your Details"),
      ),
      body: bod(),
    );
  }

}