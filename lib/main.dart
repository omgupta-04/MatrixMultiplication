import 'package:flutter/material.dart';

void main() {
  runApp(MatrixMultiplyApp());
}

class MatrixMultiplyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:'Matrix Multiplier' ,
      home: MatrixMultiplyScreen(),
    );
  }
}

class MatrixMultiplyScreen extends StatefulWidget {
  @override
  _MatrixMultiplyScreenState createState() => _MatrixMultiplyScreenState();
}

class _MatrixMultiplyScreenState extends State<MatrixMultiplyScreen> {
  int s11 = 0, s12 = 0, s13 = 0;
  int s21 = 0, s22 = 0, s23 = 0;
  int s31 = 0, s32 = 0, s33 = 0;

  int t11 = 0, t12 = 0, t13 = 0;
  int t21 = 0, t22 = 0, t23 = 0;
  int t31 = 0, t32 = 0, t33 = 0;

  int p11 = 0, p12 = 0, p13 = 0;
  int p21 = 0, p22 = 0, p23 = 0;
  int p31 = 0, p32 = 0, p33 = 0;

  void updateS(int row, int col) {
    setState(() {
      if (row == 0 && col == 0) {
        s11 = (s11 + 1) % 10;
      } else if (row == 0 && col == 1) {
        s12 = (s12 + 1) % 10;
      } else if (row == 0 && col == 2) {
        s13 = (s13 + 1) % 10;
      } else if (row == 1 && col == 0) {
        s21 = (s21 + 1) % 10;
      } else if (row == 1 && col == 1) {
        s22 = (s22 + 1) % 10;
      } else if (row == 1 && col == 2) {
        s23 = (s23 + 1) % 10;
      } else if (row == 2 && col == 0) {
        s31 = (s31 + 1) % 10;
      } else if (row == 2 && col == 1) {
        s32 = (s32 + 1) % 10;
      } else if (row == 2 && col == 2) {
        s33 = (s33 + 1) % 10;
      }
    });
  }

  void updateT(int row, int col) {
    setState(() {
      if (row == 0 && col == 0) {
        t11 = (t11 + 1) % 10;
      } else if (row == 0 && col == 1) {
        t12 = (t12 + 1) % 10;
      } else if (row == 0 && col == 2) {
        t13 = (t13 + 1) % 10;
      } else if (row == 1 && col == 0) {
        t21 = (t21 + 1) % 10;
      } else if (row == 1 && col == 1) {
        t22 = (t22 + 1) % 10;
      } else if (row == 1 && col == 2) {
        t23 = (t23 + 1) % 10;
      } else if (row == 2 && col == 0) {
        t31 = (t31 + 1) % 10;
      } else if (row == 2 && col == 1) {
        t32 = (t32 + 1) % 10;
      } else if (row == 2 && col == 2) {
        t33 = (t33 + 1) % 10;
      }
    });
  }

  void multiplyMatrices() {
    setState(() {
      p11 = s11 * t11 + s12 * t21 + s13 * t31;
      p12 = s11 * t12 + s12 * t22 + s13 * t32;
      p13 = s11 * t13 + s12 * t23 + s13 * t33;

      p21 = s21 * t11 + s22 * t21 + s23 * t31;
      p22 = s21 * t12 + s22 * t22 + s23 * t32;
      p23 = s21 * t13 + s22 * t23 + s23 * t33;

      p31 = s31 * t11 + s32 * t21 + s33 * t31;
      p32 = s31 * t12 + s32 * t22 + s33 * t32;
      p33 = s31 * t13 + s32 * t23 + s33 * t33;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Matrix Multiplier'),
      ),
      backgroundColor: Colors.grey[200], // Change background color
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 40), // Increase spacing
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    _buildMatrixCell(s11, 0, 0, updateS),
                    _buildMatrixCell(s21, 1, 0, updateS),
                    _buildMatrixCell(s31, 2, 0, updateS),
                  ],
                ),
                SizedBox(width: 20),
                Column(
                  children: [
                    _buildMatrixCell(s12, 0, 1, updateS),
                    _buildMatrixCell(s22, 1, 1, updateS),
                    _buildMatrixCell(s32, 2, 1, updateS),
                  ],
                ),
                SizedBox(width: 20),
                Column(
                  children: [
                    _buildMatrixCell(s13, 0, 2, updateS),
                    _buildMatrixCell(s23, 1, 2, updateS),
                    _buildMatrixCell(s33, 2, 2, updateS),
                  ],
                ),
                SizedBox(width: 40), // Increase spacing
                Column(
                  children: [
                    Text("x", style: TextStyle(fontSize: 30)),
                  ],
                ),
                SizedBox(width: 40), // Increase spacing
                Column(
                  children: [
                    _buildMatrixCell(t11, 0, 0, updateT),
                    _buildMatrixCell(t21, 1, 0, updateT),
                    _buildMatrixCell(t31, 2, 0, updateT),
                  ],
                ),
                SizedBox(width: 20),
                Column(
                  children: [
                    _buildMatrixCell(t12, 0, 1, updateT),
                    _buildMatrixCell(t22, 1, 1, updateT),
                    _buildMatrixCell(t32, 2, 1, updateT),
                  ],
                ),
                SizedBox(width: 20),
                Column(
                  children: [
                    _buildMatrixCell(t13, 0, 2, updateT),
                    _buildMatrixCell(t23, 1, 2, updateT),
                    _buildMatrixCell(t33, 2, 2, updateT),
                  ],
                ),
              ],
            ),
            SizedBox(height: 40), // Increase spacing
            ElevatedButton(
              onPressed: multiplyMatrices,
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.white12),),
              child: Text('Multiply'),
            ),
            SizedBox(height: 20), // Increase spacing
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text("$p11", style: TextStyle(fontSize: 40)),
                    Text("$p21", style: TextStyle(fontSize: 40)),
                    Text("$p31", style: TextStyle(fontSize: 40)),
                  ],
                ),
                SizedBox(width: 20),
                Column(
                  children: [
                    Text("$p12", style: TextStyle(fontSize: 40)),
                    Text("$p22", style: TextStyle(fontSize: 40)),
                    Text("$p32", style: TextStyle(fontSize: 40)),
                  ],
                ),
                SizedBox(width: 20),
                Column(
                  children: [
                    Text("$p13", style: TextStyle(fontSize: 40)),
                    Text("$p23", style: TextStyle(fontSize: 40)),
                    Text("$p33", style: TextStyle(fontSize: 40)),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMatrixCell(int value, int row, int col, Function(int, int) onPressed) {
    return GestureDetector(
      onTap: () => onPressed(row, col),
      child: Container(
        width: 30, // Increase size for better spacing
        height: 30, // Increase size for better spacing
        decoration: BoxDecoration(
          border: Border.all(),
        ),
        child: Center(
          child: Text(
            value.toString(),
            style: TextStyle(fontSize: 25),
          ),
        ),
      ),
    );
  }
}