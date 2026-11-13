import { HttpClient, BASE_URL } from './HttpClient'
import { Logger } from '../utils/Logger'

export interface RequestParams {
  username: string;
  password: string;
  avertar: string;
}

interface IAnswer {
  questionId: number;
  userAnswer: string;
}

interface LoginResponse {
  message: string;
  data: RequestParams;
  token: string;
  code: number;
}

/**
 * 刷题业务接口层：路径集中定义，对照后端路由表修改即可
 * 返回值为响应体原始字符串，调用方按需 JSON.parse
 */
export class ExamApi {
  /** 登录：成功后自动保存 token，后续接口自动携带 */
  static login(body: RequestParams): Promise<string> {
    return HttpClient.post(BASE_URL + '/api/login', body)
      .then((result: string): string => {
        const data: LoginResponse = JSON.parse(result) as LoginResponse;
        HttpClient.setToken(data.token);
        Logger.info('登录成功，成功获取token', data.token);
        return data.token;
      })
  }

  /** 获取所有科目列表 */
  static getSubjects(): Promise<string> {
    return HttpClient.get(BASE_URL + '/api/subjects');
  }

  /** 获取某科目下试卷列表 */
  static getPapers(subjectId: number): Promise<string> {
    return HttpClient.get(BASE_URL + `/api/subjects/${subjectId}/papers`);
  }

  /** 获取某试卷下所有题目 */
  static getQuestions(paperId: number): Promise<string> {
    return HttpClient.get(BASE_URL + `/api/papers/${paperId}/questions`);
  }

  /** 提交单个用户答案 */
  static submitAnswer(paperId: number, questionId: number, userAnswer: string): Promise<string> {
    const answer: IAnswer = { questionId: questionId, userAnswer: userAnswer };
    return HttpClient.post(BASE_URL + `/api/papers/${paperId}/answers`, answer);
  }

  /** 交卷 */
  static submitPaper(paperId: number): Promise<string> {
    return HttpClient.post(BASE_URL + `/api/papers/${paperId}/submit`);
  }

  /** 查询某试卷是否有交卷记录 */
  static getRecord(paperId: number): Promise<string> {
    return HttpClient.get(BASE_URL + `/api/papers/${paperId}/record`);
  }

  /** 重置某试卷考试记录 */
  static resetRecord(paperId: number): Promise<string> {
    return HttpClient.delete(BASE_URL + `/api/papers/${paperId}/record`);
  }

  /** 获取随机试卷列表 */
  static getRandomPapers(): Promise<string> {
    return HttpClient.get(BASE_URL + '/api/papers/random');
  }

  /** 查询用户信息 */
  static getUserInfo(): Promise<string> {
    return HttpClient.get(BASE_URL + '/api/user');
  }

  /** 更新用户信息 */
  static updateUserInfo(body: RequestParams): Promise<string> {
    return HttpClient.put(BASE_URL + '/api/user', body);
  }
}
