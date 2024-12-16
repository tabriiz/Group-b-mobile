import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  static const String baseUrl = 'http://192.168.59.200:3000';

  // Fungsi login
  Future<http.Response> login(String email, String password) async {
    final url = Uri.parse('$baseUrl/login');
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'password': password}),
      );
      return response;
    } catch (e) {
      throw Exception('Gagal melakukan login: $e');
    }
  }

static Future<Map<String, dynamic>> getUserData(String userId) async {
    final response = await http.get(Uri.parse('$baseUrl/pengguna/$userId'));
    
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load user data');
    }
  }

  // Fungsi mendapatkan estimasi kebutuhan air
  static Future<double> getEstimatedWaterIntake(int userId) async {
    final url = Uri.parse('$baseUrl/estimasi_kebutuhan_air/$userId');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['estimated_intake'].toDouble();
      } else {
        throw Exception('Gagal mendapatkan estimasi kebutuhan air');
      }
    } catch (e) {
      throw Exception('Error fetching data: $e');
    }
  }

 // Fungsi mendapatkan data sensor terbaru
static Future<Map<String, dynamic>> getSensorData() async {
  final url = Uri.parse('$baseUrl/sensor-data'); // URL tanpa userId
  try {
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Gagal mendapatkan data sensor');
    }
  } catch (e) {
    throw Exception('Error fetching sensor data: $e');
  }
}

}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int? userId;
  double? estimatedIntake;
  double? currentCapacity;
  double? currentTemperature;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadUserId();
  }

  Future<void> _loadUserId() async {
    final prefs = await SharedPreferences.getInstance();
    userId = prefs.getInt('userId');

    if (userId != null) {
      await _fetchDataFromDatabase(userId!);
    } else {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('User ID not found')),
      );
    }
  }
Future<void> _fetchDataFromDatabase(int id) async {
  try {
    // Ambil data estimasi kebutuhan air (tetap menggunakan id jika diperlukan)
    final estimatedIntakeResult =
          await ApiService.getEstimatedWaterIntake(id); 
    // Ambil data sensor terbaru
    final lastSensorData = await ApiService.getSensorData();

    setState(() {
      estimatedIntake = estimatedIntakeResult;
      currentCapacity = lastSensorData['berat_air_sensor'];
      currentTemperature = lastSensorData['suhu_sensor'];
      isLoading = false;
    });
  } catch (e) {
    setState(() {
      isLoading = false;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Error fetching data: $e')),
    );
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Hello",
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
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Container(
              color: Colors.pink.shade50,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Circular Water Progress Indicator
                    Container(
                      width: 180,
                      height: 200,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromARGB(255, 249, 190, 211),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "${(currentCapacity ?? 0).toInt()}",
                              style: const TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              "/ ${estimatedIntake?.toInt() ?? 0} mL",
                              style: const TextStyle(
                                  fontSize: 16, color: Colors.black54),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Capacity and Temperature Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _InfoCard(
                          title: "Capacity",
                          value: "${currentCapacity?.toInt() ?? 0} / 1000 mL",
                        ),
                        _InfoCard(
                          title: "Temperature",
                          value: "${currentTemperature?.toInt() ?? 0}°C",
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

class _InfoCard extends StatelessWidget {
  final String title;
  final String value;

  const _InfoCard({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title, style: const TextStyle(fontSize: 16)),
        const SizedBox(height: 8),
        Text(value, style: const TextStyle(fontSize: 18)),
      ],
    );
  }
}

class _ActionCard extends StatelessWidget {
  final String title;
  final IconData icon;

  const _ActionCard({required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: const TextStyle(fontSize: 16)),
        Icon(icon, size: 16),
      ],
    );
  }
}
