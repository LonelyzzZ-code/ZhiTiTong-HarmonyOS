import { Constants } from "../../common/Constants";
import { ExamModel } from "../../model/ExamModel";
import { ExamTitle } from "../ExamTitle";
import { ExamDetail } from "./ExamDetail";

@Component
export struct Exam {
  @State examList: ExamModel[] = [
    {
      id: 1,
      subject_id: 1,
      title: '鸿蒙认证初级-选择题',
      score: 60,
      total_questions: 0,
      answered_questions: 20
    },
    {
      id: 2,
      subject_id: 1,
      title: '鸿蒙认证初级-填空题',
      score: 20,
      total_questions: 10,
      answered_questions: 8
    },
    {
      id: 3,
      subject_id: 1,
      title: '鸿蒙认证初级-问答题',
      score: 20,
      total_questions: 5,
      answered_questions: 3
    }
  ]

  @Consume navPathStack: NavPathStack;

  build() {
      NavDestination(){
        Column() {
          // 上部分区域 - 标题
          ExamTitle({
            titleText: $r('app.string.exam_list'),
            titleColor: Color.White,
            back: $r('app.media.back'),
            backAction: () => {
              this.navPathStack.pop()
            }
          })

          // 下部分区域 - 试卷列表
          List({
            space: Constants.SPACE_SIZE
          }) {
            ForEach(this.examList, (item: ExamModel) => {
              ListItem() {
                this.ExamListItem(item)
              }
            })
          }
          .width(Constants.FULL_PARENT)
          .height(Constants.FULL_PARENT)
          .layoutWeight(1)
          .borderRadius({ topLeft: Constants.PANEL_SIZE, topRight: Constants.PANEL_SIZE })
          .padding({ top: Constants.PANEL_SIZE })
          .backgroundColor(Color.White)
        }
        .width(Constants.FULL_PARENT)
        .height(Constants.FULL_PARENT)
        .backgroundColor($r('app.color.primary_color'))
      }
      .hideTitleBar(true)
  }

  @Builder
  ExamListItem(exam: ExamModel) {
    Column() {
      Row() {
        Image(exam.total_questions ? $r('app.media.unlock') : $r('app.media.lock'))
          .width(Constants.EXAM_ITEM_HEIGHT)

        Text(exam.title)
          .fontSize(Constants.TAB_TEXT_SIZE)
          .fontWeight(Constants.BOLD_WEIGHT)
          .margin({ left: Constants.SPACE_SIZE, right: Constants.SPACE_SIZE })
          .layoutWeight(1)

        Image(exam.total_questions ? $r('app.media.hava_study') : $r('app.media.un_study'))
          .width(Constants.EXAM_ITEM_HEIGHT)
          .alignSelf(ItemAlign.End)
      }
      .width(Constants.FULL_PARENT)
      .justifyContent(FlexAlign.SpaceBetween)
      .onClick(() => {
        this.navPathStack.pushPath(ExamDetail)
      })
      Divider()
        .color($r('app.color.divider_color'))
    }
    .width(Constants.FULL_PARENT)
    .padding(Constants.Column_PADDING)

  }
}