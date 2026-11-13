import { QuestionModel } from "./QuestionModel"

export class AnswerResultModel {
  questions: QuestionModel[] = [] // 所有题目数组
  score: number = 0 // 分数
  right_count: number = 0 // 正确题目数量
  wrong_count: number = 0 // 错误题目数量
  total_count: number = 0 // 总题目数量
}