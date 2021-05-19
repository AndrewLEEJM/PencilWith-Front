import 'package:flutter/material.dart';

class Privacy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(
            '개 인 정 보 처 리 지 침',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Container(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Text('''1. 개인정보의 수집 및 이용 목적

기관은 수집한 개인정보를 다음의 목적을 위해 활용합니다.

1) 홈페이지 회원 가입 및 관리

2) 후원자 서비스 제공

3) 마케팅, 광고에의 활용

​

2. 개인정보의 보유 및 이용기간

1) 계약 또는 청약철회 등에 관한 기록

- 보존 이유: 전자상거래 등에서의 소비자보호에 관한 법룔 제6조 및 시행령 제6조- 보존 기간: 5년

2) 대금결제 및 재화 등의 공급에 관한 기록

- 보존 이유: 전자상거래 등에서의 소비자보호에 관한 법룔 제6조 및 시행령 제6조- 보존 기간: 5년

3) 소비자의 불만 또는 분쟁처리에 관한 기록

- 보존 이유: 전자상거래 등에서의 소비자보호에 관한 법룔 제6조 및 시행령 제6조- 보존 기간: 3년

4) 본인확인에 관한 기록

- 보존 이유: 정보통신망 이용촉진 및 정보보호에 관한 법률 제 44조의5 및 시행령 제 29조- 보존 기간: 6개월

5) 접속에 관한 기록

- 보존 이유: 통신비밀보호법 제15조의2 및 시행령 제41조- 보존 기간: 3개월

​

3. 수집하는 개인정보의 항목

기관은 회원가입, 상담, 서비스 신청 등을 위해 아래와 같은 개인정보를 수집하고 있습니다.

1) 수집항목

필수 입력 : 이름, 생년월일, 성별, 로그인ID, 비밀번호, 휴대전화번호,

자동 수집항목 : 이용 기록, 접속 로그, 쿠키, 접속 기록 등

2) 개인정보 수집방법: 홈페이지(회원 가입), 서면 양식, 전화/팩스를 통한 회원 가입

​

4. 개인정보의 파기절차 및 방법

기관은 원칙적으로 개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체 없이 파기합니다.

파기절차 및 방법은 다음과 같습니다.

1) 파기절차 : 활동 기록 및 피드백 내용이 1년간 보관됩니다.

2) 파기방법 : 1년이 지난 정보는 자동 파기됩니다.

​

5. 개인정보 제공

기관은 이용자의 개인정보를 원칙적으로 외부에 제공하지 않습니다. 다만, 아래의 경우에는 예외로 합니다.-

이용자들이 사전에 동의한 경우- 법령의 규정에 의거하거나, 수사 목적으로 사기관의 요구가 있는 경우

​

6. 수집한 개인정보의 위탁

기관은 후원자 서비스 향상을 위하여 취급 업무를 외부 전문업체에 위탁하고 있으며, 개인정보 보호법 26조에 따라 위탁계약 시 개인정보가 안전하게 관리될 수 있도록 필요한 사항을 규정하고 있습니다.

​

​

7. 이용자 및 법정대리인의 권리와 그 행사방법

이용자 및 법정 대리인은 언제든지 등록되어 있는 본인 혹은 당해 만 14세 미만 아동의 개인정보를 조회하거나 수정할 수 있으며 가입 해지를 요청할 수도 있습니다.

8. 개인정보 자동수집 장치의 설치, 운영 및 그 거부에 관한 사항

쿠키 이용여부 및 쿠키 허용 방법 설명

​

9. 개인정보의 안정성 확보조치에 관한 사항

1) 개인정보 암호화

2) 해킹 등에 대비한 대책

3) 취급 직원의 최소화 및 교육

​

10. 개인정보 관리 책임자 및 담당자

조직내 정보처리 및 정보보안 담당부서와 연락처 기재

기타 개인정보침해에 대한 신고나 상담이 필요한 경우에는 아래 기관에 문의하시기 바랍니다.

- 개인정보침해신고센터 (www.118.or.kr / 118)

​

11. 개인정보 취급방침 변경에 관한 사항

이 개인정보 취급방침은 가입일부터 적용됩니다.

변경이전의 “정보보안 처리방침”을 과거이력 기록
        ''', style: TextStyle(fontSize: 16.0, color: Colors.black)),
          ),
        ));
  }
}
