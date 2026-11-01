# 农户管理系统

一个前后端分离的农业综合管理平台。后端采用 Spring Boot 多模块架构，前端采用 Vue 3 + TypeScript，覆盖系统管理、仓库管理与种植管理三大业务域。

## 功能模块

- **系统管理**：用户、角色、权限、字典、操作日志、登录日志，基于 Spring Security + JWT 实现认证与鉴权
- **仓库管理**：仓库与库区、商品及分类品牌、往来单位、入库、出库、调拨、盘点、库存与统计
- **种植管理**：地块（支持高德地图绘制边界）、种植批次、种质资源、农资、机械、种植任务、雇员

## 项目结构

```
农户管理系统/
├── farm/                     # 后端 Maven 多模块聚合项目
│   ├── farm_common/          # 通用模块：统一返回结果、异常处理、工具类
│   ├── farm_system/          # 系统模块：用户、角色、权限、字典、日志、认证
│   ├── farm_warehousing/     # 仓储模块：仓库、库区、商品、入库、出库、盘点、统计
│   ├── farm_plant/           # 种植模块：地块、批次、种质、农资、机械、任务、雇员
│   ├── farm_main/            # 主启动模块：聚合各模块并提供统一配置
│   ├── api_documentation.md  # 后端接口文档
│   └── pom.xml               # 父 POM，统一依赖版本
├── farm-ui/                  # 前端 Vue 3 项目
│   ├── src/
│   │   ├── api/              # 接口封装
│   │   ├── components/       # 公共组件
│   │   ├── layout/           # 布局组件
│   │   ├── router/           # 路由配置
│   │   ├── store/            # Pinia 状态管理
│   │   ├── utils/            # 工具函数
│   │   └── views/            # 业务页面
│   ├── README.md             # 前端项目说明
│   └── vite.config.ts        # Vite 配置（含 /api 代理）
└── sql/
    └── farm.sql              # 数据库初始化脚本
```

## 技术栈

### 后端

| 技术 | 版本 / 说明 |
| --- | --- |
| Java | 21 |
| Spring Boot | 3.5.0 |
| Spring Security + JWT | 认证与鉴权 |
| MyBatis-Plus | 3.5.12 |
| MySQL | 8+ |
| Redis | 6+ |
| 构建 | Maven 多模块 |

### 前端

| 技术 | 版本 / 说明 |
| --- | --- |
| Vue | 3.4+ |
| TypeScript | 5.3 |
| Vite | 5 |
| Element Plus | 2.4+ |
| Pinia | 状态管理（含持久化） |
| Vue Router | 4 |
| Axios | HTTP 请求 |
| ECharts | 图表展示 |
| UnoCSS | 原子化 CSS |

## 环境要求

- JDK 21
- Maven 3.8+
- MySQL 8+
- Redis 6+
- Node.js 16+
- npm 8+ / yarn 1.22+ / pnpm 8+

## 快速开始

### 1. 初始化数据库

```sql
CREATE DATABASE farm DEFAULT CHARACTER SET utf8mb4;
USE farm;
SOURCE sql/farm.sql;
```

### 2. 启动后端

复制环境变量模板并按本机环境修改数据库、Redis 与 JWT 配置：

```bash
cd farm
copy .env.example .env
```

在 `farm` 目录执行：

```bash
mvn clean install
mvn -pl farm_main spring-boot:run
```

后端默认运行在 `http://localhost:8080`。

### 3. 启动前端

```bash
cd farm-ui
copy .env.example .env
npm install
npm run dev
```

前端默认运行在 `http://localhost:3000`，开发代理会将 `/api` 转发到 `http://localhost:8080`。

### 4. 构建部署

```bash
cd farm-ui
npm run build
```

## 配置说明

数据库、Redis、JWT 以及高德地图 Key 等敏感信息统一放在 `.env` 文件中，`.env` 已被 Git 忽略，不会提交到仓库。

| 位置 | 说明 |
| --- | --- |
| `farm/.env` | 后端配置，模板见 `farm/.env.example` |
| `farm-ui/.env` | 前端配置，模板见 `farm-ui/.env.example` |

`application.yml` 通过 `${变量名:默认值}` 读取环境变量，未提供 `.env` 时使用本地默认值。部署到公网前请务必修改默认密码与 JWT 密钥。

高德地图 Key 通过前端 `farm-ui/.env` 的 `VITE_AMAP_API_KEY` 配置，详见 `farm-ui/AMAP_SETUP.md`。

## 相关文档

- 后端接口文档：`farm/api_documentation.md`
- 前端说明：`farm-ui/README.md`

## 许可证

本项目仅用于学习与交流，如需商用请自行评估。
