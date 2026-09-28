import { router } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';

@Entry
@Component
struct Index {
  @State message: string = '欢迎使用智题通';
  @State password: string = '';
  @State username: string = '';
  @State isRegister: boolean = false;
  @State confirmPassword: string = '';
  build() {
    Column() {
      Blank()
      Image($r('app.media.logo'))
        .height(120)
        .shadow({ radius: 20, color: 'rgba(0, 0, 0, 0.15)', offsetY: 8 })
      Text(this.message)
        .fontSize(28)
        .fontWeight(FontWeight.Bold)
        .fontColor('#1E5EFF')
        .margin({ top: 16 })
      Blank()
      Column({ space: 16 }) {
        TextInput({ placeholder: '请输入用户名' })
          .width('100%')
          .height(48)
          .backgroundColor('#F2F3F5')
          .borderRadius(24)
          .onChange((value) => {
            console.log(value)
            this.username = value;
          })
        TextInput({ placeholder: '请输入密码' })
          .width('100%')
          .height(48)
          .type(InputType.Password)
          .backgroundColor('#F2F3F5')
          .borderRadius(24)
          .onChange((value) => {
            console.log(value)
            this.password = value;
          })
        if (this.isRegister) {
          TextInput({ placeholder: '请确认密码' })
            .width('100%')
            .height(48)
            .type(InputType.Password)
            .backgroundColor('#F2F3F5')
            .borderRadius(24)
            .onChange((value) => {
              this.confirmPassword = value;
            })
        }
        Button(this.isRegister ? '注册' : '登陆')
          .width('100%')
          .height(48)
          .fontSize(18)
          .fontWeight(FontWeight.Medium)
          .fontColor(Color.White)
          .linearGradient({
            angle: 90,
            colors: [['#4F8CFF', 0], ['#1E5EFF', 1]]
          })
          .margin({ top: 8 })
          .onClick(() => {
            if (this.isRegister) {
              if (this.password !== this.confirmPassword) {
                this.getUIContext().getPromptAction().showToast({ message: '两次密码不一致' })
                return
              }
              this.getUIContext().getPromptAction().showToast({ message: '注册成功，请登录' })
              this.isRegister = false
              this.confirmPassword = ''
              return
            }
            if (this.username === '123456' && this.password === '123456') {
              this.getUIContext().getPromptAction().showToast({ message: '登录成功' })
              router.pushUrl({ url: 'pages/mainpage',params:{username:this.username}})
                .catch((err: BusinessError) => {
                  console.error(`跳转失败 code:${err.code} msg:${err.message}`)
                  this.getUIContext().getPromptAction().showToast({ message: `跳转失败:${err.code}` })
                })
            } else {
              this.getUIContext().getPromptAction().showToast({ message: '登录失败' })
            }
          })
        Text(this.isRegister ? '已有账号？去登录' : '没有账号？去注册')
          .fontSize(14)
          .fontColor('#1E5EFF')
          .margin({ top: 8 })
          .onClick(() => {
            this.isRegister = !this.isRegister
            this.confirmPassword = ''
          })
      }
      .width('82%')
      .padding({ left: 24, right: 24, top: 32, bottom: 32 })
      .borderRadius(24)
      .backgroundColor('rgba(255, 255, 255, 0.92)')
      .shadow({ radius: 24, color: 'rgba(23, 64, 153, 0.18)', offsetY: 10 })
      Blank()
    }
    .width('100%')
    .height('100%')
    .alignItems(HorizontalAlign.Center)
    .backgroundColor('#87CEEB')
  }
}
