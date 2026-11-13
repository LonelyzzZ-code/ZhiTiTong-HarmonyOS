import { Constants } from "../common/Constants";
import { SubjectItem } from "../comp/exam/SubjectItem";
import { ExamSubjectModel } from "../model/ExamModel";
@Component
export struct ExamSubject {
  @State subjectList: ExamSubjectModel[] = [
    {
      id: 0,
      name: '鸿蒙初级认证',
      total_exams: 10,
      finished_count: 6
    },
    {
      id: 1,
      name: '鸿蒙中级认证',
      total_exams: 10,
      finished_count: 6
    },
    {
      id: 2,
      name: '鸿蒙高级认证',
      total_exams: 10,
      finished_count: 6
    },
    {
      id: 3,
      name: '鸿蒙专家认证',
      total_exams: 10,
      finished_count: 6
    }
  ];
  build() {
      Flex({ direction: FlexDirection.Column }) {
        Text("科目列表")
          .width(Constants.FULL_PARENT)
          .fontSize(Constants.SUBJECT_TITLE_FONT_SIZE)
          .fontWeight(FontWeight.Bold)
          .fontColor(Color.White)
          .textAlign(TextAlign.Center)
          .margin({ top: Constants.MARGIN_20, bottom: Constants.MARGIN_20 })
        Grid() {
          ForEach(this.subjectList, (item: ExamSubjectModel) => {
            GridItem() {
              SubjectItem({ item })
            }
          })
        }
        .width(Constants.FULL_PARENT)
        .columnsTemplate('1fr 1fr')
        .columnsGap(Constants.GRID_COLUMNS_GAP_SM)
        .rowsGap(Constants.GRID_ROWS_GAP_SM)
        .padding({ left: Constants.PADDING_20, right: Constants.PADDING_20 })
      }
      .width(Constants.FULL_PARENT)
      .height(Constants.FULL_PARENT)
      .backgroundColor($r('app.color.exam_subject_background'))
    }
}