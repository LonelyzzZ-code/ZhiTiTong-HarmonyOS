import { Constants } from "../../common/Constants";
import { QuestionModel } from "../../model/QuestionModel";
import { ExamTitle } from "../ExamTitle";
import { AnswerResult } from "./AnswerResult";

@Component
export struct ExamDetail {
  @State questionList: QuestionModel[] = [
    {
      "id": 1,
      "exam_id": 1,
      "type": "true-false",
      "question": "ArkTS支持any类型",
      "options": ["正确", "错误"],
      "correct_answer": "错误",
      "analysis": "ArkTS是类型严谨语言，不支持使用any",
      "user_answer": '正确',
      "is_correct": 0
    },
    {
      "id": 2,
      "exam_id": 1,
      "type": "true-false",
      "question": "首选项preferences是以Key-Value形式存储数据，其中Key是可以重复",
      "options": ["正确", "错误"],
      "correct_answer": "错误",
      "analysis": "key不允许重复，如果key重复后面的覆盖前面的",
      "user_answer": null,
      "is_correct": null
    },
    {
      "id": 3,
      "exam_id": 1,
      "type": "true-false",
      "question": "每一个自定义组件都有自己的生命周期",
      "options": ["正确", "错误"],
      "correct_answer": "正确",
      "analysis": "每个组件都有自己独立的生命周期",
      "user_answer": null,
      "is_correct": null
    }
  ]
  @State currentIndex: number = 0
  alphabet: string = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
  // 是否是预览模式，如果是预览模式，不能够答题，只能查看，不能够交卷
  @State previewMode: boolean = false
  @Consume navPathStack: NavPathStack

  build() {
    NavDestination(){
      Column() {
        // 上部分区域-标题
        ExamTitle({
          titleText: $r('app.string.exam_detail'),
          titleColor: Color.White,
          back: $r('app.media.back_green'),
          backAction: () => {
            this.navPathStack.pop()
          }
        })
        // 下部分区域-答题
        Column() {
          // 第一个剩余题数区域
          Text() {
            Span(`剩余题数：${this.currentIndex + 1}`)
              .fontColor($r('app.color.orange_color'))
            Span(`/${this.questionList.length}`)
              .fontColor($r('app.color.gray_color'))
          }
          .fontSize(Constants.NORMAL_SIZE)
          .fontWeight(Constants.BOLD_WEIGHT)
          .textAlign(TextAlign.Center)
          .width(Constants.FULL_PARENT)
          .height(Constants.SUBTITLE_HEIGHT)
          .backgroundColor($r('app.color.light_gray_yellow'))
          .borderRadius({
            topLeft: Constants.PANEL_SIZE,
            topRight: Constants.PANEL_SIZE
          })

          // 第二个答题区域
          /*Column({
            space: Constants.SPACE_SIZE
          }) {
            Image($r('app.media.single'))
              .width(Constants.QUESTION_TYPE_WIDTH)

            Text('1. ArkTS支持any类型')

            // 选项区域
            Text('A.正确')
              .width('100%')
              .height(Constants.INPUT_HEIGHT)
              .backgroundColor($r('app.color.light_gray_color'))
              .borderRadius(Constants.QUESTION_OPTION_BORDER_RADIUS)
              .padding({ left: Constants.SPACE_SIZE })

            Text('B.错误')
              .width('100%')
              .height(Constants.INPUT_HEIGHT)
              .backgroundColor($r('app.color.light_gray_color'))
              .borderRadius(Constants.QUESTION_OPTION_BORDER_RADIUS)
              .padding({ left: Constants.SPACE_SIZE })
          }
          .width('100%')
          .layoutWeight(1)
          .padding(Constants.SPACE_SIZE)
          .alignItems(HorizontalAlign.Start)*/
          ForEach(this.questionList, (item: QuestionModel, index: number) => {
            if (this.currentIndex == index) {
              this.QuestionBuilder(item, index);
            }
          })

          // 第三个题目切换区域
          Row() {
            Image($r('app.media.prev'))
              .width(Constants.ARROW_WIDTH)
              .onClick(() => {
                if (this.currentIndex > 0) {
                  this.currentIndex--;
                }
              })
            /*Image($r('app.media.next'))
              .width(Constants.ARROW_WIDTH)*/
            if (this.currentIndex < this.questionList.length - 1) {
              Image($r('app.media.next'))
                .width(Constants.ARROW_WIDTH)
                .onClick(() => {
                  if (this.currentIndex < this.questionList.length - 1) {
                    this.currentIndex++;
                  }
                })
            } else {
              Button($r('app.string.submit'))
                .width(Constants.SUBMIT_BUTTON_WIDTH)
                .height(Constants.SUBMIT_BUTTON_HEIGHT)
                .backgroundColor($r('app.color.submit_button_bgc'))// 预览模式下不显示交卷按钮
                .visibility(this.previewMode ? Visibility.Hidden : Visibility.Visible)
                .onClick(() => {
                  this.navPathStack.pushPath(AnswerResult)
                })
            }
          }
          .width(Constants.FULL_PARENT)
          .height(Constants.ARROW_WIDTH)
          .justifyContent(FlexAlign.SpaceAround)

        }
        .width(Constants.FULL_PARENT)
        .layoutWeight(1)
        .backgroundColor(Color.White)
        .borderRadius({
          topLeft: Constants.PANEL_SIZE,
          topRight: Constants.PANEL_SIZE
        })
      }
      .width(Constants.FULL_PARENT)
      .height(Constants.FULL_PARENT)
      .backgroundColor($r('app.color.green_color'))
    }
    .hideTitleBar(true)
  }

  @Builder
  QuestionBuilder(item: QuestionModel, index: number) {
    Column({
      space: Constants.SPACE_SIZE
    }) {
      Image(item.type === 'true-false' ? $r('app.media.true_false') : $r('app.media.single'))
        .width(Constants.QUESTION_TYPE_WIDTH)

      Text(`${index + 1}. ${item.question}`)
        .fontSize(Constants.QUESTION_TEXT_SIZE)

      // 选项区域
      ForEach(item.options, (option: string, i: number) => {
        Text(`${this.alphabet[i]}. ${option}`)
          .width(Constants.FULL_PARENT)
          .height(Constants.QUESTION_OPTION_HEIGHT)
          .backgroundColor(this.optionBgColorFactory(item, option))
          .fontColor(this.optionFontColorFactory(item, option))
          .borderRadius(Constants.QUESTION_OPTION_BORDER_RADIUS)
          .padding({ left: Constants.QUESTION_OPTION_PADDING })
          .fontSize(Constants.QUESTION_OPTION_TEXT_SIZE)
      })

      // 解析区域
      if (item.user_answer) {
        Row() {
          Text() {
            Span('正确答案：')
            Span(this.alphabet[item.options.indexOf(item.correct_answer)])
              .fontColor($r('app.color.right_answer_font_color'))
          }

          Text() {
            Span('已选答案：')
            Span(this.alphabet[item.options.indexOf(item.user_answer)])
              .fontColor(item.is_correct ? $r('app.color.right_answer_font_color') :
              $r('app.color.wrong_answer_font_color'))
          }
        }
        .width(Constants.FULL_PARENT)
        .justifyContent(FlexAlign.SpaceBetween)

        Column({ space: Constants.SPACE_SIZE }) {
          Text('解析：')
            .fontWeight(Constants.BOLD_WEIGHT)
          Text(item.analysis)
            .fontColor(Color.Gray)
        }
        .alignItems(HorizontalAlign.Start)
      }
    }
    .width(Constants.FULL_PARENT)
    .layoutWeight(1)
    .padding(Constants.SPACE_SIZE)
    .alignItems(HorizontalAlign.Start)
  }

  optionFontColorFactory(item: QuestionModel, option: string) {
    if (option === item.correct_answer && item.user_answer) {
      return $r('app.color.right_answer_font_color'); // 如果选项是正确答案，则立即返回正确的颜色
    }

    if (option === item.user_answer && !item.is_correct) {
      return $r('app.color.wrong_answer_font_color'); // 如果用户选择了这个选项并且答案是错的，则立即返回错误的颜色
    }

    return Color.Black; // 否则返回默认颜色
  }

  optionBgColorFactory(item: QuestionModel, option: string) {
    if (option === item.correct_answer && item.user_answer) {
      return $r('app.color.right_answer_bg_color'); // 如果选项是正确答案，则立即返回正确的颜色
    }

    if (option === item.user_answer && !item.is_correct) {
      return $r('app.color.wrong_bg_color'); // 如果用户选择了这个选项并且答案是错的，则立即返回错误的颜色
    }

    return $r('app.color.un_bg_color'); // 否则返回默认颜色
  }
}