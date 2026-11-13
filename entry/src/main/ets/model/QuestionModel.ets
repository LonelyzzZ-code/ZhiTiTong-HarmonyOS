export class QuestionModel {
  id: number = -1 // 题目唯一标识符
  exam_id: number = -1 // 题目所属的试卷编号
  type: string = '' // 题目类型（如单选题、多选题、判断题等）
  question: string = '' // 题目内容
  options: string[] = [] // 题目选项列表
  correct_answer: string = '' // 正确答案
  user_answer: string | null = '' // 用户的答案（如果用户未答题，则为 null）
  is_correct: number | null = -1 // 1为正确，0为错误，null为未作答
  analysis: string = '' // 答案解析
}
