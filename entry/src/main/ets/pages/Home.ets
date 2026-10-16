import { ExamList } from '../view/ExamList';

@Entry
@Component
struct Home {
  @State currentIndex: number = 0
  @Builder tarBar(img: Resource,img_active: Resource,title: Resource,index: number,){
    Column({space:5}){
      if(this.currentIndex === index){
        Image(img_active).width(25)
      }
      else {
        Image(img).width(25)
      }
      Text(title)
    }
  }
  build() {
    Tabs(){
      TabContent() {
        ExamList()
      }.tabBar(this.tarBar($r("app.media.home"),$r("app.media.home_active"),$r("app.string.recommend"), 0))
      TabContent(){

      }.tabBar(this.tarBar($r("app.media.exam"),$r("app.media.exam_active"),$r("app.string.answer"), 1))
      TabContent(){

      }.tabBar(this.tarBar($r("app.media.user"),$r("app.media.user_active"),$r("app.string.mine"), 2))
    }.barPosition(BarPosition.End) //vertical(true)导航栏在侧边
    .onChange((index:number) => {
      console.log("当前页签的索引为：" + index);
      this.currentIndex = index;
    })
  }
}