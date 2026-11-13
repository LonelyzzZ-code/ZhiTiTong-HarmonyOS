import { Constants } from '../common/Constants';

@Component
export struct ExamTitle {

  back: Resource = $r('app.media.back') // 返回按钮图片
  titleText: ResourceStr = '' // 标题文本
  titleColor: Color | Resource = Color.White // 标题颜色
  backAction: () => void = () => {} // 返回逻辑


  build() {
    RelativeContainer() {
      Image(this.back)
        .width(Constants.TITLE_FONT_SIZE)
        .alignRules({
          left: { anchor: '__container__', align: HorizontalAlign.Start },
          center: { anchor: '__container__', align: VerticalAlign.Center }
        })
        .offset({ left: Constants.SPACE_SIZE })
        .onClick(this.backAction)

      Text(this.titleText)
        .fontSize(Constants.TITLE_FONT_SIZE )
        .fontColor(this.titleColor)
        .fontWeight(Constants.BOLD_WEIGHT)
        .alignRules({
          middle: { anchor: '__container__', align: HorizontalAlign.Center },
          center: { anchor: '__container__', align: VerticalAlign.Center }
        })
    }
    .width(Constants.FULL_PARENT)
    .height(Constants.NAV_HEIGHT)
  }
}