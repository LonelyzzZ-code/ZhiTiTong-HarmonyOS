import { ExamModel } from '../model/ExamModel';

@Entry
@Component
struct Shijuankapian {
  private swiperImages: Resource[] = [
    $r('app.media.swiper1'),
    $r('app.media.swiper2'),
    $r('app.media.swiper3'),
    $r('app.media.swiper4'),
    $r('app.media.swiper5'),
    $r('app.media.swiper6')
  ]
  @State ExamList: ExamModel[] = [
    {
      id: 1,
      subject_id: 1,
      title: '鸿蒙认证高级-模拟题',
      score: 75,
      total_questions: 60,
      answered_questions: 30
    },
    {
      id: 2,
      subject_id: 2,
      title: '鸿蒙认证中级-模拟题',
      score: 95,
      total_questions: 60,
      answered_questions: 45
    },
    {
      id: 3,
      subject_id: 3,
      title: '鸿蒙认证初级-模拟题',
      score: 100,
      total_questions: 60,
      answered_questions: 60
    }
  ]
  build() {
    Column({ space: 12 }) {
      Swiper() {
        ForEach(this.swiperImages, (img: Resource) => {
          Image(img)
            .width('100%')
            .height('100%')
            .objectFit(ImageFit.Cover)
        }, (img: Resource, index: number) => index.toString())
      }
      .width('100%')
      .height(160)
      .borderRadius(16)
      .clip(true)
      .autoPlay(true)
      .interval(3000)
      .loop(true)
      .indicator(new DotIndicator()
        .color('rgba(255, 255, 255, 0.5)')
        .selectedColor('#FFFFFF'))
      Text("随机试卷")
        .fontSize(22)
        .fontWeight(FontWeight.Bold)
        .width('100%')
      ForEach(this.ExamList, (item: ExamModel) => {
        Row({ space: 12 }) {
          Image($r("app.media.exam_icon"))
            .width(56)
            .height(56)
          Column({ space: 6 }) {
            Text(item.title)
              .fontSize(16)
              .fontWeight(FontWeight.Medium)
              .fontColor('#1A1A1A')
              .maxLines(1)
              .textOverflow({ overflow: TextOverflow.Ellipsis })
            Text(`已答 ${item.answered_questions}/${item.total_questions} 题`)
              .fontSize(12)
              .fontColor('#999999')
            Progress({ value: item.answered_questions, total: item.total_questions })
              .width('100%')
              .color('#4F8CFF')
              .style({ strokeWidth: 6 })
          }
          .layoutWeight(1)
          .alignItems(HorizontalAlign.Start)
          Button("开始刷题")
            .height(32)
            .fontSize(14)
            .fontColor(Color.White)
            .backgroundColor('#4F8CFF')
            .onClick(() => {

            })
        }
        .width('100%')
        .padding(12)
        .borderRadius(16)
        .backgroundColor(Color.White)
        .alignItems(VerticalAlign.Center)
        .shadow({ radius: 12, color: 'rgba(0, 0, 0, 0.06)', offsetY: 4 })
      }, (item: ExamModel) => item.id.toString())
    }
    .width('100%')
    .height('100%')
    .padding(16)
    .linearGradient({
      angle: 180,
      colors: [['#DCE9FF', 0], ['#F5F6F8', 1]]
    })
    .alignItems(HorizontalAlign.Center)
  }
}
