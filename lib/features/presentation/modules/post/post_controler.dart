import 'package:_88credit_flutter/config/routes/app_routes.dart';
import 'package:_88credit_flutter/features/domain/entities/credit/post.dart';
import 'package:get/get.dart';

import '../../../domain/enums/loan_reason_types.dart';
import '../../../domain/enums/post_status.dart';
import '../../../domain/enums/post_type.dart';

class PostController extends GetxController {
  PostEntity getPostLending() {
    return PostEntity(
      id: "97f8d494-1fb9-4179-a983-8f7a47612f21",
      userId: "fec2579d-fe55-4da6-874a-dd5bab669cf8",
      type: PostTypes.lending.toString(),
      loanReasonType: LoanReasonTypes.business,
      loanReason: "Mua nhà",
      status: PostStatus.approved,
      title: "Vay nóng 2tr",
      description: "Cần vay tiền để mua ô tô",
      images: const [
        "https://picsum.photos/200/300?random=1",
        "https://picsum.photos/200/300?random=2",
        "https://picsum.photos/200/300?random=3"
      ],
      createdAt: DateTime.parse("2023-12-06T08:20:15.234Z"),
      updatedAt: DateTime.parse("2023-12-06T08:20:15.234Z"),
      interestRate: 0.1,
      loanAmount: 2000000,
      tenureMonths: 12,
      overdueInterestRate: 0.12,
      maxInterestRate: null,
      maxLoanAmount: null,
      maxTenureMonths: null,
      maxOverdueInterestRate: null,
      rejectedReason: null,
      deletedAt: null,
    );
  }

  PostEntity getPostBorrowing() {
    return PostEntity(
      id: "34e8502e-2fa6-41c6-b56a-b8d85126942b",
      userId: "fec2579d-fe55-4da6-874a-dd5bab669cf8",
      type: PostTypes.borrowing.toString(),
      loanReasonType: LoanReasonTypes.business,
      loanReason: "Labore iriure nulla.",
      status: PostStatus.approved,
      title:
          "Ea clita invidunt vulputate amet est tempor voluptua vero magna aliquyam autem kasd eu tation vero consetetur kasd sea.",
      description:
          "Lorem hendrerit lorem nisl sed ea dolore voluptua dolor lorem eirmod kasd. Aliquyam lorem kasd magna. Diam ipsum ullamcorper exerci et sed et amet diam rebum sed vero accusam facer eirmod ipsum accusam aliquyam. Sit sed sadipscing eirmod et diam sea est vero sanctus. Ea invidunt sed voluptua sadipscing molestie eos voluptua nonummy clita nonummy diam nonumy sed. Nonummy sed et eos aliquip gubergren sea invidunt lobortis amet duo no diam adipiscing eirmod invidunt duis augue. Ipsum sadipscing rebum sit duis ea et lorem. Consectetuer luptatum stet rebum et justo duo et iusto. Amet magna facilisis lorem at at voluptua in soluta. Dolor at dolor et dolor sit est rebum et dignissim. No amet invidunt ipsum lorem esse lorem cum accusam amet est rebum ea voluptua accusam lorem consetetur. Lorem volutpat nibh at sanctus et sea duo stet eirmod vulputate rebum est wisi.",
      images: const [
        "https://picsum.photos/200/300?random=10",
        "https://picsum.photos/200/300?random=11",
        "https://picsum.photos/200/300?random=14"
      ],
      createdAt: DateTime.parse("2023-12-06T08:28:35.177Z"),
      updatedAt: DateTime.parse("2023-12-06T08:28:35.177Z"),
      interestRate: 0.1,
      loanAmount: 1000,
      tenureMonths: 12,
      overdueInterestRate: 0.2,
      maxInterestRate: 0.3,
      maxLoanAmount: 5000,
      maxTenureMonths: 24,
      maxOverdueInterestRate: 0.12,
      rejectedReason: null,
      deletedAt: null,
    );
  }

  void navigationToPostDetail(PostEntity post) {
    Get.toNamed(AppRoutes.postDetail, arguments: post);
  }
}
