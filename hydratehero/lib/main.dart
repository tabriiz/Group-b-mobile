import 'dart:io'; // Import dart:io to use the File class
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart'; 


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Matikan banner debug
      title: 'HydrateHero',
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 177, 137, 150),
        scaffoldBackgroundColor: Colors.pink.shade50,
        textTheme: const TextTheme(
          displayLarge: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Colors.black),
          bodyLarge: TextStyle(fontSize: 16, color: Colors.black),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginSignUpScreen(),
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => SignUpScreen(),
        '/personalize': (context) => const PersonalizeScreen(),
        '/daily_water_intake': (context) => const DailyWaterIntakeScreen(),
        '/home': (context) => const HomeScreen(),
        '/menu': (context) => const MenuScreen(),
        '/add_bottle': (context) => const AddBottleScreen(),
        '/goal_tracker': (context) => const GoalTrackerScreen(),
        '/mode': (context) => const ModeScreen(),
        '/reward': (context) => const RewardScreen(),
        '/settings': (context) => const SettingsScreen(),
        '/about-us': (context) => const AboutUsScreen(),
        '/general': (context) => const GeneralScreen(),
        '/language': (context) => const SelectLanguageScreen(),
        '/time-settings': (context) => const TimeSettingScreen(),
        '/help-center': (context) => const HelpCenterScreen(),
        '/notifications': (context) => const NotificationSettingsScreen(),
        '/profile': (context) => const ProfileScreen(),
      },
    );
  }
}

class LoginSignUpScreen extends StatelessWidget {
  const LoginSignUpScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 255, 224, 235),
              Color.fromARGB(255, 243, 146, 176),
              Color.fromARGB(255, 242, 146, 185)
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "HydrateHero",
              style: Theme.of(context).textTheme.displayLarge?.copyWith(color: Colors.white),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 120), // Menambah jarak lebih lebar antara teks dan tombol
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.pinkAccent,
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16), // Padding lebih besar pada tombol
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                "Log in to your account",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            const SizedBox(height: 24), // Menambah jarak antara tombol pertama dan tombol kedua
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/signup');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.pinkAccent,
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16), // Padding lebih besar pada tombol
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                "Sign up for free account",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SignUpScreen extends StatelessWidget {

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // SizedBox untuk memberikan jarak dengan AppBar
            const SizedBox(height: 16),
            const Text(
              "Sign up your account",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 66, 65, 66),
              ),
            ),
            const SizedBox(height: 32),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: "Your Name"),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: "Email"),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: "Password"),
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                // Tindakan tombol, bisa diarahkan ke layar berikutnya
                Navigator.pushNamed(context, '/personalize');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 247, 182, 204),
                foregroundColor: const Color.fromARGB(255, 66, 65, 66), // Ubah warna teks tombol jadi abu-abu
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text("Sign up"),
            ),
          ],
        ),
      ),
    );
  }
}


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            const Text(
              "Log into your account",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 66, 65, 66),),
            ),
            const SizedBox(height: 32),
            const TextField(
              decoration: InputDecoration(labelText: "Username/Email"),
            ),
            const SizedBox(height: 16),
            const TextField(
              obscureText: true,
              decoration: InputDecoration(labelText: "Password"),
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/home');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 247, 182, 204),
                foregroundColor: const Color.fromARGB(255, 66, 65, 66),
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text("Log in"),
            ),
          ],
        ),
      ),
    );
  }
}

class PersonalizeScreen extends StatelessWidget {
  const PersonalizeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Personalize",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              "Know your daily water intake",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            const TextField(
              decoration: InputDecoration(labelText: "Age"),
            ),
            const SizedBox(height: 16),
            const TextField(
              decoration: InputDecoration(labelText: "Gender"),
            ),
            const SizedBox(height: 16),
            const TextField(
              decoration: InputDecoration(labelText: "Height"),
            ),
            const SizedBox(height: 16),
            const TextField(
              decoration: InputDecoration(labelText: "Weight"),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/daily_water_intake');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 247, 182, 204),
                foregroundColor: const Color.fromARGB(255, 66, 65, 66),
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text("Save"),
            ),
          ],
        ),
      ),
    );
  }
}
class DailyWaterIntakeScreen extends StatelessWidget {
  const DailyWaterIntakeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 255, 224, 235),
              Color.fromARGB(255, 243, 146, 176),
              Color.fromARGB(255, 242, 146, 185)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Your daily water intake",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 50),
              Stack(
                alignment: Alignment.center,
                children: [
                    // Lingkaran di belakang teks
                    Container(
                    width: 180, // Ukuran lingkaran
                    height: 150,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color.fromARGB(255, 248, 242, 245), // Warna lingkaran
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                  ),
                  // Teks "2000 ml"
                  const Text(
                    "2000 ml",
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/home');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 242, 224, 232),
                  foregroundColor: const Color.fromARGB(255, 81, 81, 81),
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
                child: const Text("Start Tracking",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300))
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Hello, Alya",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.pink.shade100,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.black),
          onPressed: () {
            Navigator.pushNamed(context, '/menu');
          },
        ),
      ),
      body: Container(
        color: Colors.pink.shade50,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Circular Water Progress Indicator
              Container(
                width: 180, // Ukuran lingkaran lebih besar
                height: 200,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromARGB(255, 249, 190, 211), // Warna solid tanpa gradasi
                ),
                child: const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "1300",
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        "/ 2000 mL",
                        style: TextStyle(fontSize: 16, color: Colors.black54),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Capacity and Temperature Row
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _InfoCard(
                    title: "Capacity",
                    value: "200 / 1000 mL",
                  ),
                  _InfoCard(
                    title: "Temperature",
                    value: "22°C",
                  ),
                ],
              ),
              const SizedBox(height: 30),
              // Daily Mode Button
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/mode');
                },
                child: const _ActionCard(
                  title: "Daily Mode",
                  icon: Icons.arrow_forward_ios,
                ),
              ),
              const SizedBox(height: 20),
              // Reward Button
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/reward');
                },
                child: const _ActionCard(
                  title: "50 Points",
                  icon: Icons.star,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Widget untuk menampilkan kartu info seperti Capacity dan Temperature
class _InfoCard extends StatelessWidget {
  final String title;
  final String value;

  const _InfoCard({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        minWidth: 150, // Lebar minimum untuk menyamakan ukuran
        minHeight: 100, // Tinggi minimum
      ),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.pink.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16, color: Colors.black54),
          ),
          const SizedBox(height: 15),
          Text(
            value,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

// Widget untuk tombol aksi seperti Daily Mode dan Reward
class _ActionCard extends StatelessWidget {
  final String title;
  final IconData icon;

  const _ActionCard({required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.pink.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16, color: Colors.black),
          ),
          const SizedBox(height: 20),
          Icon(icon, color: Colors.black),
        ],
      ),
    );
  }
}

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: const [
          MenuItem(title: "Add Bottle", route: '/add_bottle'),
          MenuItem(title: "Goal Tracker", route: '/goal_tracker'),
          MenuItem(title: "Mode", route: '/mode'),
          MenuItem(title: "Reward", route: '/reward'), // Tambahkan screen reward jika sudah ada
          MenuItem(title: "Settings", route: '/settings'), // Tambahkan screen settings jika sudah ada
        ],
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final String title;
  final String route;

  const MenuItem({super.key, required this.title, required this.route});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () {
        Navigator.pushNamed(context, route);
      },
    );
  }
}

class AddBottleScreen extends StatelessWidget {
  const AddBottleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Warna latar belakang AppBar
        elevation: 0, // Menghilangkan bayangan AppBar
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black), // Ikon back
          onPressed: () {
            Navigator.pop(context); // Navigasi kembali ke layar sebelumnya
          },
        ),
        title: const Text(
          "Add Your Bottle",
          style: TextStyle(color: Colors.black), // Warna teks AppBar
        ),
        centerTitle: true, // Pusatkan judul
      ),
      body: Stack(
        children: [
          // Background warna pink
          Container(
            color: Colors.pink.shade50, // Warna pink untuk background
          ),
          // Konten utama
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Logika tombol tambah botol
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Bottle added successfully!"),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 183, 181, 180), // Warna tombol
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  child: const Text(
                    "Add Bottle",
                    style: TextStyle(fontSize: 18, color: Colors.black), // Warna teks
                  ),
                ),
                const SizedBox(height: 25),
                ElevatedButton(
                  onPressed: () {
                    // Implementasi Bluetooth Connectivity
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Bluetooth Connectivity tapped!"),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 224, 159, 181),
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  child: const Text(
                    "Bluetooth Connectivity",
                    style: TextStyle(fontSize: 18, color: Colors.black), // Warna teks
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class GoalTrackerScreen extends StatefulWidget {
  const GoalTrackerScreen({super.key});

  @override
  GoalTrackerScreenState createState() => GoalTrackerScreenState();
}

class GoalTrackerScreenState extends State<GoalTrackerScreen> {
  double percentage = 0.25; // Placeholder nilai dari backend

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Goal Tracker"),
        backgroundColor: Colors.transparent,
        elevation: 0, // Menghilangkan bayangan AppBar
        foregroundColor: Colors.black, // Warna teks AppBar
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Mengurangi jarak dari AppBar ke lingkaran
            const SizedBox(height: 15),
            // Lingkaran dengan persentase
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.pink.shade100, // Warna lingkaran
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: Text(
                "${(percentage * 100).toStringAsFixed(1)}%",
                style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // Warna teks persentase
                ),
              ),
            ),
            const SizedBox(height: 40),
            // Input field untuk menambahkan air secara manual
            TextField(
              decoration: const InputDecoration(
                labelText: "Input Water Manually (ml)",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              onSubmitted: (value) {
                final input = int.tryParse(value) ?? 0;
                log("Water manually added: $input ml", name: "GoalTracker");
              },
            ),
            const SizedBox(height: 30),
            // Tombol update progress
            ElevatedButton(
              onPressed: () {
                setState(() {
                  percentage = 0.5; // Simulasi perubahan progress
                });
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 183, 181, 180), // Warna latar tombol
                  foregroundColor: Colors.black, // Warna teks tombol
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text("Update Progress"),
            ),
          ],
        ),
      ),
    );
  }
}

class ModeScreen extends StatefulWidget {
  const ModeScreen({super.key});

  @override
  ModeScreenState createState() => ModeScreenState();
}

class ModeScreenState extends State<ModeScreen> {
  String selectedMode = "Daily";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mode"),
        backgroundColor: Colors.transparent,
        elevation: 0, // Menghilangkan bayangan AppBar
        foregroundColor: Colors.black, // Warna teks AppBar
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Kartu untuk mode Daily
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              color: selectedMode == "Daily" ? Colors.pink.shade100 : Colors.white,
              elevation: 5,
              child: ListTile(
                title: const Text("Daily"),
                subtitle: const Text(
                  "Customize your water intake for everyday needs. This mode will set a target of around 2 liters of water per day, ideal for light to moderate activities.",
                ),
                leading: Radio<String>(
                  value: "Daily",
                  groupValue: selectedMode,
                  onChanged: (value) {
                    setState(() {
                      selectedMode = value!;
                      // Kirim perubahan mode ke backend
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Kartu untuk mode Sport
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              color: selectedMode == "Sport" ? Colors.pink.shade100 : Colors.white,
              elevation: 5,
              child: ListTile(
                title: const Text("Sport"),
                subtitle: const Text(
                  "Get an extra boost to stay hydrated during your workouts. This mode will increase your water target to around 3-4 liters per day, helping to replenish fluids lost through sweat.",
                ),
                leading: Radio<String>(
                  value: "Sport",
                  groupValue: selectedMode,
                  onChanged: (value) {
                    setState(() {
                      selectedMode = value!;
                      // Kirim perubahan mode ke backend
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RewardScreen extends StatefulWidget {
  const RewardScreen({super.key});

  @override
  RewardScreenState createState() => RewardScreenState();
}

class RewardScreenState extends State<RewardScreen> {
  int currentPoints = 50; // Poin saat ini, misalnya dimulai dari 50

  void addPoints(int points) {
    setState(() {
      currentPoints += points; // Menambah poin
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Reward"),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Card untuk menampilkan poin yang dimiliki (lebih kecil)
            Card(
              color: Colors.pink.shade100,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(10.0), // Padding lebih kecil
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center, // Pusatkan konten secara horizontal
                  children: [
                    const Icon(
                      Icons.star, // Ikon bintang
                      color: Color.fromARGB(255, 5, 5, 5),
                      size: 28, // Ukuran ikon
                    ),
                    const SizedBox(width: 8), // Spasi antara ikon dan teks
                    Text(
                      "$currentPoints Points", // Teks poin
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 15),
            const Text(
              "Challenges",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500, color: Colors.black),
            ),
            const SizedBox(height: 8),
            // Horizontal scrolling for Challenges
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _ChallengeCard(
                    title: "Daily",
                    description: "Drink 2L of water daily to maintain hydration. Let's make it a habit!",
                  ),
                  SizedBox(width: 16),
                  _ChallengeCard(
                    title: "Weekly",
                    description: "Drink 14L in a week to stay consistent with hydration. Keep up the great work!",
                  ),
                  SizedBox(width: 16),
                  _ChallengeCard(
                    title: "Monthly",
                    description: "Maintain a consistent daily water intake for a full month to unlock exclusive rewards. Stay hydrated, stay healthy!",
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              "Rewards",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500, color: Colors.black),
            ),
            const SizedBox(height: 8),
            // Vertical scrolling for Rewards
            Expanded(
              child: ListView(
                children: [
                  _RewardItem(streak: "1 Month", points: 50, addPoints: addPoints),
                  _RewardItem(streak: "3 Months", points: 250, addPoints: addPoints),
                  _RewardItem(streak: "6 Months", points: 500, addPoints: addPoints),
                  _RewardItem(streak: "1 Year", points: 1000, addPoints: addPoints),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ChallengeCard extends StatelessWidget {
  final String title;
  final String description;

  const _ChallengeCard({required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      color: Colors.pink.shade100,
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(12.0), // Padding lebih kecil
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: const TextStyle(fontSize: 14, color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }
}

class _RewardItem extends StatelessWidget {
  final String streak;
  final int points;
  final Function(int) addPoints;

  const _RewardItem({required this.streak, required this.points, required this.addPoints});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.pink.shade100, // Warna card reward berbeda dengan background
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 5,
      child: ListTile(
        title: Text(
          "Successfully completed $streak streak",
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        subtitle: Text("$points Points"),
        trailing: IconButton(
          icon: const Icon(Icons.add_circle, color: Colors.pinkAccent),
          onPressed: () {
            // Menambahkan poin ke total poin
            addPoints(points);
            // Tampilkan pesan konfirmasi
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("+$points points added for completing $streak streak!")),
            );
          },
        ),
      ),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const _SettingsItem(
            title: "General",
            route: '/general',
          ),
          const _SettingsItem(
            title: "Notifications",
            route: '/notifications', // Future screen
          ),
          const _SettingsItem(
            title: "Profile",
            route: '/profile', // Future screen
          ),
          ListTile(
            title: const Text(
              "Log Out",
              style: TextStyle(fontSize: 18, color: Colors.red),
            ),
            trailing: const Icon(Icons.exit_to_app, color: Colors.red),
            onTap: () {
              // Handle log out logic
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const LoginSignUpScreen()),
                (route) => false, // Clear all previous routes
              );
            },
          ),
        ],
      ),
    );
  }
}

// Widget for reusable settings item
class _SettingsItem extends StatelessWidget {
  final String title;
  final String route;

  const _SettingsItem({required this.title, required this.route});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () {
        Navigator.pushNamed(context, route);
      },
    );
  }
}

class GeneralScreen extends StatelessWidget {
  const GeneralScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("General"),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: const [
          _GeneralItem(
            title: "About Us",
            route: '/about-us',
          ),
           _GeneralItem(
            title: "Language",
            route: '/language', // Future screen
          ),
           _GeneralItem(
            title: "Time Settings",
            route: '/time-settings', // Future screen
          ),
           _GeneralItem(
            title: "Help Center",
            route: '/help-center',
           ),
        ],
      ),
    );
  }
}

class _GeneralItem extends StatelessWidget {
  final String title;
  final String route;

  const _GeneralItem({required this.title, required this.route});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () {
        Navigator.pushNamed(context, route);
      },
    );
  }
}

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About Us"),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.pink.shade50,
            borderRadius: BorderRadius.circular(16),
          ),
          child: const Text(
            "HydrateHero is your go-to companion for a healthier you. With intuitive tracking and flexible reminders, we make staying hydrated easy and enjoyable.\n\n"
            "Feel the difference: increased energy, sharper focus, and improved well-being. Stay motivated with daily challenges and get the reward. Customize your reminders to fit your schedule and preferences.\n\n"
            "Download HydrateHero today and start your hydration journey!",
            style: TextStyle(fontSize: 16, color: Colors.black87),
          ),
        ),
      ),
    );
  }
}

class SelectLanguageScreen extends StatefulWidget {
  const SelectLanguageScreen({super.key});

  @override
  SelectLanguageScreenState createState() => SelectLanguageScreenState();
}

class SelectLanguageScreenState extends State<SelectLanguageScreen> {
  String _selectedLanguage = "English"; // Default bahasa

  void _selectLanguage(String language) {
    setState(() {
      _selectedLanguage = language; // Perbarui bahasa yang dipilih
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Language"),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _LanguageOption(
              language: "English",
              isSelected: _selectedLanguage == "English",
              onTap: () => _selectLanguage("English"),
            ),
            const SizedBox(height: 16),
            _LanguageOption(
              language: "Indonesian",
              isSelected: _selectedLanguage == "Indonesian",
              onTap: () => _selectLanguage("Indonesian"),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // Simpan bahasa yang dipilih atau kirim ke server
                log("Bahasa dipilih: $_selectedLanguage", name: "AppLanguage");
                Navigator.pop(context); // Kembali ke layar sebelumnya
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 142, 141, 142),
                foregroundColor: const Color.fromARGB(255, 247, 246, 246),
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: const Text(
                "Confirm",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LanguageOption extends StatelessWidget {
  final String language;
  final bool isSelected;
  final VoidCallback onTap;

  const _LanguageOption({
    required this.language,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        decoration: BoxDecoration(
          color: Colors.pink.shade50,
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: isSelected ? Colors.pink.shade100 : Colors.transparent,
            width: 2.0,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              language,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            if (isSelected)
              const Icon(
                Icons.check,
                color: Color.fromARGB(255, 220, 115, 152) ,
              ),
          ],
        ),
      ),
    );
  }
}

class TimeSettingScreen extends StatefulWidget {
  const TimeSettingScreen({super.key});

  @override
  TimeSettingScreenState createState() => TimeSettingScreenState();
}

class TimeSettingScreenState extends State<TimeSettingScreen> {
  // Default time ranges
  TimeOfDay morningStart = const TimeOfDay(hour: 5, minute: 0);
  TimeOfDay morningEnd = const TimeOfDay(hour: 12, minute: 0);
  TimeOfDay afternoonStart = const TimeOfDay(hour: 12, minute: 0);
  TimeOfDay afternoonEnd = const TimeOfDay(hour: 18, minute: 0);
  TimeOfDay nightStart = const TimeOfDay(hour: 18, minute: 0);
  TimeOfDay nightEnd = const TimeOfDay(hour: 5, minute: 0);

  // Method to format TimeOfDay as a string
  String formatTime(TimeOfDay time) {
    final hours = time.hour.toString().padLeft(2, '0');
    final minutes = time.minute.toString().padLeft(2, '0');
    return "$hours:$minutes";
  }

  Future<void> pickTimeRange(
  BuildContext context, 
  String title, 
  Function(TimeOfDay, TimeOfDay) onSelected
  ) async {
    // Ensure widget is mounted before proceeding
    if (!mounted) return;

    // Pick start time, ensure we are still mounted after this async gap
    final TimeOfDay? startTime = await showTimePicker(
      context: context,
      initialTime: const TimeOfDay(hour: 0, minute: 0),
    );

    // If widget is unmounted or startTime is null, return early
    if (startTime == null || !mounted) return;

    // Pick end time, make sure to check if the widget is still mounted
    final TimeOfDay? endTime = await showTimePicker(
      context: context,
      initialTime: startTime,
    );

    // Only proceed if both times are valid and widget is still mounted
    if (endTime != null && mounted) {
      onSelected(startTime, endTime);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Time Settings"),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Card untuk pengaturan waktu pagi
          Card(
            color: Colors.pink.shade50,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            elevation: 5,
            child: ListTile(
              title: const Text(
                "Morning",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                "${formatTime(morningStart)} - ${formatTime(morningEnd)}",
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
              onTap: () {
                pickTimeRange(
                  context,
                  "Set Morning Time",
                  (start, end) {
                    setState(() {
                      morningStart = start;
                      morningEnd = end;
                    });
                  },
                );
              },
            ),
          ),
          const SizedBox(height: 16),
          // Card untuk pengaturan waktu siang
          Card(
            color: Colors.pink.shade50,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            elevation: 5,
            child: ListTile(
              title: const Text(
                "Afternoon",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                "${formatTime(afternoonStart)} - ${formatTime(afternoonEnd)}",
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
              onTap: () {
                pickTimeRange(
                  context,
                  "Set Afternoon Time",
                  (start, end) {
                    setState(() {
                      afternoonStart = start;
                      afternoonEnd = end;
                    });
                  },
                );
              },
            ),
          ),
          const SizedBox(height: 16),
          // Card untuk pengaturan waktu malam
          Card(
            color: Colors.pink.shade50,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            elevation: 5,
            child: ListTile(
              title: const Text(
                "Night",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                "${formatTime(nightStart)} - ${formatTime(nightEnd)}",
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
              onTap: () {
                pickTimeRange(
                  context,
                  "Set Night Time",
                  (start, end) {
                    setState(() {
                      nightStart = start;
                      nightEnd = end;
                    });
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}


class HelpCenterScreen extends StatelessWidget {
  const HelpCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Help Center"),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.pink.shade50,
            borderRadius: BorderRadius.circular(16),
          ),
          child: const Text(
            "Welcome to the Help Center! If you encounter any issues or have any questions about using HydrateHero, feel free to reach out to our support team. We're here to help!",
            style: TextStyle(fontSize: 16, color: Colors.black87),
          ),
        ),
      ),
    );
  }
}

class NotificationSettingsScreen extends StatefulWidget {
  const NotificationSettingsScreen({super.key});

  @override
  NotificationSettingsScreenState createState() => NotificationSettingsScreenState();
}

class NotificationSettingsScreenState extends State<NotificationSettingsScreen> {
  bool soundEnabled = true;
  bool notificationsEnabled = true;
  String maxReminders = "How Many Per Day";
  String remindWhen = "Always Remind Me";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifications"),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Card for Sound
            Card(
              color: Colors.pink.shade100,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              elevation: 5,
              child: SwitchListTile(
                title: const Text("Sound"),
                value: soundEnabled,
                onChanged: (bool value) {
                  setState(() {
                    soundEnabled = value;
                  });
                },
                activeColor: const Color.fromARGB(255, 61, 60, 60),
              ),
            ),
            const SizedBox(height: 16),

            // Card for Enable Notifications
            Card(
              color: Colors.pink.shade100,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              elevation: 5,
              child: SwitchListTile(
                title: const Text("Enable Notifications"),
                value: notificationsEnabled,
                onChanged: (bool value) {
                  setState(() {
                    notificationsEnabled = value;
                  });
                },
                activeColor: const Color.fromARGB(255, 61, 60, 60),
              ),
            ),
            const SizedBox(height: 16),

            // Card for Max Numbers Of Reminders
            Card(
              color: Colors.pink.shade100,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Max Numbers Of Reminders", style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    DropdownButton<String>(
                      value: maxReminders,
                      onChanged: (String? newValue) {
                        setState(() {
                          maxReminders = newValue!;
                        });
                      },
                      items: <String>["How Many Per Day", "5", "10", "15"]
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Card for Remind Me When
            Card(
              color: Colors.pink.shade100,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Remind Me When", style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    DropdownButton<String>(
                      value: remindWhen,
                      onChanged: (String? newValue) {
                        setState(() {
                          remindWhen = newValue!;
                        });
                      },
                      items: <String>["Always Remind Me", "Only When I'm Behind"]
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  ProfileScreenState createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {
  File? image; // Ubah `_image` menjadi `image`

  // Function to pick an image from the gallery or camera
  Future<void> pickImage(ImageSource source) async {
  if (!mounted) return; // Cek jika widget masih terpasang

  final picker = ImagePicker();
  final XFile? pickedFile = await picker.pickImage(source: source);

  if (pickedFile != null && mounted) {
    // Gunakan `setState` hanya jika widget masih terpasang
    setState(() {
      image = File(pickedFile.path); // Konversi XFile ke File
    });
  } else if (mounted) {
    // Kembali ke layar sebelumnya jika dibatalkan, pastikan widget masih terpasang
    Navigator.pop(context);
  }
}


  // Function to save profile (mock implementation)
  void saveProfile() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Profile Saved!")),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.bottomRight, // Position edit icon on bottom right
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.pink.shade100,
                    backgroundImage: image != null ? FileImage(image!) : null,
                    child: image == null
                        ? const Icon(Icons.person, size: 50, color: Colors.pinkAccent)
                        : null,
                  ),
                  IconButton(
                    icon: const Icon(Icons.edit, color: Colors.pinkAccent),
                    onPressed: () async {
                      // Open dialog to choose between gallery or camera
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text("Edit Profile Picture"),
                            content: const Text("Choose your option"),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  pickImage(ImageSource.gallery);
                                  Navigator.pop(context); // Close dialog
                                },
                                child: const Text("Open Gallery"),
                              ),
                              TextButton(
                                onPressed: () {
                                  pickImage(ImageSource.camera);
                                  Navigator.pop(context); // Close dialog
                                },
                                child: const Text("Open Camera"),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const _ProfileField(label: "Your Name"),
              const SizedBox(height: 16),
              const _ProfileField(label: "Email"),
              const SizedBox(height: 16),
              const _ProfileField(label: "Password", isPassword: true),
              const SizedBox(height: 16),
              const _ProfileField(label: "Gender"),
              const SizedBox(height: 16),
              const _ProfileField(label: "Height"),
              const SizedBox(height: 16),
              const _ProfileField(label: "Weight"),
              const SizedBox(height: 16),
              // Save button at the bottom
              ElevatedButton(
                onPressed: saveProfile,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 142, 141, 142),
                    foregroundColor: const Color.fromARGB(255, 247, 246, 246),
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: const Text("Save"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProfileField extends StatelessWidget {
  final String label;
  final bool isPassword;

  const _ProfileField({required this.label, this.isPassword = false});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      color: const Color.fromARGB(255, 255, 210, 226),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: TextField(
          obscureText: isPassword,
          decoration: InputDecoration(
            labelText: label,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            filled: true,
            fillColor: const Color.fromARGB(255, 255, 238, 243),
          ),
        ),
      ),
    );
  }
}






