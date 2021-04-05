# BLOC 패턴 공부
최근 스타트업에 지원하였는데, Flutter BLOC 패턴을 사용한다 하여 공부를 진행하였다.

## 의존성
http, RxDart

## 프로젝트 구조
main => app => ui
### ui
- StatelessWidget 빌드 함수에 bloc.fetchAllMovies() 호출
- StreamBuilder로 stream: bloc.allMovies 스트림 등록, 빌더로 buildList 호출
- Widget를 반환하는 buildList 함수는 snapshot을 파라미터로 받아 이미지를 그리드 뷰로 뿌림

### bloc
- MovieBloc 클래스 생성
- Repository, PublishSubject<ItemModel> 변수 생성, fetchAllMovies 함수 생성(repository로 부터 데이터를 가져옴)

### resources
- repository
    - MovieApiProvider 생성후 사용
- movie_api_provider
    - Client 생성 후 http로 데이터 받아와 ItemModel.fromJson 반환

### models
- item_model 데이터들을 넣을 변수와 getter setter 정의

## 회고
- ui는 데이터를 받아서 보여주는데만 집중하고 데이터 처리는 하지 않게 분리됨
- blocs는 ui에게 데이터를 넘겨주는 역할
- resources는 models를 활용하여 api로부터 데이터를 가져오고 blocs에게 넘겨줌
- models는 데이터의 형식을 정의함
- 데이터를 처리하는 blocs와 resources를 분리하는 이유가 궁금하였었는데 로컬DB나 네이티브 메서드 채널(?)을 이용해서 제공받을때도 있기땓문에 Bloc에게 Model을 제공하는 부분을 분리하는게 좋다. 라는 답변을 받았습니다.
- 네이티브 메서드 채널이 뭔지 찾아 봐야겠다.
- 찾아본 결과 네이티브 API 인듯 하다.

![image](https://user-images.githubusercontent.com/44742847/113564337-2ead8b80-9644-11eb-9e66-0a031d3ba83b.png)
