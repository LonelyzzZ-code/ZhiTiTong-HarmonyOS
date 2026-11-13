import { Constants } from "../../common/Constants"
import { AnswerResultModel } from "../../model/AnswerResultModel"
import { QuestionModel } from "../../model/QuestionModel"
import { ExamTitle } from "../ExamTitle"
@Component
export struct AnswerResult {
  answerResult: AnswerResultModel = {
    "questions": [
      {
        "id": 1,
        "exam_id": 1,
        "type": "true-false",
        "question": "ArkTS支持any类型",
        "options": ["正确", "错误"],
        "correct_answer": "错误",
        "analysis": "ArkTS是类型严谨语言，不支持使用any",
        "user_answer": "正确",
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
        "user_answer": "错误",
        "is_correct": 1
      },
      {
        "id": 3,
        "exam_id": 1,
        "type": "true-false",
        "question": "每一个自定义组件都有自己的生命周期",
        "options": ["正确", "错误"],
        "correct_answer": "正确",
        "analysis": "每个组件都有自己独立的生命周期",
        "user_answer": "正确",
        "is_correct": 1
      }
    ],
    "score": 66,
    "right_count": 2,
    "wrong_count": 1,
    "total_count": 3
  }
  @Consume navPathStack: NavPathStack

  build(){
    NavDestination(){
      Column() {
        // 上部分区域 - 标题
        ExamTitle({
          titleText: $r('app.string.answer_result'),
          titleColor: $r('app.color.primary_color'),
          back: $r('app.media.result_back'),
          backAction:() => {
            this.navPathStack.pop()
          }
        })

        // 中间区域 - 分数
        Row() {
          // 左侧区域 - 分数
          Column() {
            Text('本次考试\n最终得分')
              .fontSize(Constants.SCORE_TITLE_FONT_SIZE)
              .fontWeight(FontWeight.Bold)
              .fontColor($r('app.color.orange_color'))

            Column() {
              Text(`${this.answerResult.score}`)
                .fontSize(Constants.SCORE_FONT_SIZE)
                .fontWeight(FontWeight.Bold)
                .fontColor($r('app.color.orange_color'))

              Text('/100分')
                .fontWeight(FontWeight.Bold)
                .fontSize(Constants.NORMAL_SIZE)
                .fontColor($r('app.color.orange_color'))
            }
            .width('75%')
            .aspectRatio(1)
            .justifyContent(FlexAlign.Center)
            .borderRadius('50%')
            .backgroundColor($r('app.color.light_orange_color'))
            .margin({ top: Constants.MARGIN_20 })
          }
          .layoutWeight(1)

          // 中间区域 - 分割线
          Divider()
            .width(1)
            .height('80%')
            .vertical(true)
            .color(Color.Black)

          // 右侧区域 - 答题情况
          Column({ space: 8 }) {

            Text($r('app.string.total_question'))
              .fontWeight(FontWeight.Bold)
              .margin({ top: Constants.MARGIN_10 })
            Text() {
              Span(`${this.answerResult.total_count}`)
                .fontSize(Constants.TITLE_FONT_SIZE)
              Span('题')
            }
            .fontWeight(FontWeight.Bold)
            .margin({ bottom: Constants.MARGIN_25 })

            Text($r('app.string.right_answer'))
              .fontWeight(FontWeight.Bold)
            Text() {
              Span(`${this.answerResult.right_count}`)
                .fontSize(Constants.TITLE_FONT_SIZE)
              Span('题')
            }
            .fontWeight(FontWeight.Bold)
            .fontColor($r('app.color.green_color'))
            .margin({ bottom: Constants.MARGIN_25 })

            Text($r('app.string.wrong_answer'))
              .fontWeight(FontWeight.Bold)
            Text() {
              Span(`${this.answerResult.wrong_count}`)
                .fontSize(Constants.TITLE_FONT_SIZE)
              Span('题')
            }
            .fontWeight(FontWeight.Bold)
            .fontColor($r('app.color.red_color'))
          }
          .width(Constants.ANSWER_DATA_WIDTH)
        }
        .width(Constants.FULL_PARENT)
        .aspectRatio(1.3)
        .backgroundColor(Color.White)
        .borderRadius(Constants.ANSWER_RESULT_PANEL_RADIUS)

        // 底部区域 - 答题卡
        Text($r('app.string.answer_card'))
          .fontWeight(FontWeight.Bold)
          .margin({ top: Constants.MARGIN_25, bottom: Constants.MARGIN_10 })
          .alignSelf(ItemAlign.Start)

        Column() {
          Row() {
            Text($r('app.string.question'))
            Image($r('app.media.answer_type'))
              .height(Constants.TITLE_FONT_SIZE)
              .margin({ top: Constants.MARGIN_15 })
          }
          .width(Constants.FULL_PARENT)
          .height(Constants.ANSWER_CARD_TITLE_HEIGHT)
          .justifyContent(FlexAlign.SpaceBetween)

          Grid() {
            /*GridItem() {
              Text('1')
                .fontColor($r('app.color.wrong_font_color'))
            }
            .height(Constants.GRID_ITEM_HEIGHT)
            .borderRadius(Constants.SMALL_SPACE)
            .backgroundColor($r('app.color.wrong_bg_color'))

            GridItem() {
              Text('2')
                .fontColor($r('app.color.un_font_color'))
            }
            .height(Constants.GRID_ITEM_HEIGHT)
            .borderRadius(Constants.SMALL_SPACE)
            .backgroundColor($r('app.color.un_bg_color'))

            GridItem() {
              Text('3')
                .fontColor($r('app.color.right_font_color'))
            }
            .height(Constants.GRID_ITEM_HEIGHT)
            .borderRadius(Constants.SMALL_SPACE)
            .backgroundColor($r('app.color.right_bg_color'))*/
            ForEach(this.answerResult.questions, (item: QuestionModel, index: number) => {
              GridItem() {
                Text(`${index + 1}`)
                  .fontColor(this.fontColorFactory(item.is_correct))
              }
              .height(Constants.ANSWER_CARD_ITEM_HEIGHT)
              .borderRadius(Constants.ANSWER_CARD_ITEM_RADIUS)
              .backgroundColor(this.bgColorFactory(item.is_correct))
            })
          }
          .width('100%')
          .layoutWeight(1)
          .columnsTemplate('1fr 1fr 1fr 1fr')
          .columnsGap(Constants.GRID_ITEM_COLUMNS_GAP)
          .rowsGap(Constants.GRID_ITEM_ROWS_GAP)

          Button($r('app.string.re_answer'))
            .width(Constants.RETRY_BUTTON_WIDTH)
            .height(Constants.RETRY_BUTTON_HEIGHT)
            .margin({ top: Constants.ITEM_SPACE })
        }
        .width(Constants.FULL_PARENT)
        .backgroundColor(Color.White)
        .borderRadius(Constants.ANSWER_RESULT_PANEL_RADIUS)
        .padding(Constants.SPACE_SIZE)
        .layoutWeight(1)
      }
      .width(Constants.FULL_PARENT)
      .height(Constants.FULL_PARENT)
      .backgroundColor($r('app.color.light_gray_color'))
      .padding(Constants.PADDING_14)
    }
    .hideTitleBar(true)
  }

  bgColorFactory(is_correct: number | null) {
    switch (is_correct) {
      case Constants.ANSWER_RIGHT:
        return $r('app.color.right_bg_color')
      case Constants.ANSWER_WRONG:
        return $r('app.color.wrong_bg_color')
      default:
        return $r('app.color.un_bg_color')
    }
  }

  fontColorFactory(is_correct: number | null) {
    switch (is_correct) {
      case Constants.ANSWER_RIGHT:
        return $r('app.color.right_font_color')
      case Constants.ANSWER_WRONG:
        return $r('app.color.wrong_font_color')
      default:
        return $r('app.color.un_font_color')
    }
  }
}