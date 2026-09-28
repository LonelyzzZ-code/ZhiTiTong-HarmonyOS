//List组件的使用：ForEach + 数据模型渲染试卷卡片
//List组件的使用：ForEach + 数据模型渲染试卷卡片
import { ExamModel } from '../model/ExamModel'
import { Constants } from '../common/Constants'

@Entry
@Component
struct ExamListPage {
  @State examList: ExamModel[] = [
  {
    id: 1,
    subject_id: 1,
    title: '鸿蒙认证初级-选择题',
    score: 60,
    total_questions: 20,
    answered_questions: 0
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
  },
  {
    id: 4,
    subject_id: 1,
    title: '鸿蒙认证初级-编程题',
    score: 20,
    total_questions: 5,
    answered_questions: 3
  },
  {
    id: 5,
    subject_id: 1,
    title: '鸿蒙认证初级-编程题',
    score: 20,
    total_questions: 5,
    answered_questions: 3
  },
  {
    id: 6,
    subject_id: 1,
    title: '鸿蒙认证初级-编程题',
    score: 20,
    total_questions: 5,
    answered_questions: 3
  },
  {
    id: 7,
    subject_id: 1,
    title: '鸿蒙认证初级-编程题',
    score: 20,
    total_questions: 5,
    answered_questions: 3
  },
  {
    id: 8,
    subject_id: 1,
    title: '鸿蒙认证初级-编程题',
    score: 20,
    total_questions: 5,
    answered_questions: 3
  },
  ]

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

      List({ space: Constants.EXAM_ITEM_MARGIN }){
        ForEach(this.examList,(exam:ExamModel) => {
          ListItem(){
            Column(){
              Row({ space: Constants.SPACE_SIZE }){
                Image($r("app.media.lock"))
                  .width(Constants.EXAM_ITEM_HEIGHT)
                  .height(Constants.EXAM_ITEM_HEIGHT)
                Text(exam.title)
                  .layoutWeight(1)
                  .fontSize(Constants.TAB_TEXT_SIZE)
                  .fontColor($r('app.color.black_color'))
                Image($r("app.media.hava_study"))
                  .width(Constants.EXAM_ITEM_HEIGHT)
                  .height(Constants.EXAM_ITEM_HEIGHT)
              }
              .alignItems(VerticalAlign.Center)

              Divider()
                .color($r('app.color.divider_color'))
            }
            .width(Constants.FULL_PARENT)
            .padding(Constants.Column_PADDING)
            .backgroundColor(Color.White)
            .borderRadius(Constants.BORDER_RADIUS_5)
          }
        },(exam: ExamModel) => exam.id.toString())
      }.layoutWeight(1)
    }
    .width('100%')
    .height('100%')
  }
}
