import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';


class CustomDrawerTwo extends StatefulWidget {
  @override
  _CustomDrawerTwoState createState() => _CustomDrawerTwoState();
}

class _CustomDrawerTwoState extends State<CustomDrawerTwo> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,

          children: <Widget>[


            SizedBox(
              height: 150,
            ),
            // UserAccountsDrawerHeader(
            //   decoration: BoxDecoration(color: Colors.indigo[800]),
            //   accountName: Text(
            //     "User Name",
            //     style: TextStyle(fontSize: 17, color: Colors.white),
            //   ),
            //   accountEmail: Text(
            //     "user.name@gmail.com",
            //     style: TextStyle(fontSize: 17, color: Colors.white),
            //   ),
            //   currentAccountPicture: CircleAvatar(
            //     backgroundColor: Colors.white,
            //     child: Text(
            //       "A",
            //       style: TextStyle(fontSize: 40.0),
            //     ),
            //   ),
            // ),
            ListTile(

              title: Text(
                "Profile",
                style: TextStyle( fontSize: 17,color: Colors.black),
              ),
              onTap: () {

              },
            ),
            // ListTile(
            //   leading: Icon(
            //     Icons.attribution_rounded,
            //     color: Colors.black,
            //     size: 30,
            //   ),
            //   title: Text("Search",style: TextStyle(fontFamily: "Droid Serif",fontSize: 17),),
            //   onTap: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) => BookingTestScreen(id: "4",),
            //       ),
            //     );
            //   },
            // ),
            // ListTile(
            //   leading: Icon(
            //     Icons.phone,
            //     color: Colors.black,
            //     size: 30,
            //   ),
            //   title: Text(
            //     "Pagination",
            //   ),
            //   onTap: () {
            //     Navigator.push(context,
            //         MaterialPageRoute(builder: (context) => TestPagination()));
            //   },
            // ),

            ListTile(
              title: Text(
                "History",
                style: TextStyle( fontSize: 17,color: Colors.black),
              ),
              onTap: () {


                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => PrivacyPolicyScreen()));
              },
            ),
            ListTile(

              title: Text(
                "Report",
                style: TextStyle( fontSize: 17,color: Colors.black),
              ),
              onTap: () {


                // InAppWebViewController _webViewController;
                // InAppWebView(
                //     initialUrl: "https://vromonbuzz.com/About-Us",
                //     initialOptions: InAppWebViewGroupOptions(
                //       crossPlatform: InAppWebViewOptions(
                //         mediaPlaybackRequiresUserGesture: false,
                //         debuggingEnabled: true,
                //       ),
                //     ),
                //     onWebViewCreated: (InAppWebViewController controller) {
                //       _webViewController = controller;
                //     },
                //     androidOnPermissionRequest: (InAppWebViewController controller, String origin, List<String> resources) async {
                //       return PermissionRequestResponse(resources: resources, action: PermissionRequestResponseAction.GRANT);
                //     }
                // );
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => TermsConditionScreen()));
              },
            ),

            ListTile(

              title: Text(
                "Logout",
                style: TextStyle( fontSize: 17,color: Colors.black),
              ),
              onTap: () {

              },
            ),

            // ListTile(
            //   leading: Icon(Icons.person_outline),
            //   title: Text('LogOut'),
            //   onTap: () async {
            //     SharedPreferences sharedPreferces =
            //         await SharedPreferences.getInstance();
            //     String token = sharedPreferces.getString('token');
            //     if (token != null) {
            //       await sharedPreferces.clear();
            //       Navigator.of(context).popUntil((route) => route.isFirst);
            //       Navigator.pop(context);
            //       Navigator.push(context,
            //           MaterialPageRoute(builder: (context) => SplashScreen()));
            //     } else {
            //       Navigator.push(context,
            //           MaterialPageRoute(builder: (context) => SplashScreen()));
            //       return;
            //     }
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
