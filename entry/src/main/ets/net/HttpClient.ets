import { http } from '@kit.NetworkKit'
import { BusinessError } from '@kit.BasicServicesKit'
import { Logger } from '../utils/Logger'

// 基础地址：集成到新项目时只需修改这里
export const BASE_URL: string = 'http://101.245.101.187:3000';
// export const BASE_URL: string = 'https://api.admit-pro.com';

/**
 * 通用 HTTP 客户端：统一处理请求头、token 携带、状态码校验、日志输出与资源释放
 * 成功时 resolve 响应体字符串，失败/异常时 reject 错误描述（日志已统一输出）
 */
export class HttpClient {
  private static token: string = '';

  /** 登录成功后调用，后续所有请求自动携带 authorization 头 */
  static setToken(token: string): void {
    HttpClient.token = token;
  }

  /** 核心请求方法 */
  static request(method: http.RequestMethod, url: string, extraData?: object): Promise<string> {
    return new Promise<string>((resolve, reject) => {
      const httpRequest = http.createHttp();
      const options: http.HttpRequestOptions = {
        method: method,
        header: {
          'content-Type': 'application/json',
          'authorization': HttpClient.token
        },
        extraData: extraData
      };
      httpRequest.request(url, options)
        .then((httpResponse: http.HttpResponse) => {
          if (httpResponse.responseCode == 200) {
            const result: string = httpResponse.result as string;
            Logger.info(`[${method}] ${url} 成功: ${result}`);
            resolve(result);
          } else {
            const msg: string = `请求失败，响应状态码 ${httpResponse.responseCode}`;
            Logger.info(`[${method}] ${url} ${msg}`);
            reject(msg);
          }
        })
        .catch((err: BusinessError) => {
          const msg: string = JSON.stringify(err);
          Logger.error(`[${method}] ${url} 异常: ${msg}`);
          reject(msg);
        })
        .finally(() => {
          httpRequest.destroy();
        })
    })
  }

  static get(url: string): Promise<string> {
    return HttpClient.request(http.RequestMethod.GET, url);
  }

  static post(url: string, extraData?: object): Promise<string> {
    return HttpClient.request(http.RequestMethod.POST, url, extraData);
  }

  static put(url: string, extraData?: object): Promise<string> {
    return HttpClient.request(http.RequestMethod.PUT, url, extraData);
  }

  static delete(url: string): Promise<string> {
    return HttpClient.request(http.RequestMethod.DELETE, url);
  }
}
