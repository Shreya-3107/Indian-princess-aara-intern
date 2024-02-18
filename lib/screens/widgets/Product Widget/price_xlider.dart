import 'package:flutter/material.dart';



class PriceXlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PriceRange(),
    );
  }
}

class PriceRange extends StatefulWidget {
  @override
  _PriceRangeState createState() => _PriceRangeState();
}

class _PriceRangeState extends State<PriceRange> {
  RangeValues _selectedRange = RangeValues(20, 80);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: RangeSlider(
                values: _selectedRange,
                min: 0,
                max: 10000,
                onChanged: (newRange) {
                  setState(() {
                    _selectedRange = newRange;
                  });
                },
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Selected Range: ${_selectedRange.start.round()} - ${_selectedRange.end.round()}',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
