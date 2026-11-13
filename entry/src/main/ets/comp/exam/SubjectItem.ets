import { Constants } from "../../common/Constants";
import { ExamSubjectModel } from "../../model/ExamModel";

@Component
export struct SubjectItem {
  @Consume navPathStack:NavPathStack
  item: ExamSubjectModel = {
    id: 0,
    name: '鸿蒙初级认证',
    total_exams: 10,
    finished_count: 6
  }

  build() {
    Column() {
      Row() {
        Image($r('app.media.exam_icon'))
          .width(Constants.WIDTH_80)
          .height(Constants.WIDTH_80)
          .borderRadius(Constants.BORDER_RADIUS_5)

        Button($r('app.string.begin_exam'))
          .fontSize(Constants.FONT_SIZE_10 )
          .fontColor(Color.White)
          .backgroundColor($r('app.color.exam_button_bgc'))
          .type(ButtonType.Normal)
          .width(60)
          .height(30)
          .borderRadius(5)
          .padding({
            top: 1,
            bottom: 1,
            left: 2,
            right: 2
          })
          .onClick(() => {
            this.navPathStack.pushPath({name: "Exam"})
          })



      }
      .width(Constants.FULL_PARENT)
      .alignItems(VerticalAlign.Bottom)
      .justifyContent(FlexAlign.SpaceBetween)

      Text(this.item.name)
        .id('title')
        .fontSize(Constants.SUBJECT_ITEM_TITLE_FONT_SIZE)
        .fontWeight(FontWeight.Bold)

      Text(`${this.item.finished_count}/${this.item.total_exams}节|已学进度:${(this.item.finished_count /
      this.item.total_exams * 100).toFixed(2)}%`)
        .fontSize(Constants.SUBJECT_ITEM_PROGRESS_FONT_SIZE )
        .fontColor('#bbb')

      Progress({ value: this.item.finished_count, total: this.item.total_exams })
        .height(2)

    }
    .width(Constants.FULL_PARENT)
    .height(Constants.FULL_PARENT)
    .justifyContent(FlexAlign.SpaceBetween)
    .alignItems(HorizontalAlign.Start)
    .aspectRatio(1.1)
    .borderRadius(10)
    .backgroundColor(Color.White)
    .padding(Constants.PADDING_SM_8)
    .backgroundImage($r('app.media.badge_bg'))
    .backgroundImagePosition(Alignment.TopEnd)

  }
}