import { ExamList } from '../view/ExamList';
import { ExamSubject } from '../view/ExamSubject';
import { MultiNavPathStack } from '@ohos.arkui.advanced.MultiNavigation';
import { Exam } from '../comp/exam/Exam';
import { ExamDetail } from '../comp/exam/ExamDetail';
import { AnswerResult } from '../comp/exam/AnswerResult';

@Entry
@Component
struct Home {
  @State currentIndex: number = 0
  @Provide navPathStack :NavPathStack = new NavPathStack()
  @Builder pageMap(name: string){
    if(name === "Exam"){
      Exam()
    }
    else if(name === "ExamDetail"){
      ExamDetail()
    }
    else if(name === "AnswerResult"){
      AnswerResult()
    }
  }
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
    Navigation(this.navPathStack){
      Tabs(){
        TabContent() {
          ExamList()
        }.tabBar(this.tarBar($r("app.media.home"),$r("app.media.home_active"),$r("app.string.recommend"), 0))
        TabContent(){
          ExamSubject()
        }.tabBar(this.tarBar($r("app.media.exam"),$r("app.media.exam_active"),$r("app.string.answer"), 1))
        TabContent(){

        }.tabBar(this.tarBar($r("app.media.user"),$r("app.media.user_active"),$r("app.string.mine"), 2))
      }.barPosition(BarPosition.End) //vertical(true)导航栏在侧边
      .onChange((index:number) => {
        console.log("当前页签的索引为：" + index);
        this.currentIndex = index;
      })
    }.navDestination(this.pageMap)
    .hideTitleBar(true)
    }
}