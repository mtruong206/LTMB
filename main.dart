import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: const GradeScreen(),
    );
  }
}

class GradeScreen extends StatelessWidget {
  const GradeScreen({super.key});

  // Hàm trả về xếp loại
  String getRank(double score) {
    if (score < 0 || score > 10) return 'Không hợp lệ';
    if (score >= 8.0) return 'Giỏi';
    if (score >= 6.5) return 'Khá';
    if (score >= 5.0) return 'Trung bình';
    return 'Yếu';
  }

  // Hàm trả về màu nền nhãn
  Color getBgColor(double score) {
    if (score < 0 || score > 10) return Colors.grey[200]!;
    if (score >= 8.0) return Colors.green[50]!;
    if (score >= 6.5) return Colors.blue[50]!;
    if (score >= 5.0) return Colors.orange[50]!;
    return Colors.red[50]!;
  }

  // Hàm trả về màu chữ nhãn
  Color getTextColor(double score) {
    if (score < 0 || score > 10) return Colors.grey[700]!;
    if (score >= 8.0) return Colors.green[700]!;
    if (score >= 6.5) return Colors.blue[700]!;
    if (score >= 5.0) return Colors.orange[800]!;
    return Colors.red[700]!;
  }

  @override
  Widget build(BuildContext context) {
    double mainScore = 8.5;
    List<double> testScores = [9, 7, 5.5, 3, 11];

    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F6),
      appBar: AppBar(
        title: const Text('Xếp loại học lực', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFF1E3A8A),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Ô hiển thị điểm trung bình chính (8.5)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  const Text('Điểm trung bình', style: TextStyle(color: Colors.grey, fontSize: 13)),
                  const SizedBox(height: 8),
                  Text('$mainScore', style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: getBgColor(mainScore),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        getRank(mainScore),
                        style: TextStyle(color: getTextColor(mainScore), fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            const Text('KIỂM TRA THÊM', style: TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),

            // Danh sách các điểm kiểm tra thêm
            for (var score in testScores)
              Container(
                margin: const EdgeInsets.only(bottom: 8),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Điểm ${score % 1 == 0 ? score.toInt() : score}', style: const TextStyle(fontWeight: FontWeight.w500)),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                        color: getBgColor(score),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        getRank(score),
                        style: TextStyle(color: getTextColor(score), fontWeight: FontWeight.bold, fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}