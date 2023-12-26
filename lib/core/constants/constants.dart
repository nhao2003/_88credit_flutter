const ipConfig = "192.168.137.1";
const bool isProduction = false;
const String apiDevUrl = "http://$ipConfig:8000/api/v1";
const String apiProductionUrl = "https://nha-gia-re-server.onrender.com/api/v1";
const String apiUrl = apiDevUrl;
const String apiAppUrl = isProduction ? apiProductionUrl : apiDevUrl;
const String kSignIn = '/auth/sign-in';
const String kSignUp = '/auth/sign-up';
const String kChangePassword = '/auth/change-password';
const String kSignOut = '/auth/sign-out';
const String kSignOutAll = '/auth/sign-out-all';
const String kActiveAccount = '/auth/active-account';
const String kResendActivationCode = '/auth/resend-activation-code';
const String kRefreshToken = '/auth/refresh-token';

const String kGetPostEndpoint = '/post';
const String kCreatePostEndpoint = '/post/create';
const String kGetMembershipPackageEndpoint = '/membership-package';
const String kGetTransactionEndpoint = '/membership-package/transactions';
const String kCreateOrderEndpoint = '/membership-package/check-out';
const String kGetBlogEndpoint = '/blogs';

const String kGetRequestEndpoint = '/loan-request';
const String kPayLoanRequestEndpoint = '/loan-request/lender-pay';
const String kCreateRequestEndpoint = '/loan-request/create';
const String kConfirmRequestEndpoint = '/loan-request/lender-accept';
const String kRejectRequestEndpoint = '/loan-request/reject-request';

const String kGetUserEndpoint = '/user';

const String kGetContractEndpoint = '/contract';
const String kGetMe = '/me';
