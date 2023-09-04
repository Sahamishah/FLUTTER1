import 'package:flutter/material.dart';

class ProfileIconScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Text(
          'This is the profile screen',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Text(
          'This is the chat screen',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile and Chat Icon Example',
      theme: ThemeData.dark(),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // ignore: prefer_typing_uninitialized_variables
  List tasks = [
    {"name": "task1", "uploadedDate": "2023-08-31"},
    {"name": "task2", "uploadedDate": "2023-09-01"}
  ];
  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
      ),
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Your Tasks',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  CustomToggleButtons(),
                ],
              ),
              SizedBox(height: 20),
              Expanded(
                child: ListView.separated(
                  itemCount: tasks.length,
                  separatorBuilder: (context, index) =>
                      Divider(color: Colors.grey),
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(tasks[index]["name"]),
                      subtitle:
                          Text("Uploaded on: ${tasks[index]["uploadedDate"]}"),
                      trailing: IconButton(
                        icon: Icon(Icons.info),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TaskDetailsPage(
                                taskName: tasks[index]["name"],
                                taskDescription:
                                    'Description for ${tasks[index]["name"]}', // Add the description here
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.topLeft,
          children: [
            Positioned(
              top: 150, // Adjust the position as needed
              left: 0,
              right: 0,
              child: DateScrollWidget(), // Add the DateScrollWidget here
            ),
            Positioned(
              top: 20,
              left: 20,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProfileIconScreen()),
                  );
                },
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue,
                  ),
                  child: Icon(
                    Icons.person,
                    size: 40,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 20,
              right: 20,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ChatScreen()),
                  );
                },
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.green,
                  ),
                  child: Icon(
                    Icons.chat,
                    size: 40,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 30,
              left: 90,
              child: Text(
                'Welcome Buddy!\nExplore Tasks',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: GestureDetector(
                onTap: () {
                  _showBottomSheet(context);
                },
                child: Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(16),
                  child: Center(
                    child: Text(
                      'Tasks',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w800),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomToggleButtons extends StatefulWidget {
  @override
  _CustomToggleButtonsState createState() => _CustomToggleButtonsState();
}

class _CustomToggleButtonsState extends State<CustomToggleButtons> {
  List<bool> isSelected = [true, false];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(20),
          right: Radius.circular(20),
        ),
        color: const Color.fromARGB(255, 238, 238, 238),
      ),
      child: ToggleButtons(
        isSelected: isSelected,
        onPressed: (index) {
          setState(() {
            isSelected[index] = !isSelected[index];
            isSelected[(index + 1) % 2] = !isSelected[(index + 1) % 2];
          });
        },
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(20),
          right: Radius.circular(20),
        ),
        selectedColor: Colors.black,
        color: const Color.fromARGB(255, 0, 0, 0),
        children: [
          Container(
            width: 80,
            alignment: Alignment.center,
            child: Text('Availed'),
          ),
          Container(
            width: 80,
            alignment: Alignment.center,
            child: Text('Unavailed'),
          ),
        ],
      ),
    );
  }
}

class TaskDetailsPage extends StatelessWidget {
  final String taskName;
  final String taskDescription;

  TaskDetailsPage({required this.taskName, required this.taskDescription});
  void _startDeveloping(BuildContext context) {
    // Add your logic here for what should happen when the button is pressed.
    // You can navigate to another screen or perform any other action.
    // For example, you can show a dialog or navigate to a development screen.
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Start Developing'),
          content: Text('You clicked the "Start Developing" button.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog.
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Task Name: $taskName',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Task Description: $taskDescription',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 50),
              // Add the "Start Developing" button.
              ElevatedButton(
                onPressed: () {
                  _startDeveloping(context);
                },
                child: Text('Start Developing'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MyApp1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Date Scroll Widget')),
        body: DateScrollWidget(),
      ),
    );
  }
}

class DateScrollWidget extends StatelessWidget {
  final int numberOfDates = 15; // Adjust the number of dates as needed
  final double containerWidth = 80.0;
  final double borderRadius = 50.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 175, // Adjust the height as needed
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: numberOfDates,
        itemBuilder: (context, index) {
          int middleIndex = numberOfDates ~/ 2;
          int dayDifference = index - middleIndex;
          DateTime currentDate =
              DateTime.now().add(Duration(days: dayDifference));
          String date = currentDate.day.toString();

          Color backgroundColor = dayDifference == 0
              ? Colors.blue // Present date
              : Colors.grey; // Other dates

          return Container(
            width: containerWidth,
            margin: EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(borderRadius),
              gradient: dayDifference == 0
                  ? LinearGradient(
                      colors: [Colors.blue, Colors.lightBlue],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    )
                  : null,
            ),
            child: Center(
              child: Text(
                date,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
