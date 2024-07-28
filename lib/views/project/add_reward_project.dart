import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:wabiz_client/theme.dart';

class AddRewardProject extends StatefulWidget {
  const AddRewardProject({
    super.key,
    required this.projectId,
  });

  final String projectId;

  @override
  State<AddRewardProject> createState() => _AddRewardProjectState();
}

class _AddRewardProjectState extends State<AddRewardProject> {
  TextEditingController priceTextEditingController = TextEditingController();
  TextEditingController titleTextEditingController = TextEditingController();
  TextEditingController descriptionTextEditingController =
      TextEditingController();

  @override
  void dispose() {
    priceTextEditingController.dispose();
    titleTextEditingController.dispose();
    descriptionTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('리워드'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '리워드 추가',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Gap(12),
              DottedBorder(
                color: AppColors.wabizGray[200]!,
                dashPattern: const [5, 5],
                borderType: BorderType.RRect,
                radius: const Radius.circular(10),
                child: Container(
                  height: 216,
                  width: double.infinity,
                  color: const Color(0xFFFBFBFB),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add_circle),
                      Gap(12),
                      Text('리워드를 추가해주세요.'),
                    ],
                  ),
                ),
              ),
              const Gap(24),
              const Text(
                '금액',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Gap(12),
              TextField(
                controller: priceTextEditingController,
                decoration: const InputDecoration(
                  hintText: '금액을 입력해주세요.',
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                keyboardType: TextInputType.number,
              ),
              const Gap(24),
              const Text(
                '리워드 제목',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Gap(12),
              TextField(
                controller: titleTextEditingController,
                decoration: const InputDecoration(
                  hintText: '예시) [얼리버드] 베이지 이불, 베개 1세트',
                ),
                maxLength: 60,
              ),
              const Gap(24),
              const Text(
                '리워드 설명',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Gap(12),
              TextField(
                controller: descriptionTextEditingController,
                decoration: const InputDecoration(
                  hintText: '리워드에 구성과 혜택을 간결하게 설명해 주세요.',
                ),
                maxLength: 400,
                maxLines: 10,
              ),
              const Gap(24),
              SizedBox(
                height: 50,
                child: Row(
                  children: [
                    Expanded(
                        child: OutlinedButton(
                      onPressed: () {
                        context.pop();
                      },
                      child: const Text(
                        '취소',
                      ),
                    )),
                    const Gap(12),
                    Expanded(
                        child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Center(
                          child: Text(
                            '추가',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
