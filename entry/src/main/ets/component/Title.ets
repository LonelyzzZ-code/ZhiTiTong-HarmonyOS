import { Constants } from '../common/Constants';

@Component
export struct Title{
  build() {
    Column() {
      RelativeContainer() {
        Image($r('app.media.back'))
          .width(Constants.TITLE_FONT_SIZE)
          .alignRules({
            left:{anchor:'__container__',align:HorizontalAlign.Start},
            center:{anchor:'__container__',align:VerticalAlign.Center}
          })
          .offset({left:Constants.SPACE_SIZE})

        Text($r('app.string.exam_list'))
          .fontSize(Constants.TITLE_FONT_SIZE)
          .fontColor(Color.White)
          .fontWeight(Constants.BOLD_WEIGHT)
          .alignRules({
            middle:{anchor:'__container__',align:HorizontalAlign.Center},
            center:{anchor:'__container__',align:VerticalAlign.Center}
          })
      }
      .width('100%')
      .height(Constants.NAV_HEIGHT)
      .backgroundColor($r('app.color.home_bg_color'))
    }
  }
}