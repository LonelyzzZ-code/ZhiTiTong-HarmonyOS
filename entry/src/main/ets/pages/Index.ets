import { BusinessError } from '@kit.BasicServicesKit';
import { router } from '@kit.ArkUI';
import { Textinput } from '../component/TextInput';
import { ExamApi, RequestParams } from '../net/ExamApi';
import { Logger } from '../utils/Logger';

@Entry
@Component
struct Index {
  @State message: string = '欢迎使用智题通';
  @State password: string = '';
  @State username: string = '';
  @State isRegister: boolean = false;
  @State confirmPassword: string = '';
  doLogin() {
    if (this.username === '' || this.password === '') {
      this.getUIContext().getPromptAction().showToast({ message: '请输入用户名和密码' })
      return
    }
    const body: RequestParams = {
      username: this.username,
      password: this.password,
      avertar: ''
    };
    ExamApi.login(body)
      .then(() => {
        Logger.info('登录成功，用户名：', this.username)
        this.getUIContext().getPromptAction().showToast({ message: '登录成功' })
        router.replaceUrl({ url: 'pages/Home' })
      })
      .catch((err: string) => {
        Logger.error('登录失败，用户名：', this.username, '，原因：', err)
        this.getUIContext().getPromptAction().showToast({ message: `登录失败：${err}` })
      })
  };
  doReg() {
    this.getUIContext().getPromptAction().showToast({ message: '注册接口暂未接入' })
  };
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
        Textinput({ text1: $username, placeholder: '请输入用户名' })
        Textinput({ text1: $password, placeholder: '请输入密码' })
        if (this.isRegister) {
          Textinput({ text1: $confirmPassword, placeholder: '请确认密码' })
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
              this.doReg()
            } else {
              this.doLogin()
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
