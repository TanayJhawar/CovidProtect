import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class SakecTeam extends StatefulWidget {
  @override
  _SakecTeamState createState() => _SakecTeamState();
}

class _SakecTeamState extends State<SakecTeam>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, initialIndex: 0, length: 3);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // backgroundColor: Colors.white,
      body: SafeArea(

        child: Container(

         decoration: BoxDecoration(
           image: DecorationImage(
             image: AssetImage("images/sakecbackdrop.jpg"),
             fit: BoxFit.cover,
             colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.45), BlendMode.darken)
           ),
         ),


         height: MediaQuery.of(context).size.height,




          child: BackdropFilter(
              filter: ImageFilter.blur(sigmaY: 2.0,sigmaX: 2.0),



            child: SingleChildScrollView(
              padding: EdgeInsets.only(top: 18.0),
              child: Align(
                child: Container(
                  width: MediaQuery.of(context).size.width - 50,
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Image.asset(
                              'images/icback.png',
                              width: 20,
                              height: 20,
                              color: Colors.white,
                            ),
                          ),
                          Padding(padding: EdgeInsets.only(left: 18.0)),
                          Text(
                            'SAKEC Team',
                            style: TextStyle(
                              fontSize: 28.0,
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * (8.0/10.0),

                        child: TabBarView(
                          controller: _tabController,
                          children: <Widget>[
                            FirstCard(),
                            SecondCard(),
                            ThirdCard(),
                          ],
                        ),
                      ),

                      TabBar(
                        isScrollable: true,
                        unselectedLabelColor: Color(0xff949494),
                        indicatorColor: Colors.transparent,
                        labelColor: Colors.white,
                        controller: _tabController,
                        tabs: <Widget>[
                          Container(
                            width: 1.0,
                            child: Icon(Icons.fiber_manual_record,
                                size: 15.0 /*, color: Color(0xff949494)*/),
                          ),
                          Container(
                            width: 1.0,
                            child: Icon(Icons.fiber_manual_record,
                                size: 15.0 /*, color: Color(0xff949494)*/),
                          ),
                          Container(
                            width: 1.0,
                            child: Icon(Icons.fiber_manual_record,
                                size: 15.0 /*, color: Color(0xff949494)*/),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),

          ),

        )


      ),
    );
  }
}

class FirstCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Align(
          child: Container(
            width: MediaQuery.of(context).size.width - 80,
            height: MediaQuery.of(context).size.height * (8.0/10.0),
            child: Center(
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[

                      /*SizedBox(
                  width: MediaQuery.of(context).size.width - 80,
                  child: Image.asset(
                    "images/sakeclogo.jpg",

                  ),
                ),*/



                      CircleAvatar(
                        radius: 70.0,
                        backgroundColor: Colors.white,

                        child: Image.asset(
                          'images/sakec_logo_sm.png',
                          height: 100,
                          width: 100,
                          fit: BoxFit.contain,
                        ),
                      ),

                      /*Image.asset(
                  "images/sakec_logo_sm.png",
                  height: MediaQuery.of(context).size.height/6,

                  //color: Colors.white,
                ),*/

                      SizedBox(
                        height: MediaQuery.of(context).size.height/40,
                      ),

                      SizedBox(
                        child:  Text(
                          "Shah & Anchor Kutchhi Engineering College is affilliated to University of Mumbai. The college was established by Mahavir Education Trust in 1985, making it one of the oldest techincal institute in the state.",
                          style: TextStyle(
                            fontSize: 16.0,
                            fontFamily: 'Rubik',
                            fontWeight: FontWeight.w400,
                            color: Colors.white,

                          ),
                          textAlign: TextAlign.center,
                        ),
                        width: MediaQuery.of(context).size.width - 80,
                      ),

                      Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * (1.0 / 60.0))),


                      Align(
                          child: FlatButton(
                            onPressed: _launchURL,
                            child: Text('Visit the SAKEC Website',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 17.0,
                                  color: Colors.white,
                                  fontFamily: 'Rubik',
                                  fontWeight: FontWeight.w700,
                                )),
                          )
                      ),


                       Align(
                          child: FlatButton(
                            onPressed: (){
                              launch('http://sakec.ai/');
                            },
                            child: Text('Visit the sakec.ai',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 17.0,
                                  color: Colors.white,
                                  fontFamily: 'Rubik',
                                  fontWeight: FontWeight.w700,
                                )),
                          )
                      ),


                    ],
                  ),
                ),
              ),
            )




          ),
        ),
      ],
    );
  }

  void _launchURL() async {
    const url = 'http://www.shahandanchor.com/home/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

}

class SecondCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Align(
          child: Container(
            height: MediaQuery.of(context).size.height * (8.0/10.0),
            child: Center(
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: <Widget>[

                      /*SizedBox(
                  width: MediaQuery.of(context).size.width - 80,
                  height: MediaQuery.of(context).size.height * (8.0/10.0),
                  child: Image.asset(
                    "images/research.jpg",

                  ),
                ),*/

                      SizedBox(
                        child:  Text(
                          "SAKEC Research Cell strives towards the Vision and Mission of our institute. We at SAKEC have been undertaking consistent efforts to align our R&D activities to achieve technological competence and professional standards. The faculty and students undertake research projects in thriving areas of science, engineering, management and technology.",
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.white,
                            fontFamily: 'Rubik',
                            fontWeight: FontWeight.w400,

                          ),
                          textAlign: TextAlign.center,
                        ),
                        width: MediaQuery.of(context).size.width - 80,
                      ),

                      Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * (1.0 / 60.0))),


                      Align(
                          child: FlatButton(
                            onPressed: _launchResearch,
                            child: Text('Visit the Research Cell Website',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 17.0,
                                  color: Colors.white,
                                  fontFamily: 'Rubik',
                                  fontWeight: FontWeight.w700,
                                )),
                          )
                      ),

                    ],
                  ),
                ),
              ),
            )





          ),
        )
      ],
    );
  }
  void _launchResearch() async {
    const url = 'http://www.shahandanchor.com/research/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }




}

class ThirdCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: SingleChildScrollView(
          child: Center(
            child:  Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SizedBox(height: 50.0),


                Text(
                  'External Mentors',
                  style: TextStyle(
                      fontSize: 22,
                      fontFamily: 'Rubik',
                      fontWeight: FontWeight.w500,
                      color: Colors.white
                  ),
                ),
                Padding(padding: EdgeInsets.all(1.0)),
                Text(
                  'Mr. Shrikant K',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Rubik',
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(1.0)),
                Text(
                  'Mr. Ramesh M',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Rubik',
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(1.0)),
                Text(
                  'Mr. Madhav E',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Rubik',
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(1.0)),
                Text(
                  'Mr. Srinivas B',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Rubik',
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(1.0)),
                Text(
                  'Mr. Abhijeet U',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Rubik',
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(1.0)),
                Text(
                  'Ms. Supriya S',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Rubik',
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(1.0)),
                Text(
                  'Ms. Gowri S',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Rubik',
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(18.0)),

                Text(
                  'Project Manager',
                  style: TextStyle(
                      fontSize: 22,
                      fontFamily: 'Rubik',
                      fontWeight: FontWeight.w500,
                      color: Colors.white
                  ),
                ),
                Padding(padding: EdgeInsets.all(1.0)),
                Text(
                  'Dr. Nilakshi Jain',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Rubik',
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(18.0)),


                //Leader
                Text(
                  'Project Leader',
                  style: TextStyle(
                      fontSize: 22,
                      fontFamily: 'Rubik',
                      fontWeight: FontWeight.w500,
                      color: Colors.white
                  ),
                ),
                Padding(padding: EdgeInsets.all(1.0)),
                Text(
                  'Prof. Jalpa Mehta',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Rubik',
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(18.0)),



              Text(
                  'Project Team Member',
                  style: TextStyle(
                      fontSize: 22,
                      fontFamily: 'Rubik',
                      fontWeight: FontWeight.w500,
                      color: Colors.white
                  ),
                ),
                Padding(padding: EdgeInsets.all(1.0)),
                Text(
                  'Prof. Shashikant Radke ',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Rubik',
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(1.0)),
                Text(
                  'Prof. Pradip Mane',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Rubik',
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(18.0)),


                Text(
                  'Project Coordinator',
                  style: TextStyle(
                      fontSize: 22,
                      fontFamily: 'Rubik',
                      fontWeight: FontWeight.w500,
                      color: Colors.white
                  ),
                ),
                Padding(padding: EdgeInsets.all(1.0)),
                Text(
                  'Mr. Saish Khandare',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Rubik',
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(1.0)),
                Text(
                  'Mr. Vedant Parikh',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Rubik',
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(1.0)),
                Text(
                  'Mr. Ansh Ved',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Rubik',
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(18.0)),


                Text(
                  'AI Research Intern',
                  style: TextStyle(
                      fontSize: 22,
                      fontFamily: 'Rubik',
                      fontWeight: FontWeight.w500,
                      color: Colors.white
                  ),
                ),
                Padding(padding: EdgeInsets.all(1.0)),
                Text(
                  'Mr. Utsav Gada',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Rubik',
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(1.0)),
                Text(
                  'Ms. Forum Patel',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Rubik',
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(1.0)),
                Text(
                  'Ms. Ashi Gala',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Rubik',
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(18.0)),



                Text(
                  'Privacy Preservation & Data Mining Research Intern',
                  textAlign: TextAlign.center,
                  
                  style: TextStyle(
                      fontSize: 22,
                      fontFamily: 'Rubik',
                      fontWeight: FontWeight.w500,
                      color: Colors.white,

                  ),
                ),
                Padding(padding: EdgeInsets.all(1.0)),
                Text(
                  'Ms. Ishita Joshi',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Rubik',
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(1.0)),
                Text(
                  'Ms. Purva Jadhav',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Rubik',
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(1.0)),
                Text(
                  'Mr. Jay Mehta',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Rubik',
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(18.0)),




                Text(
                  'Software Design Intern',
                  style: TextStyle(
                      fontSize: 22,
                      fontFamily: 'Rubik',
                      fontWeight: FontWeight.w500,
                      color: Colors.white
                  ),
                ),
                Padding(padding: EdgeInsets.all(1.0)),
                Text(
                  'Mr. Krutik Patel',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Rubik',
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(1.0)),
                Text(
                  'Mr. Dhruv Chamaria',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Rubik',
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(18.0)),


                Text(
                  'Software Developer Intern',
                  style: TextStyle(
                      fontSize: 22,
                      fontFamily: 'Rubik',
                      fontWeight: FontWeight.w500,
                      color: Colors.white
                  ),
                ),
                Padding(padding: EdgeInsets.all(1.0)),
                Text(
                  'Mr. Siddhant Kadam',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Rubik',
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(1.0)),
                Text(
                  'Ms. Bhavya Joshi',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Rubik',
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(1.0)),
                Text(
                  'Mr. Prasanna Limaye',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Rubik',
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(1.0)),
                Text(
                  'Mr. Jashil Mehta',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Rubik',
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),Padding(padding: EdgeInsets.all(1.0)),
                Text(
                  'Mr. Tanay Jhawar',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Rubik',
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),Padding(padding: EdgeInsets.all(1.0)),
                Text(
                  'Mr. Vatsal Gada',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Rubik',
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),Padding(padding: EdgeInsets.all(1.0)),
                Text(
                  'Mr. Priyesh Ghosh',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Rubik',
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),Padding(padding: EdgeInsets.all(1.0)),
                Text(
                  'Ms. Nidhi Kantekar',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Rubik',
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),Padding(padding: EdgeInsets.all(1.0)),
                Text(
                  'Mr. Rushi Shah',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Rubik',
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),Padding(padding: EdgeInsets.all(1.0)),
                Text(
                  'Ms. Pallavi Pandey',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Rubik',
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(1.0)),
                Text(
                  'Mr. Tirth Thoria',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Rubik',
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(1.0)),
                Text(
                  'Mr. Jiten Patel',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Rubik',
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(1.0)),
                Text(
                  'Mr. Jay Visaria',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Rubik',
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(1.0)),
                Text(
                  'Ms. Disha Shah',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Rubik',
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(18.0)),



              ],
            ),
          ),
        ),
      ),
    );


  }
}
