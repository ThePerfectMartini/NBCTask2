# NBCTask2
내배캠 개인과제


1. UserDefaults와 CoreData의 차이점을 README에 적어주세요.

    userdefaults는 싱글턴이고 무조건 key-value로 값을 저장해야 한다. 그리고 커스텀 오브젝트를 저장하고 싶을때 encoder decoder를 직접 만들어줘야 한다는 단점이 있었다.
   coredata는 프레임워크이고 실제 데이터베이스이다. 영속성을 가지고 있다.
3. MVC를 목표로 구현했던 숙련 과제와 MVVM을 구현했던 `ProfileViewController`를 비교해보세요.

    제 프로젝트에서는 프로필뷰가 없고 이것을 콜렉션뷰에 적용해서 구현해봤습니다.
   Model이 없지만 이는 coredata에 적용되어있는 클래스를 통해 model의 기능을 하고
   datamanager가 viewmodel의 기능을 해주어 viewcontroller에서 비즈니스 로직을 전부 datamanager에게 일을 전달하여 처리하도록 구현했습니다.
6. 자신이 만든 앱의 구조를 파악하는 것은 쉬운 일이 아닙니다. 만든 코드를 되돌아본다고 생각하면서 구조를 그리고 텍스트로 설명해주세요.

     메인 뷰에서 프로필디자인컨트롤러와 콜렉션뷰컨트롤러로 화면을 이동시키고 이때 화면이동방식은 둘다 present이며 프로필디자인의 경우에는 fullscreen을 적용했습니다.
   콜렉션뷰는 기존 present를 적용해서 띄우고 있습니다.
   콜렉션뷰의 데이터는 coredata를 통해 저장하고 불러오며 데이터를 저장하는 로직은 datamanager에서 전부 실행됩니다.
