import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class TaskSummaryCard extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
      ),
      child: Card(
        elevation: 1,
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              RichText(
                text: TextSpan(
                  text: 'Good Morning ',
                  style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Izal Fathoni',
                      style: TextStyle(fontWeight: FontWeight.bold)
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      text: 'TODAY \n',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                        height: 1.6
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: DateFormat('dd MMM, yyyy').format(DateTime.now()),
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold
                          )
                        ),
                      ],
                    ),
                  ),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: 'Completed \n',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.green
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: '4/',
                          style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold
                          )
                        ),
                        TextSpan(
                          text: '10',
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold
                          )
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        )
      ),
    );
  }
}
