import { hilog } from '@kit.PerformanceAnalysisKit'

/**
 * 日志工具类：统一通过 hilog 输出
 * 使用 %{public}s 保证参数完整显示（hilog 默认会将未标记的参数脱敏为 <private>）
 */
export class Logger {
  private static readonly DOMAIN: number = 0x0000
  private static readonly TAG: string = 'ZhiTiTong'

  static debug(...msgs: Array<string | number>): void {
    hilog.debug(Logger.DOMAIN, Logger.TAG, '%{public}s', msgs.join(' '))
  }

  static info(...msgs: Array<string | number>): void {
    hilog.info(Logger.DOMAIN, Logger.TAG, '%{public}s', msgs.join(' '))
  }

  static warn(...msgs: Array<string | number>): void {
    hilog.warn(Logger.DOMAIN, Logger.TAG, '%{public}s', msgs.join(' '))
  }

  static error(...msgs: Array<string | number>): void {
    hilog.error(Logger.DOMAIN, Logger.TAG, '%{public}s', msgs.join(' '))
  }
}
