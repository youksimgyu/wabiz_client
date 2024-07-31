import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:wabiz_client/models/project/project_model.dart';
import 'package:wabiz_client/theme.dart';

class ProjectWidget extends StatelessWidget {
  const ProjectWidget({
    super.key,
    required this.projectItemModel,
  });

  final ProjectItemModel projectItemModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(projectItemModel.type ?? ''),
                  const Icon(Icons.keyboard_arrow_right),
                ],
              ),
              const Gap(12),
              Text(
                '${projectItemModel.title}',
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
              const Gap(12),
              Row(
                children: [
                  Text(
                    '${NumberFormat('###,###,###').format((((projectItemModel.totalFunded ?? 0) / (projectItemModel.price ?? 1)) * 100))} % 달성',
                    style: const TextStyle(
                      color: AppColors.primary,
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const Gap(12),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppColors.secondary,
                      borderRadius: BorderRadius.circular(3),
                    ),
                    child: Text(
                      '${DateTime.now().difference(DateTime.parse(projectItemModel.deadline ?? '')).inDays}일 남음',
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        color: AppColors.primary,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
              const Gap(12),
              Row(
                children: [
                  Text(
                    '${NumberFormat.currency(locale: 'ko_KR', symbol: '').format(projectItemModel.totalFunded)} 원 달성',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Gap(12),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    decoration: BoxDecoration(
                      color: AppColors.bg,
                      borderRadius: BorderRadius.circular(3),
                    ),
                    child: Text(
                      '${NumberFormat('###,###,###').format(projectItemModel.totalFundedCount)} 명 참여',
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const Divider(
          color: AppColors.newBg,
          height: 32,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '프로젝트 스토리',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Gap(12),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.newBg,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(12),
                child: const Text(
                  '도서산간에 해당하는 서포터님은 배송 가능 여부를 반드시 메이커에게 문의 후 참여해주세요.',
                ),
              ),
              const Gap(12),
              Image.asset(
                'assets/image/advertising_image.png',
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class BottomAppBarWidget extends StatelessWidget {
  const BottomAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: 84,
      color: Colors.white,
      surfaceTintColor: Colors.white,
      padding: EdgeInsets.zero,
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.grey[200]!,
            ),
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
        child: Row(
          children: [
            Column(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.favorite_border),
                ),
                const Text('1만+'),
              ],
            ),
            const Gap(12),
            Expanded(
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Text(
                    '펀딩하기',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
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
