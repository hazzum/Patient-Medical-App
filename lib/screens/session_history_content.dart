import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

class SessionContent extends StatefulWidget {
  const SessionContent({Key key}) : super(key: key);

  @override
  _SessionContentState createState() => _SessionContentState();
}

class _SessionContentState extends State<SessionContent> with SingleTickerProviderStateMixin {
  AnimationController iconController;
  AssetsAudioPlayer player = AssetsAudioPlayer();

  bool isAnimated = false;
  bool showPlay = true;
  bool showPause= true;

  @override
  void initState() {
    super.initState();
    player.open(Audio('audio/Neighbours from Hell.mp3'), autoStart: false, showNotification: true);
    iconController = AnimationController(vsync: this, duration: Duration(microseconds: 1000));
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          elevation: 0,
      ),
        body: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25.0),
                  topRight: Radius.circular(25.0)),
              color: Colors.blueGrey.shade400,
            ),
            width: double.infinity,
            child: Container(
              padding: EdgeInsets.all(5.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      child: Column(
                        children: [
                          Text("Patient Files",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                          ),
                          ),
                          SizedBox(height: 10,),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.network(
                              'https://media.springernature.com/lw685/springer-static/image/art%3A10.1007%2Fs11042-020-10151-w/MediaObjects/11042_2020_10151_Fig2_HTML.png',
                              fit: BoxFit.fill,
                            ),
                          ),
                          SizedBox(height: 10,),

                          ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.network(
                              'https://www.itnonline.com/sites/default/files/imce-users/ud236/2020-01/Coronavirus_worsening_CT_RSNA_Radiology_2.jpg',
                              fit: BoxFit.fill,
                              loadingBuilder:(BuildContext context, Widget child,ImageChunkEvent loadingProgress) {
                                if (loadingProgress == null) return child;
                                return Center(
                                  child: CircularProgressIndicator(
                                    value: loadingProgress.expectedTotalBytes != null ?
                                    loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes
                                        : null,
                                  ),
                                );
                              },
                            ),
                          ),
                          SizedBox(height: 10,),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.network(
                              'https://www.researchgate.net/profile/William-Makis/publication/49833364/figure/fig1/AS:277337875730432@1443133910229/F-FDG-PET-CT-Discovery-ST-GE-Healthcare-Canada-performed-22-months-following.png',
                              fit: BoxFit.fill,
                            ),
                          ),
                          SizedBox(
                            height: 30.0,
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(25.0),
                                  topRight: Radius.circular(25.0),
                                bottomLeft: Radius.circular(25.0),
                                bottomRight: Radius.circular(25.0),

                              ),
                              color: Colors.white54,),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Doctor's Voice Record", style: TextStyle(
                                  fontSize: 20,
                                ),),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      child: Icon(
                                        Icons.fast_rewind,
                                        color: Colors.black87,
                                      ),
                                      onTap: (){
                                        player.seekBy(Duration(seconds: -10));
                                      },
                                    ),
                                    GestureDetector(
                                      child: AnimatedIcon(
                                        icon: AnimatedIcons.play_pause,
                                        progress: iconController,
                                        size: 50,
                                        color: Colors.black87,
                                      ),
                                      onTap: (){
                                        animateIcon();
                                      },
                                    ),

                                    InkWell(
                                      child: Icon(
                                        Icons.fast_forward,
                                        color: Colors.black87,
                                      ),
                                      onTap: (){
                                        player.seekBy(Duration(seconds: 10));
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),

      ),
    );
  }


  void animateIcon(){
    setState(() {
      isAnimated = !isAnimated;
      isAnimated ? iconController.forward(): iconController.reverse();
      if (isAnimated ){
        iconController.forward();
        player.play();
      }else{
        iconController.reverse();
        player.pause();
      }
    });



  }
  }

