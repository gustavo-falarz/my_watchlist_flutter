import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mywatchlist/model/content_data.dart';
import 'package:provider/provider.dart';

class BaseContainer extends StatefulWidget {
  final Widget child;

  const BaseContainer({@required this.child});

  @override
  _BaseContainerState createState() => _BaseContainerState();
}

class _BaseContainerState extends State<BaseContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          widget.child,
          Visibility(
            visible: Provider.of<ContentData>(context).progressVisible,
            child: Container(
              color: Color(0x80212121),
              child: Center(
                child: SpinKitFoldingCube(
                  color: Colors.white,
                  size: 50.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
