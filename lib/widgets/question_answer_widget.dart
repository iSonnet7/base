import 'package:flutter/material.dart';

class OptionTile extends StatefulWidget {
  final String option, optionSelected, description;

  OptionTile(
      {required this.description,
      required this.option,
      required this.optionSelected});

  @override
  _OptionTileState createState() => _OptionTileState();
}

class _OptionTileState extends State<OptionTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          Container(
            height: 28,
            width: 28,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                border: Border.all(
                    color: widget.optionSelected == widget.description
                        //Borde
                        ? Colors.grey.withOpacity(0.7) //Final
                        : Colors.grey.withOpacity(0.7), //Inicial
                    width: 1.5),
                color: widget.optionSelected == widget.description
                    //Relleno del circulo
                    ? Colors.grey //Final
                    : Colors.white, //Inicial
                borderRadius: BorderRadius.circular(24)),
            child: Text(
              widget.option,
              style: TextStyle(
                color: widget.optionSelected == widget.description
                    //Incisos
                    ? Colors.grey.withOpacity(0.7) //Final
                    : Colors.white, //Inicial
              ),
            ),
          ),
          SizedBox(
            width: 8,
          ),
          Text(
            widget.description,
            style:
                TextStyle(fontSize: 17, color: Colors.black.withOpacity(0.7)),
          )
        ],
      ),
    );
  }
}
