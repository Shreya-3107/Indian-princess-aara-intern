import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../../Utils/constants.dart';

class DesktopTestimonials extends StatelessWidget {
  const DesktopTestimonials({Key? key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 400,
      color: Colors.grey[100],
      child: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text("TESTIMONIALS",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SizedBox(
                  height: 200,
                  width: kMaxWidth,
                  child: CarouselSlider(
                    options: CarouselOptions(
                      scrollDirection: Axis.horizontal,
                      autoPlay: true,
                      aspectRatio: 1.0,
                      enlargeCenterPage: false,
                      pageSnapping: false,
                    ),
                    items: testimonialListDesk,
                  ),
                ),
              ),

            ]
        ),
      ),
    );
  }
}



final List<Widget> testimonialListDesk = [
  Padding(
    padding: EdgeInsets.symmetric(horizontal: 25),
    child: SizedBox(
      width: 1200,
      child:  Row(
          children:[
            SizedBox(
              width: 350,
              child: Card(
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for(int i=0;i<5 ; i++)
                          const Icon(Icons.star),
                      ],
                    ),
                    const SizedBox(height: 15,),
                    const SizedBox(width : 300,child: Center(child: Text("Insert Review1",textAlign: TextAlign.center,))),
                    const SizedBox(height: 15,),
                    const Column(
                      children: [
                        Text("Insert Name ",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                        SizedBox(height: 15,),
                        Text("Insert Place"),
                      ],
                    )
                  ],
                ),
              ),
            ),
            // const SizedBox(
            //   width: 50,
            // ),
            Spacer(),
            SizedBox(
              width: 350,

              child: Card(
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for(int i=0;i<5 ; i++)
                          const Icon(Icons.star),
                      ],
                    ),
                    const SizedBox(height: 15,),
                    const SizedBox(width : 300,child: Center(child: Text("Insert Review2",textAlign: TextAlign.center,))),
                    const SizedBox(height: 15,),
                    const Column(
                      children: [
                        Text("Insert Name ",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                        SizedBox(height: 15,),
                        Text("Insert Place"),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Spacer(),
            SizedBox(
              width: 350,

              child: Card(
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for(int i=0;i<5 ; i++)
                          const Icon(Icons.star),
                      ],
                    ),
                    const SizedBox(height: 15,),
                    const SizedBox(width : 300,child: Center(child: Text("Insert Review3",textAlign: TextAlign.center,))),
                    const SizedBox(height: 15,),

                    const Column(
                      children: [
                        Text("Insert Name ",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                        SizedBox(height: 15,),
                        Text("Insert Place"),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ]
      )
      ,
    ),
  ),


  Padding(
    padding: EdgeInsets.symmetric(horizontal: 25),
    child: SizedBox(
      width: 1200,
      child:  Row(
          children:[
            SizedBox(
              width: 350,

              child: Card(
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for(int i=0;i<5 ; i++)
                          const Icon(Icons.star),
                      ],
                    ),
                    const SizedBox(height: 15,),
                    const SizedBox(width : 300,child: Center(child: Text("Insert Review4",textAlign: TextAlign.center,))),
                    const SizedBox(height: 15,),

                    const Column(
                      children: [
                        Text("Insert Name ",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                        SizedBox(height: 15,),
                        Text("Insert Place"),
                      ],
                    )
                  ],
                ),
              ),
            ),
            // const SizedBox(
            //   width: 50,
            // ),
            Spacer(),
            SizedBox(
              width: 350,

              child: Card(
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for(int i=0;i<5 ; i++)
                          const Icon(Icons.star),
                      ],
                    ),
                    const SizedBox(height: 15,),
                    const SizedBox(width : 300,child: Center(child: Text("Insert Review5",textAlign: TextAlign.center,))),
                    const SizedBox(height: 15,),

                    const Column(
                      children: [
                        Text("Insert Name ",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                        SizedBox(height: 15,),
                        Text("Insert Place"),
                      ],
                    )
                  ],
                ),
              ),
            ),
            // const SizedBox(
            //   width: 50,
            // ),
            Spacer(),
            SizedBox(
              width: 350,
              child: Card(
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for(int i=0;i<5 ; i++)
                          const Icon(Icons.star),
                      ],
                    ),
                    const SizedBox(height: 15,),
                    const SizedBox(width : 300,child: Center(child: Text("Insert Review6",textAlign: TextAlign.center,))),
                    const SizedBox(height: 15,),
                    const Column(
                      children: [
                        Text("Insert Name ",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                        SizedBox(height: 15,),
                        Text("Insert Place"),
                      ],
                    )
                  ],
                ),
              ),
            ),

          ]
      ),
    ),
  ),
];

class MobileTestimonials extends StatelessWidget {
  const MobileTestimonials({Key? key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      color: Colors.grey[100],
      child: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text("TESTIMONIALS",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SizedBox(
                  height: 200,
                  width: 550,
                  child: CarouselSlider(
                    options: CarouselOptions(
                      autoPlay: true,
                      aspectRatio: 1.0,
                      enlargeCenterPage: false,
                      pageSnapping: false,
                    ),
                    items: testimonialListMobile,
                  ),
                ),
              ),

            ]
        ),
      ),
    );
  }
}

final List<Widget> testimonialListMobile = [
  SizedBox(
    width: 350,
    child: Card(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for(int i=0;i<5 ; i++)
                const Icon(Icons.star),
            ],
          ),
          const SizedBox(height: 15,),
          const SizedBox(width : 300,child: Center(child: Text("Insert Review1",textAlign: TextAlign.center,))),
          const SizedBox(height: 15,),
          const Column(
            children: [
              Text("Insert Name ",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
              SizedBox(height: 15,),
              Text("Insert Place"),
            ],
          )
        ],
      ),
    ),
  ),
  // const SizedBox(
  //   width: 50,
  // ),
  SizedBox(
    width: 350,

    child: Card(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for(int i=0;i<5 ; i++)
                const Icon(Icons.star),
            ],
          ),
          const SizedBox(height: 15,),
          const SizedBox(width : 300,child: Center(child: Text("Insert Review2",textAlign: TextAlign.center,))),
          const SizedBox(height: 15,),
          const Column(
            children: [
              Text("Insert Name ",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
              SizedBox(height: 15,),
              Text("Insert Place"),
            ],
          )
        ],
      ),
    ),
  ),
  SizedBox(
    width: 350,

    child: Card(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for(int i=0;i<5 ; i++)
                const Icon(Icons.star),
            ],
          ),
          const SizedBox(height: 15,),
          const SizedBox(width : 300,child: Center(child: Text("Insert Review3",textAlign: TextAlign.center,))),
          const SizedBox(height: 15,),

          const Column(
            children: [
              Text("Insert Name ",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
              SizedBox(height: 15,),
              Text("Insert Place"),
            ],
          )
        ],
      ),
    ),
  ),


  SizedBox(
    width: 350,

    child: Card(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for(int i=0;i<5 ; i++)
                const Icon(Icons.star),
            ],
          ),
          const SizedBox(height: 15,),
          const SizedBox(width : 300,child: Center(child: Text("Insert Review4",textAlign: TextAlign.center,))),
          const SizedBox(height: 15,),

          const Column(
            children: [
              Text("Insert Name ",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
              SizedBox(height: 15,),
              Text("Insert Place"),
            ],
          )
        ],
      ),
    ),
  ),
  // const SizedBox(
  //   width: 50,
  // ),
  SizedBox(
    width: 350,

    child: Card(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for(int i=0;i<5 ; i++)
                const Icon(Icons.star),
            ],
          ),
          const SizedBox(height: 15,),
          const SizedBox(width : 300,child: Center(child: Text("Insert Review5",textAlign: TextAlign.center,))),
          const SizedBox(height: 15,),

          const Column(
            children: [
              Text("Insert Name ",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
              SizedBox(height: 15,),
              Text("Insert Place"),
            ],
          )
        ],
      ),
    ),
  ),
  // const SizedBox(
  //   width: 50,
  // ),
  SizedBox(
    width: 350,
    child: Card(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for(int i=0;i<5 ; i++)
                const Icon(Icons.star),
            ],
          ),
          const SizedBox(height: 15,),
          const SizedBox(width : 300,child: Center(child: Text("Insert Review6",textAlign: TextAlign.center,))),
          const SizedBox(height: 15,),
          const Column(
            children: [
              Text("Insert Name ",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
              SizedBox(height: 15,),
              Text("Insert Place"),
            ],
          )
        ],
      ),
    ),
  ),
];