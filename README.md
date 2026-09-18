# 智题通（ZhiTiTong）

基于 HarmonyOS ArkTS 开发的智能刷题学习应用，面向学生群体的日常练习与备考场景。

## 功能特性

- **登录模块**：账号密码校验，登录结果通过 Toast 实时反馈
- **页面路由**：登录成功后跳转主页（`router.pushUrl`），支持返回（`router.back`）
- **演示账号**：`123456` / `123456`，其他任意输入均提示登录失败

## 技术栈

| 项目 | 说明 |
|---|---|
| 操作系统 | HarmonyOS |
| 开发语言 | ArkTS |
| UI 框架 | ArkUI 声明式范式 |
| SDK 版本 | compatibleSdkVersion 6.1.0 (API 23) |
| 开发工具 | DevEco Studio |

## 项目结构

```
entry/src/main/ets/
├── entryability/
│   └── EntryAbility.ets      # 应用入口 Ability
├── entrybackupability/
│   └── EntryBackupAbility.ets
└── pages/
    ├── Index.ets             # 登录页（账号校验、Toast、路由跳转）
    └── mainpage.ets          # 主页（开发中）
```

## 快速开始

1. 使用 DevEco Studio 打开本项目（SDK 版本需满足 API 23 及以上）
2. `File > Sync and Refresh Project` 同步 oh_modules 依赖
3. 连接模拟器或真机，点击 Run 运行
4. 输入演示账号 `123456` / `123456` 登录

> 注意：登录校验逻辑当前为前端硬编码演示，接入真实后端前请勿用于生产环境。

## 相关文档

- [需求文档](REQUIREMENT.md)
