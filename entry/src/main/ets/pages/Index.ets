import TabBar from '../view/TabBar';

@Entry
@Component
struct Index {

  build() {
    Column(){
      TabBar();
    }
    .width('100%')
    .backgroundColor($r('app.color.listColor'))
    .justifyContent(FlexAlign.Center)
  }
}