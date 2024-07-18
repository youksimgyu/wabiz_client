import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:wabiz_client/theme.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({
    super.key,
    required this.categoryId,
  });

  final String categoryId;

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('카테고리'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/icons/home_outlined.svg',
              width: 24,
              height: 24,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 204,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey[800],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '최고의 이어폰 | 전문가가 만든 완벽한 이어폰',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const Gap(12),
                  const Text(
                    '전문가가 만든 이어폰 하나둘셋넷다섯, 전문가가 만든 이어폰 하나둘셋넷다섯',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  const Gap(16),
                  Container(
                    height: 4,
                    width: 120,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 110,
            decoration: const BoxDecoration(
              color: Colors.grey,
            ),
            padding: const EdgeInsets.fromLTRB(8, 16, 8, 0),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 32),
                  child: IntrinsicWidth(
                    child: Column(
                      children: [
                        const Gap(8),
                        const CircleAvatar(
                          radius: 16,
                        ),
                        const Gap(12),
                        const Text('테크'),
                        const Gap(12),
                        Container(
                          height: 6,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          const Divider(height: 0),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Column(
                  children: [
                    Row(
                      children: [
                        DropdownButton(
                          items: const [
                            DropdownMenuItem(
                              child: Text('전체'),
                            ),
                          ],
                          icon: const Icon(Icons.keyboard_arrow_down),
                          onChanged: (value) {},
                        ),
                        const Gap(24),
                        DropdownButton(
                          items: const [
                            DropdownMenuItem(
                              child: Text('추천순'),
                            ),
                          ],
                          icon: const Icon(Icons.keyboard_arrow_down),
                          onChanged: (value) {},
                        ),
                      ],
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {},
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 24),
                              child: Row(
                                children: [
                                  Container(
                                    height: 120,
                                    width: 164,
                                    decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          right: 2,
                                          top: 2,
                                          child: IconButton(
                                            onPressed: () {},
                                            icon: const Icon(
                                              Icons.favorite_border,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Gap(16),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          '[내 손안의 와이파이] 6G 라우터로 어디서든 빠르게',
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        const Gap(8),
                                        Text(
                                          '홍길동',
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: AppColors.wabizGray[500],
                                          ),
                                        ),
                                        const Gap(8),
                                        const Text(
                                          '1000 명 참여',
                                          style: TextStyle(
                                            color: AppColors.primary,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        const Gap(8),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 6, vertical: 4),
                                          decoration: const BoxDecoration(
                                            color: AppColors.bg,
                                          ),
                                          child: const Text('1,000원',
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                              )),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
