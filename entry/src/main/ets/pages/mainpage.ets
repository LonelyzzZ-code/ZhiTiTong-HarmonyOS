import { router } from '@kit.ArkUI';

@Entry
@Component
struct Test1 {
  @State message: string = 'Hello World';
  @State username: string = '';
aboutToAppear(): void {
  let params = router.getParams() as Record<string,string>;
  this.username = params?.username??"未获取到账号";
}
  build() {
    RelativeContainer() {
      Text(this.username)
        .id('Test1HelloWorld')
        .fontSize($r('app.float.page_text_font_size'))
        .fontWeight(FontWeight.Bold)
        .alignRules({
          center: { anchor: '__container__', align: VerticalAlign.Center },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })
        .onClick(() => {
          this.message = 'Welcome';
        })
      Button("返回")
        .onClick(() => {
          router.back()
        })
    }
    .height('100%')
    .width('100%')
  }
}