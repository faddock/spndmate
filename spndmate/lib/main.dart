import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SpndMate',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.indigo,
        appBarTheme: AppBarTheme(
          backgroundColor: Color.fromARGB(255, 78, 125, 236), // Set the app bar color
        ),
      ),
      home: MyHomePage(title: 'SpndMate'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    Center(child: Text('Spending', style: TextStyle(color: Colors.white))),
    Center(child: Text('Profile', style: TextStyle(color: Colors.white))),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<String> purchases = ['Item 1', 'Item 2', 'Item 3'];

  final Map<String, double> spendingCategories = {
    'Groceries': 150.00,
    'Restaurant': 50.00,
    'Entertainment': 50.00,
    'Electricity': 100.20,
    'Grand Total': 300.20
  };

  final Map<String, double> accounts = {
    'VENMO': 57.00,
    'CashApp': 20.00,
    'PNC': 1089.17,
    'CHASE': 400.20
  };

    final Map<String, double> dues = {
    'You Lent': 100.00,
    'You Owe': 0.00,
    'Total Balance': 100.00,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          width: 250,  // Adjust width as needed
          child: Image.asset('./images/Spndmate-logos_white.png', fit: BoxFit.cover),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Custom progress bar
          Container(
            child: Stack(
              children: [
                LinearProgressIndicator(
                  value: 0.7, // Fill halfway
                  backgroundColor: Color.fromARGB(255, 170, 226, 194),
                  valueColor: AlwaysStoppedAnimation<Color>(Color.fromARGB(255, 65, 193, 121)),
                  minHeight: 45, // Set the thickness of the progress bar
                ),
                Container(
                  child: Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back_ios_rounded, size: 17.0),
                        onPressed: () {
                          // Handle backward navigation
                        },
                      ),
                      Text('Jan 1', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15)),
                      Spacer(),  // Pushes the elements to the ends
                      Text('Monthly', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15)),
                      Spacer(),  // Pushes the elements to the ends
                      Text('Jan 31', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15)),
                      IconButton(
                        icon: Icon(Icons.arrow_forward_ios_rounded, size: 17.0),
                        onPressed: () {
                          // Handle forward navigation
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Table(
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: [
              TableRow(
                children: [
                  Center(child: Text('Expected Spending', style: TextStyle(color: Colors.black, fontSize: 15))),
                ],
              ),
              TableRow(
                children: [
                  Center(child: Text('\$280.20', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 30))),
                ],
              ),
            ],
          ),
          // Divider(color: Colors.white, thickness: 0), 
          Table(
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: [
              TableRow(
                children: [
                  Center(child: Text('Real Spending', style: TextStyle(color: Colors.black, fontSize: 15))),
                  Center(child: Text('You Owe', style: TextStyle(color: Colors.black, fontSize: 15))),
                ],
              ),
              TableRow(
                children: [
                  Center(child: Text('\$300.20', style: TextStyle(color: Colors.green, fontWeight: FontWeight.w500,fontSize: 25))),
                  Center(child: Text('\$20.00', style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.w500, fontSize: 25))),
                ],
              ),
            ],
          ),
          Divider(color: Colors.white, thickness: 0), 
          // Spending ExpansionTile
          ExpansionTile(
            title: Text('CATEGORIES'),
            children: spendingCategories.keys.map((String key) {
              return ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('$key'),
                    Row(
                      children: <Widget>[
                        Text('\$${spendingCategories[key]}'),
                        Icon(Icons.more_vert)
                      ],
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
          ExpansionTile(
            title: Text('ACCOUNTS'),
            children: accounts.keys.map((String key) {
              return ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('$key'),
                    Row(
                      children: <Widget>[
                        Text('\$${accounts[key]}'),
                        Icon(Icons.more_vert)
                      ],
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
          ExpansionTile(
            title: Text('TOTAL DUES'),
            children: dues.keys.map((String key) {
              return ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('$key'),
                    Row(
                      children: <Widget>[
                        Text('\$${dues[key]}'),
                        Icon(Icons.more_vert)
                      ],
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
          // Placeholder for other content
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
            child: Text(
              'January 2024',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),

          
          Expanded(child: _widgetOptions.elementAt(_selectedIndex)),
        ],
      ),
      
      


      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Spending',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2),
            label: 'Account',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
        backgroundColor: Colors.indigo,
      ),
    );
  }
}
