export class ExamSubjectModel {
  id: number = 0
  name: string = ''
  total_exams: number = 0
  finished_count: number = 0
}

export class ExamModel {
  id: number = 0 // 试卷ID
  subject_id: number = 0 // 试卷所属科目ID
  title: string = '' // 试卷标题
  score: number = 0 // 试卷分数
  total_questions: number = 0 // 试卷总题数
  answered_questions: number = 0 // 已答题数
}