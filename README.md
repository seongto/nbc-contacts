# Pokemon Contacts App

![포켓몬 연락처 앱](https://img1.daumcdn.net/thumb/R1280x0/?fname=http://t1.daumcdn.net/brunch/service/user/iux/image/tYQhIQJdCurKtGftAxWwnNq-Sl8.png)


## Project Information
  - 프로젝트명 : UIKit으로 연락처 앱 만들기, 근데 이제 포켓몬을 곁들인...
  - 프로젝트 소개 : 
    - 코드베이스 UIKit으로 연락처 앱을 만들자.
    - CoreData, UserDefaults, URLSession 등을 활용하여 연락처의 생성과 저장, 오픈 API와의 통신 기능을 포함한다.
<br><br><br>

## 프로젝트 수행 과제
- ### 수행 목표
  - **`UIKit` 화면 구성 및 화면 전환**
    - 화면구성: `UITableView`, `UILabel`, `UITextView`, `UIButton`  활용
    - 화면전환: `친구 목록 페이지` → `연락처 추가 페이지`로 이동
  - **`URLSession` / `Alamofire` 복습**
    - 네트워크 통신을 이용해서 서버에서 랜덤 포켓몬 이미지를 불러와서 저장.    
    - 참고할 포켓몬 API: https://pokeapi.co/
  - **`ViewController 생명주기` 개념**
    - 친구 목록 페이지에 진입할때마다 목록이 `이름순으로 정렬`되도록 합니다.
  - **`CoreData` / `UserDefaults` 활용**
    - 연락처 데이터를 `기기 디스크에 저장`한다.
    - 두 가지 방식 모두 활용하는 방안으로 진행.
<br><br>

- ### 기본 구현 기능
  - LV 1
    + [ ] `UILabel`, `UITableView`, `UIButton` 을 이용해서 기본적인 UI 를 구성
    + [ ] `UITableViewCell` 에 프로필 이미지를 보여줄 `UIImageView` 와 이름을 보여줄 `UILabel` 을 넣기. 전화번호를 표시할 UILabel 삽입.
    + [ ] 
  - LV 2
    + [ ] 연락처 추가 화면을 구현
    + [ ] `UINavigationController.push` 사용하여 메인페이지에서 이 화면으로 이동하도록 구성
  - LV 3
    - [ ] 상단 네비게이션 바 영역을 구현.
    - [ ] - 상단에 “제목” 과 “적용” 버튼을 개발합니다. `UINavigationController` 를 활용.
  - LV 4
    - [ ] 랜덤 이미지 생성 버튼을 구현
    - [ ] 포켓몬 API를 통해 버튼을 클릭할때마다 랜덤한 포켓몬 이미지를 불러와서 프로필로 지정하기.
    - [ ] `https://pokeapi.co/api/v2/pokemon/{1~1000사이의랜덤숫자입력}`
  - LV 5
    - [ ] 적용 버튼을 통해 연락처 데이터(이름/전화번호/프로필이미지)를 디스크에 실제 저장하도록 구현
    - [ ] `UINavigationController.popViewController`를 활용하여 디스크에 저장됨과 동시에, 메인화면으로 돌아오도록 구현
    - [ ] 
<br><br>

![hard mode](https://staticdelivery.nexusmods.com/mods/5113/images/headers/229_1676449560.jpg)

- ### 심화 구현 기능
  - LV 6
    + [ ] 연락처 추가를 마치고 메인화면으로 돌아왔을 때 항상 이름 순으로 정렬.
  - LV 7
    + [ ] `UITableViewCell` 을 클릭했을 때도 `PhoneBookViewController` 페이지로 이동하되, 기존의 생성용 화면(뷰컨트롤러)을 재활용.
    + [ ] 상단 네비게이션바에도 연락처의 이름이 뜨도록 설정.
  - LV 8
    + [ ] UITableViewCell 을 클릭해서 이동해온 연락처 편집 페이지에서, 연락처 데이터의 수정기능 구현
<br><br>

![Challenge mode](https://assets.nintendo.com/image/upload/c_fill,w_1200/q_auto:best/f_auto/dpr_2.0/ncom/software/switch/70050000007810/9c91c6b2b72cded0aee55c131515090e1d3b2ae35df64f352dc991aead38a1cb)

- ### 도전 구현 기능
  - [ ] ~~포켓몬 이미지가 지정된 영역 밖으로 나가지 않게 하기~~ -> 포켓몬이 지정된 영역 밖으로 튀어나온 효과 연출 : 디자인을 통해 구현
  - [ ] 연락처를 매우 많이 추가했을 경우(20개 이상), 테이블 뷰 스크롤을 쭉 내리다보면, 이미지가 겹쳐보이거나 텍스트가 제대로 노출되지 않는 문제 해결해보기
    - 이 문제는 `prepareForReuse` 의 개념을 사용하면 해결 가능.
  - [ ] 예외 사항을 예측하고 이에 대한 예외 처리 구현
<br><br>
 
- ### 추가 구현 기능
  - [ ] 포켓몬 이미지가 배경에도 나타나게 하기
  - [ ] 연락처의 각 정보를 테이블을 나누고 관계 설정해보기 (ex. 카테고리)
  - [ ] 연락처에 소프트삭제 기능을 추가하고, 휴지통 적용해보기
  - [ ] 연락처 정보는 CoreData에 저장하고, 최근 추가 목록을 추가하여 이를 UserDefaults에 저장하고 관리하기(생성 시간 내림차순 정렬)
  - [ ] 연락처 정보에 포켓몬 정보 추가하기
  - [ ] 상수값들과 컴포넌트 디자인을 라이브러리로 만들어 적용해보기

<br><br>

---
### Project Journal
[노션 페이지 바로가기](https://seongto.notion.site/154a2764a6578006b22ec248921ae529?pvs=4)



      
