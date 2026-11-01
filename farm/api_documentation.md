# API Documentation

## UserController

---
### 根据Id查找用户

> BASIC

**Path:** /user/getUserByID

**Method:** GET

**Desc:**

根据Id查找用户


> REQUEST

**Query:**

| name | value | required | desc |
| ------------ | ------------ | ------------ | ------------ |
| id |  | NO | 用户Id |


> RESPONSE

**Body:**

| name | type | desc |
| ------------ | ------------ | ------------ |
| code | int | 状态码 （成功200，失败其他） |
| msg | string | 提示信息 |
| data | object | 返回数据 |
| &ensp;&ensp;&#124;─userId | long | 用户ID |
| &ensp;&ensp;&#124;─userName | string | 用户账号 |
| &ensp;&ensp;&#124;─nickName | string | 用户昵称 |
| &ensp;&ensp;&#124;─email | string | 用户邮箱 |
| &ensp;&ensp;&#124;─phonenumber | string | 手机号码 |
| &ensp;&ensp;&#124;─sex | string | 用户性别（0男 1女 2未知） |
| &ensp;&ensp;&#124;─avatar | string | 头像地址 |
| &ensp;&ensp;&#124;─password | string | 密码 |
| &ensp;&ensp;&#124;─status | string | 账号状态（0正常 1停用） |
| &ensp;&ensp;&#124;─loginIp | string | 最后登录IP |
| &ensp;&ensp;&#124;─loginDate | string | 最后登录时间 |
| &ensp;&ensp;&#124;─pwdUpdateDate | string | 密码最后更新时间 |
| &ensp;&ensp;&#124;─createBy | string | 创建者 |
| &ensp;&ensp;&#124;─createTime | string | 创建时间 |
| &ensp;&ensp;&#124;─updateBy | string | 更新者 |
| &ensp;&ensp;&#124;─updateTime | string | 更新时间 |
| &ensp;&ensp;&#124;─remark | string | 备注 |
| &ensp;&ensp;&#124;─roles | object[] | 用户角色列表（非数据库字段） |
| &ensp;&ensp;&ensp;&ensp;&#124;─roleId | long | 角色ID |
| &ensp;&ensp;&ensp;&ensp;&#124;─roleName | string | 角色名称 |
| &ensp;&ensp;&ensp;&ensp;&#124;─roleSort | int | 显示顺序 |
| &ensp;&ensp;&ensp;&ensp;&#124;─status | string | 角色状态（0正常 1停用） |
| &ensp;&ensp;&ensp;&ensp;&#124;─createBy | string | 创建者 |
| &ensp;&ensp;&ensp;&ensp;&#124;─createTime | string | 创建时间 |
| &ensp;&ensp;&ensp;&ensp;&#124;─updateBy | string | 更新者 |
| &ensp;&ensp;&ensp;&ensp;&#124;─updateTime | string | 更新时间 |
| &ensp;&ensp;&ensp;&ensp;&#124;─remark | string | 备注 |
| &ensp;&ensp;&ensp;&ensp;&#124;─permissions | object[] | 角色权限列表（非数据库字段） |
| &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&#124;─permissionId | long | 权限ID |
| &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&#124;─permissionName | string | 权限名称 |
| &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&#124;─component | string | 权限路径 |
| &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&#124;─createBy | string | 创建者 |
| &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&#124;─createTime | string | 创建时间 |
| &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&#124;─updateBy | string | 更新者 |
| &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&#124;─updateTime | string | 更新时间 |
| &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&#124;─remark | string | 备注 |

**Response Demo:**

```json
{
  "code": 0,
  "msg": "",
  "data": {
    "userId": 0,
    "userName": "",
    "nickName": "",
    "email": "",
    "phonenumber": "",
    "sex": "",
    "avatar": "",
    "password": "",
    "status": "",
    "loginIp": "",
    "loginDate": "",
    "pwdUpdateDate": "",
    "createBy": "",
    "createTime": "",
    "updateBy": "",
    "updateTime": "",
    "remark": "",
    "roles": [
      {
        "roleId": 0,
        "roleName": "",
        "roleSort": 0,
        "status": "",
        "createBy": "",
        "createTime": "",
        "updateBy": "",
        "updateTime": "",
        "remark": "",
        "permissions": [
          {
            "permissionId": 0,
            "permissionName": "",
            "component": "",
            "createBy": "",
            "createTime": "",
            "updateBy": "",
            "updateTime": "",
            "remark": ""
          }
        ]
      }
    ]
  }
}
```

---
### getUserList

> BASIC

**Path:** /user/list

**Method:** GET


> REQUEST

**Query:**

| name | value | required | desc |
| ------------ | ------------ | ------------ | ------------ |
| pageNum |  | NO |  |
| pageSize |  | NO |  |
| userName |  | NO |  |
| status |  | NO |  |


> RESPONSE

**Body:**

| name | type | desc |
| ------------ | ------------ | ------------ |
| code | int | 状态码 （成功200，失败其他） |
| msg | string | 提示信息 |
| data | object | 返回数据 |
| &ensp;&ensp;&#124;─pages | long | 当前分页总页数 |
| &ensp;&ensp;&#124;─records | object[] | 分页记录列表 |
| &ensp;&ensp;&ensp;&ensp;&#124;─userId | long | 用户ID |
| &ensp;&ensp;&ensp;&ensp;&#124;─userName | string | 用户账号 |
| &ensp;&ensp;&ensp;&ensp;&#124;─nickName | string | 用户昵称 |
| &ensp;&ensp;&ensp;&ensp;&#124;─email | string | 用户邮箱 |
| &ensp;&ensp;&ensp;&ensp;&#124;─phonenumber | string | 手机号码 |
| &ensp;&ensp;&ensp;&ensp;&#124;─sex | string | 用户性别（0男 1女 2未知） |
| &ensp;&ensp;&ensp;&ensp;&#124;─avatar | string | 头像地址 |
| &ensp;&ensp;&ensp;&ensp;&#124;─password | string | 密码 |
| &ensp;&ensp;&ensp;&ensp;&#124;─status | string | 账号状态（0正常 1停用） |
| &ensp;&ensp;&ensp;&ensp;&#124;─loginIp | string | 最后登录IP |
| &ensp;&ensp;&ensp;&ensp;&#124;─loginDate | string | 最后登录时间 |
| &ensp;&ensp;&ensp;&ensp;&#124;─pwdUpdateDate | string | 密码最后更新时间 |
| &ensp;&ensp;&ensp;&ensp;&#124;─createBy | string | 创建者 |
| &ensp;&ensp;&ensp;&ensp;&#124;─createTime | string | 创建时间 |
| &ensp;&ensp;&ensp;&ensp;&#124;─updateBy | string | 更新者 |
| &ensp;&ensp;&ensp;&ensp;&#124;─updateTime | string | 更新时间 |
| &ensp;&ensp;&ensp;&ensp;&#124;─remark | string | 备注 |
| &ensp;&ensp;&ensp;&ensp;&#124;─roles | object[] | 用户角色列表（非数据库字段） |
| &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&#124;─roleId | long | 角色ID |
| &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&#124;─roleName | string | 角色名称 |
| &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&#124;─roleSort | int | 显示顺序 |
| &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&#124;─status | string | 角色状态（0正常 1停用） |
| &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&#124;─createBy | string | 创建者 |
| &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&#124;─createTime | string | 创建时间 |
| &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&#124;─updateBy | string | 更新者 |
| &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&#124;─updateTime | string | 更新时间 |
| &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&#124;─remark | string | 备注 |
| &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&#124;─permissions | object[] | 角色权限列表（非数据库字段） |
| &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&#124;─permissionId | long | 权限ID |
| &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&#124;─permissionName | string | 权限名称 |
| &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&#124;─component | string | 权限路径 |
| &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&#124;─createBy | string | 创建者 |
| &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&#124;─createTime | string | 创建时间 |
| &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&#124;─updateBy | string | 更新者 |
| &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&#124;─updateTime | string | 更新时间 |
| &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&#124;─remark | string | 备注 |
| &ensp;&ensp;&#124;─total | long | 当前满足条件总行数 |
| &ensp;&ensp;&#124;─size | long | 获取每页显示条数 |
| &ensp;&ensp;&#124;─current | long | 当前页 |

**Response Demo:**

```json
{
  "code": 0,
  "msg": "",
  "data": {
    "pages": 0,
    "records": [
      {
        "userId": 0,
        "userName": "",
        "nickName": "",
        "email": "",
        "phonenumber": "",
        "sex": "",
        "avatar": "",
        "password": "",
        "status": "",
        "loginIp": "",
        "loginDate": "",
        "pwdUpdateDate": "",
        "createBy": "",
        "createTime": "",
        "updateBy": "",
        "updateTime": "",
        "remark": "",
        "roles": [
          {
            "roleId": 0,
            "roleName": "",
            "roleSort": 0,
            "status": "",
            "createBy": "",
            "createTime": "",
            "updateBy": "",
            "updateTime": "",
            "remark": "",
            "permissions": [
              {
                "permissionId": 0,
                "permissionName": "",
                "component": "",
                "createBy": "",
                "createTime": "",
                "updateBy": "",
                "updateTime": "",
                "remark": ""
              }
            ]
          }
        ]
      }
    ],
    "total": 0,
    "size": 0,
    "current": 0
  }
}
```

---
### 添加用户

> BASIC

**Path:** /user/addUser

**Method:** POST

**Desc:**

添加用户


> REQUEST

**Headers:**

| name | value | required | desc |
| ------------ | ------------ | ------------ | ------------ |
| Content-Type | application/json | NO |  |

**Request Body:**

| name | type | desc |
| ------------ | ------------ | ------------ |
| userId | long | 用户ID |
| userName | string | 用户账号 |
| nickName | string | 用户昵称 |
| email | string | 用户邮箱 |
| phonenumber | string | 手机号码 |
| sex | string | 用户性别（0男 1女 2未知） |
| avatar | string | 头像地址 |
| password | string | 密码 |
| status | string | 账号状态（0正常 1停用） |
| loginIp | string | 最后登录IP |
| loginDate | string | 最后登录时间 |
| pwdUpdateDate | string | 密码最后更新时间 |
| createBy | string | 创建者 |
| createTime | string | 创建时间 |
| updateBy | string | 更新者 |
| updateTime | string | 更新时间 |
| remark | string | 备注 |
| roles | object[] | 用户角色列表（非数据库字段） |
| &ensp;&ensp;&#124;─roleId | long | 角色ID |
| &ensp;&ensp;&#124;─roleName | string | 角色名称 |
| &ensp;&ensp;&#124;─roleSort | int | 显示顺序 |
| &ensp;&ensp;&#124;─status | string | 角色状态（0正常 1停用） |
| &ensp;&ensp;&#124;─createBy | string | 创建者 |
| &ensp;&ensp;&#124;─createTime | string | 创建时间 |
| &ensp;&ensp;&#124;─updateBy | string | 更新者 |
| &ensp;&ensp;&#124;─updateTime | string | 更新时间 |
| &ensp;&ensp;&#124;─remark | string | 备注 |
| &ensp;&ensp;&#124;─permissions | object[] | 角色权限列表（非数据库字段） |
| &ensp;&ensp;&ensp;&ensp;&#124;─permissionId | long | 权限ID |
| &ensp;&ensp;&ensp;&ensp;&#124;─permissionName | string | 权限名称 |
| &ensp;&ensp;&ensp;&ensp;&#124;─component | string | 权限路径 |
| &ensp;&ensp;&ensp;&ensp;&#124;─createBy | string | 创建者 |
| &ensp;&ensp;&ensp;&ensp;&#124;─createTime | string | 创建时间 |
| &ensp;&ensp;&ensp;&ensp;&#124;─updateBy | string | 更新者 |
| &ensp;&ensp;&ensp;&ensp;&#124;─updateTime | string | 更新时间 |
| &ensp;&ensp;&ensp;&ensp;&#124;─remark | string | 备注 |

**Request Demo:**

```json
{
  "userId": 0,
  "userName": "",
  "nickName": "",
  "email": "",
  "phonenumber": "",
  "sex": "",
  "avatar": "",
  "password": "",
  "status": "",
  "loginIp": "",
  "loginDate": "",
  "pwdUpdateDate": "",
  "createBy": "",
  "createTime": "",
  "updateBy": "",
  "updateTime": "",
  "remark": "",
  "roles": [
    {
      "roleId": 0,
      "roleName": "",
      "roleSort": 0,
      "status": "",
      "createBy": "",
      "createTime": "",
      "updateBy": "",
      "updateTime": "",
      "remark": "",
      "permissions": [
        {
          "permissionId": 0,
          "permissionName": "",
          "component": "",
          "createBy": "",
          "createTime": "",
          "updateBy": "",
          "updateTime": "",
          "remark": ""
        }
      ]
    }
  ]
}
```

> RESPONSE

**Body:**

| name | type | desc |
| ------------ | ------------ | ------------ |
| code | int | 状态码 （成功200，失败其他） |
| msg | string | 提示信息 |
| data | object | 返回数据 |
| &ensp;&ensp;&#124;─userId | long | 用户ID |
| &ensp;&ensp;&#124;─userName | string | 用户账号 |
| &ensp;&ensp;&#124;─nickName | string | 用户昵称 |
| &ensp;&ensp;&#124;─email | string | 用户邮箱 |
| &ensp;&ensp;&#124;─phonenumber | string | 手机号码 |
| &ensp;&ensp;&#124;─sex | string | 用户性别（0男 1女 2未知） |
| &ensp;&ensp;&#124;─avatar | string | 头像地址 |
| &ensp;&ensp;&#124;─password | string | 密码 |
| &ensp;&ensp;&#124;─status | string | 账号状态（0正常 1停用） |
| &ensp;&ensp;&#124;─loginIp | string | 最后登录IP |
| &ensp;&ensp;&#124;─loginDate | string | 最后登录时间 |
| &ensp;&ensp;&#124;─pwdUpdateDate | string | 密码最后更新时间 |
| &ensp;&ensp;&#124;─createBy | string | 创建者 |
| &ensp;&ensp;&#124;─createTime | string | 创建时间 |
| &ensp;&ensp;&#124;─updateBy | string | 更新者 |
| &ensp;&ensp;&#124;─updateTime | string | 更新时间 |
| &ensp;&ensp;&#124;─remark | string | 备注 |
| &ensp;&ensp;&#124;─roles | object[] | 用户角色列表（非数据库字段） |
| &ensp;&ensp;&ensp;&ensp;&#124;─roleId | long | 角色ID |
| &ensp;&ensp;&ensp;&ensp;&#124;─roleName | string | 角色名称 |
| &ensp;&ensp;&ensp;&ensp;&#124;─roleSort | int | 显示顺序 |
| &ensp;&ensp;&ensp;&ensp;&#124;─status | string | 角色状态（0正常 1停用） |
| &ensp;&ensp;&ensp;&ensp;&#124;─createBy | string | 创建者 |
| &ensp;&ensp;&ensp;&ensp;&#124;─createTime | string | 创建时间 |
| &ensp;&ensp;&ensp;&ensp;&#124;─updateBy | string | 更新者 |
| &ensp;&ensp;&ensp;&ensp;&#124;─updateTime | string | 更新时间 |
| &ensp;&ensp;&ensp;&ensp;&#124;─remark | string | 备注 |
| &ensp;&ensp;&ensp;&ensp;&#124;─permissions | object[] | 角色权限列表（非数据库字段） |
| &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&#124;─permissionId | long | 权限ID |
| &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&#124;─permissionName | string | 权限名称 |
| &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&#124;─component | string | 权限路径 |
| &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&#124;─createBy | string | 创建者 |
| &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&#124;─createTime | string | 创建时间 |
| &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&#124;─updateBy | string | 更新者 |
| &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&#124;─updateTime | string | 更新时间 |
| &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&#124;─remark | string | 备注 |

**Response Demo:**

```json
{
  "code": 0,
  "msg": "",
  "data": {
    "userId": 0,
    "userName": "",
    "nickName": "",
    "email": "",
    "phonenumber": "",
    "sex": "",
    "avatar": "",
    "password": "",
    "status": "",
    "loginIp": "",
    "loginDate": "",
    "pwdUpdateDate": "",
    "createBy": "",
    "createTime": "",
    "updateBy": "",
    "updateTime": "",
    "remark": "",
    "roles": [
      {
        "roleId": 0,
        "roleName": "",
        "roleSort": 0,
        "status": "",
        "createBy": "",
        "createTime": "",
        "updateBy": "",
        "updateTime": "",
        "remark": "",
        "permissions": [
          {
            "permissionId": 0,
            "permissionName": "",
            "component": "",
            "createBy": "",
            "createTime": "",
            "updateBy": "",
            "updateTime": "",
            "remark": ""
          }
        ]
      }
    ]
  }
}
```

---
### 修改用户

> BASIC

**Path:** /user/updateUser

**Method:** PUT

**Desc:**

修改用户


> REQUEST

**Headers:**

| name | value | required | desc |
| ------------ | ------------ | ------------ | ------------ |
| Content-Type | application/json | NO |  |

**Request Body:**

| name | type | desc |
| ------------ | ------------ | ------------ |
| userId | long | 用户ID |
| userName | string | 用户账号 |
| nickName | string | 用户昵称 |
| email | string | 用户邮箱 |
| phonenumber | string | 手机号码 |
| sex | string | 用户性别（0男 1女 2未知） |
| avatar | string | 头像地址 |
| password | string | 密码 |
| status | string | 账号状态（0正常 1停用） |
| loginIp | string | 最后登录IP |
| loginDate | string | 最后登录时间 |
| pwdUpdateDate | string | 密码最后更新时间 |
| createBy | string | 创建者 |
| createTime | string | 创建时间 |
| updateBy | string | 更新者 |
| updateTime | string | 更新时间 |
| remark | string | 备注 |
| roles | object[] | 用户角色列表（非数据库字段） |
| &ensp;&ensp;&#124;─roleId | long | 角色ID |
| &ensp;&ensp;&#124;─roleName | string | 角色名称 |
| &ensp;&ensp;&#124;─roleSort | int | 显示顺序 |
| &ensp;&ensp;&#124;─status | string | 角色状态（0正常 1停用） |
| &ensp;&ensp;&#124;─createBy | string | 创建者 |
| &ensp;&ensp;&#124;─createTime | string | 创建时间 |
| &ensp;&ensp;&#124;─updateBy | string | 更新者 |
| &ensp;&ensp;&#124;─updateTime | string | 更新时间 |
| &ensp;&ensp;&#124;─remark | string | 备注 |
| &ensp;&ensp;&#124;─permissions | object[] | 角色权限列表（非数据库字段） |
| &ensp;&ensp;&ensp;&ensp;&#124;─permissionId | long | 权限ID |
| &ensp;&ensp;&ensp;&ensp;&#124;─permissionName | string | 权限名称 |
| &ensp;&ensp;&ensp;&ensp;&#124;─component | string | 权限路径 |
| &ensp;&ensp;&ensp;&ensp;&#124;─createBy | string | 创建者 |
| &ensp;&ensp;&ensp;&ensp;&#124;─createTime | string | 创建时间 |
| &ensp;&ensp;&ensp;&ensp;&#124;─updateBy | string | 更新者 |
| &ensp;&ensp;&ensp;&ensp;&#124;─updateTime | string | 更新时间 |
| &ensp;&ensp;&ensp;&ensp;&#124;─remark | string | 备注 |

**Request Demo:**

```json
{
  "userId": 0,
  "userName": "",
  "nickName": "",
  "email": "",
  "phonenumber": "",
  "sex": "",
  "avatar": "",
  "password": "",
  "status": "",
  "loginIp": "",
  "loginDate": "",
  "pwdUpdateDate": "",
  "createBy": "",
  "createTime": "",
  "updateBy": "",
  "updateTime": "",
  "remark": "",
  "roles": [
    {
      "roleId": 0,
      "roleName": "",
      "roleSort": 0,
      "status": "",
      "createBy": "",
      "createTime": "",
      "updateBy": "",
      "updateTime": "",
      "remark": "",
      "permissions": [
        {
          "permissionId": 0,
          "permissionName": "",
          "component": "",
          "createBy": "",
          "createTime": "",
          "updateBy": "",
          "updateTime": "",
          "remark": ""
        }
      ]
    }
  ]
}
```

> RESPONSE

**Body:**

| name | type | desc |
| ------------ | ------------ | ------------ |
| code | int | 状态码 （成功200，失败其他） |
| msg | string | 提示信息 |
| data | object | 返回数据 |
| &ensp;&ensp;&#124;─userId | long | 用户ID |
| &ensp;&ensp;&#124;─userName | string | 用户账号 |
| &ensp;&ensp;&#124;─nickName | string | 用户昵称 |
| &ensp;&ensp;&#124;─email | string | 用户邮箱 |
| &ensp;&ensp;&#124;─phonenumber | string | 手机号码 |
| &ensp;&ensp;&#124;─sex | string | 用户性别（0男 1女 2未知） |
| &ensp;&ensp;&#124;─avatar | string | 头像地址 |
| &ensp;&ensp;&#124;─password | string | 密码 |
| &ensp;&ensp;&#124;─status | string | 账号状态（0正常 1停用） |
| &ensp;&ensp;&#124;─loginIp | string | 最后登录IP |
| &ensp;&ensp;&#124;─loginDate | string | 最后登录时间 |
| &ensp;&ensp;&#124;─pwdUpdateDate | string | 密码最后更新时间 |
| &ensp;&ensp;&#124;─createBy | string | 创建者 |
| &ensp;&ensp;&#124;─createTime | string | 创建时间 |
| &ensp;&ensp;&#124;─updateBy | string | 更新者 |
| &ensp;&ensp;&#124;─updateTime | string | 更新时间 |
| &ensp;&ensp;&#124;─remark | string | 备注 |
| &ensp;&ensp;&#124;─roles | object[] | 用户角色列表（非数据库字段） |
| &ensp;&ensp;&ensp;&ensp;&#124;─roleId | long | 角色ID |
| &ensp;&ensp;&ensp;&ensp;&#124;─roleName | string | 角色名称 |
| &ensp;&ensp;&ensp;&ensp;&#124;─roleSort | int | 显示顺序 |
| &ensp;&ensp;&ensp;&ensp;&#124;─status | string | 角色状态（0正常 1停用） |
| &ensp;&ensp;&ensp;&ensp;&#124;─createBy | string | 创建者 |
| &ensp;&ensp;&ensp;&ensp;&#124;─createTime | string | 创建时间 |
| &ensp;&ensp;&ensp;&ensp;&#124;─updateBy | string | 更新者 |
| &ensp;&ensp;&ensp;&ensp;&#124;─updateTime | string | 更新时间 |
| &ensp;&ensp;&ensp;&ensp;&#124;─remark | string | 备注 |
| &ensp;&ensp;&ensp;&ensp;&#124;─permissions | object[] | 角色权限列表（非数据库字段） |
| &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&#124;─permissionId | long | 权限ID |
| &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&#124;─permissionName | string | 权限名称 |
| &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&#124;─component | string | 权限路径 |
| &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&#124;─createBy | string | 创建者 |
| &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&#124;─createTime | string | 创建时间 |
| &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&#124;─updateBy | string | 更新者 |
| &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&#124;─updateTime | string | 更新时间 |
| &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&#124;─remark | string | 备注 |

**Response Demo:**

```json
{
  "code": 0,
  "msg": "",
  "data": {
    "userId": 0,
    "userName": "",
    "nickName": "",
    "email": "",
    "phonenumber": "",
    "sex": "",
    "avatar": "",
    "password": "",
    "status": "",
    "loginIp": "",
    "loginDate": "",
    "pwdUpdateDate": "",
    "createBy": "",
    "createTime": "",
    "updateBy": "",
    "updateTime": "",
    "remark": "",
    "roles": [
      {
        "roleId": 0,
        "roleName": "",
        "roleSort": 0,
        "status": "",
        "createBy": "",
        "createTime": "",
        "updateBy": "",
        "updateTime": "",
        "remark": "",
        "permissions": [
          {
            "permissionId": 0,
            "permissionName": "",
            "component": "",
            "createBy": "",
            "createTime": "",
            "updateBy": "",
            "updateTime": "",
            "remark": ""
          }
        ]
      }
    ]
  }
}
```

---
### 重置用户密码

> BASIC

**Path:** /user/resetPassword

**Method:** PUT

**Desc:**

重置用户密码


> REQUEST

**Query:**

| name | value | required | desc |
| ------------ | ------------ | ------------ | ------------ |
| userId |  | NO | 用户Id |
| newPassword |  | NO | 新密码 |


> RESPONSE

**Body:**

| name | type | desc |
| ------------ | ------------ | ------------ |
| code | int | 状态码 （成功200，失败其他） |
| msg | string | 提示信息 |
| data | object | 返回数据 |
| &ensp;&ensp;&#124;─userId | long | 用户ID |
| &ensp;&ensp;&#124;─userName | string | 用户账号 |
| &ensp;&ensp;&#124;─nickName | string | 用户昵称 |
| &ensp;&ensp;&#124;─email | string | 用户邮箱 |
| &ensp;&ensp;&#124;─phonenumber | string | 手机号码 |
| &ensp;&ensp;&#124;─sex | string | 用户性别（0男 1女 2未知） |
| &ensp;&ensp;&#124;─avatar | string | 头像地址 |
| &ensp;&ensp;&#124;─password | string | 密码 |
| &ensp;&ensp;&#124;─status | string | 账号状态（0正常 1停用） |
| &ensp;&ensp;&#124;─loginIp | string | 最后登录IP |
| &ensp;&ensp;&#124;─loginDate | string | 最后登录时间 |
| &ensp;&ensp;&#124;─pwdUpdateDate | string | 密码最后更新时间 |
| &ensp;&ensp;&#124;─createBy | string | 创建者 |
| &ensp;&ensp;&#124;─createTime | string | 创建时间 |
| &ensp;&ensp;&#124;─updateBy | string | 更新者 |
| &ensp;&ensp;&#124;─updateTime | string | 更新时间 |
| &ensp;&ensp;&#124;─remark | string | 备注 |
| &ensp;&ensp;&#124;─roles | object[] | 用户角色列表（非数据库字段） |
| &ensp;&ensp;&ensp;&ensp;&#124;─roleId | long | 角色ID |
| &ensp;&ensp;&ensp;&ensp;&#124;─roleName | string | 角色名称 |
| &ensp;&ensp;&ensp;&ensp;&#124;─roleSort | int | 显示顺序 |
| &ensp;&ensp;&ensp;&ensp;&#124;─status | string | 角色状态（0正常 1停用） |
| &ensp;&ensp;&ensp;&ensp;&#124;─createBy | string | 创建者 |
| &ensp;&ensp;&ensp;&ensp;&#124;─createTime | string | 创建时间 |
| &ensp;&ensp;&ensp;&ensp;&#124;─updateBy | string | 更新者 |
| &ensp;&ensp;&ensp;&ensp;&#124;─updateTime | string | 更新时间 |
| &ensp;&ensp;&ensp;&ensp;&#124;─remark | string | 备注 |
| &ensp;&ensp;&ensp;&ensp;&#124;─permissions | object[] | 角色权限列表（非数据库字段） |
| &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&#124;─permissionId | long | 权限ID |
| &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&#124;─permissionName | string | 权限名称 |
| &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&#124;─component | string | 权限路径 |
| &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&#124;─createBy | string | 创建者 |
| &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&#124;─createTime | string | 创建时间 |
| &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&#124;─updateBy | string | 更新者 |
| &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&#124;─updateTime | string | 更新时间 |
| &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&#124;─remark | string | 备注 |

**Response Demo:**

```json
{
  "code": 0,
  "msg": "",
  "data": {
    "userId": 0,
    "userName": "",
    "nickName": "",
    "email": "",
    "phonenumber": "",
    "sex": "",
    "avatar": "",
    "password": "",
    "status": "",
    "loginIp": "",
    "loginDate": "",
    "pwdUpdateDate": "",
    "createBy": "",
    "createTime": "",
    "updateBy": "",
    "updateTime": "",
    "remark": "",
    "roles": [
      {
        "roleId": 0,
        "roleName": "",
        "roleSort": 0,
        "status": "",
        "createBy": "",
        "createTime": "",
        "updateBy": "",
        "updateTime": "",
        "remark": "",
        "permissions": [
          {
            "permissionId": 0,
            "permissionName": "",
            "component": "",
            "createBy": "",
            "createTime": "",
            "updateBy": "",
            "updateTime": "",
            "remark": ""
          }
        ]
      }
    ]
  }
}
```

---
### 更新用户状态

> BASIC

**Path:** /user/updateStatus

**Method:** PUT

**Desc:**

更新用户状态


> REQUEST

**Query:**

| name | value | required | desc |
| ------------ | ------------ | ------------ | ------------ |
| userId |  | NO | 用户Id |
| newStatus |  | NO | 新状态 |


> RESPONSE

**Body:**

| name | type | desc |
| ------------ | ------------ | ------------ |
| code | int | 状态码 （成功200，失败其他） |
| msg | string | 提示信息 |
| data | object | 返回数据 |
| &ensp;&ensp;&#124;─userId | long | 用户ID |
| &ensp;&ensp;&#124;─userName | string | 用户账号 |
| &ensp;&ensp;&#124;─nickName | string | 用户昵称 |
| &ensp;&ensp;&#124;─email | string | 用户邮箱 |
| &ensp;&ensp;&#124;─phonenumber | string | 手机号码 |
| &ensp;&ensp;&#124;─sex | string | 用户性别（0男 1女 2未知） |
| &ensp;&ensp;&#124;─avatar | string | 头像地址 |
| &ensp;&ensp;&#124;─password | string | 密码 |
| &ensp;&ensp;&#124;─status | string | 账号状态（0正常 1停用） |
| &ensp;&ensp;&#124;─loginIp | string | 最后登录IP |
| &ensp;&ensp;&#124;─loginDate | string | 最后登录时间 |
| &ensp;&ensp;&#124;─pwdUpdateDate | string | 密码最后更新时间 |
| &ensp;&ensp;&#124;─createBy | string | 创建者 |
| &ensp;&ensp;&#124;─createTime | string | 创建时间 |
| &ensp;&ensp;&#124;─updateBy | string | 更新者 |
| &ensp;&ensp;&#124;─updateTime | string | 更新时间 |
| &ensp;&ensp;&#124;─remark | string | 备注 |
| &ensp;&ensp;&#124;─roles | object[] | 用户角色列表（非数据库字段） |
| &ensp;&ensp;&ensp;&ensp;&#124;─roleId | long | 角色ID |
| &ensp;&ensp;&ensp;&ensp;&#124;─roleName | string | 角色名称 |
| &ensp;&ensp;&ensp;&ensp;&#124;─roleSort | int | 显示顺序 |
| &ensp;&ensp;&ensp;&ensp;&#124;─status | string | 角色状态（0正常 1停用） |
| &ensp;&ensp;&ensp;&ensp;&#124;─createBy | string | 创建者 |
| &ensp;&ensp;&ensp;&ensp;&#124;─createTime | string | 创建时间 |
| &ensp;&ensp;&ensp;&ensp;&#124;─updateBy | string | 更新者 |
| &ensp;&ensp;&ensp;&ensp;&#124;─updateTime | string | 更新时间 |
| &ensp;&ensp;&ensp;&ensp;&#124;─remark | string | 备注 |
| &ensp;&ensp;&ensp;&ensp;&#124;─permissions | object[] | 角色权限列表（非数据库字段） |
| &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&#124;─permissionId | long | 权限ID |
| &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&#124;─permissionName | string | 权限名称 |
| &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&#124;─component | string | 权限路径 |
| &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&#124;─createBy | string | 创建者 |
| &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&#124;─createTime | string | 创建时间 |
| &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&#124;─updateBy | string | 更新者 |
| &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&#124;─updateTime | string | 更新时间 |
| &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&#124;─remark | string | 备注 |

**Response Demo:**

```json
{
  "code": 0,
  "msg": "",
  "data": {
    "userId": 0,
    "userName": "",
    "nickName": "",
    "email": "",
    "phonenumber": "",
    "sex": "",
    "avatar": "",
    "password": "",
    "status": "",
    "loginIp": "",
    "loginDate": "",
    "pwdUpdateDate": "",
    "createBy": "",
    "createTime": "",
    "updateBy": "",
    "updateTime": "",
    "remark": "",
    "roles": [
      {
        "roleId": 0,
        "roleName": "",
        "roleSort": 0,
        "status": "",
        "createBy": "",
        "createTime": "",
        "updateBy": "",
        "updateTime": "",
        "remark": "",
        "permissions": [
          {
            "permissionId": 0,
            "permissionName": "",
            "component": "",
            "createBy": "",
            "createTime": "",
            "updateBy": "",
            "updateTime": "",
            "remark": ""
          }
        ]
      }
    ]
  }
}
```

---
### 根据用户Id列表删除用户

> BASIC

**Path:** /user/deleteUser

**Method:** DELETE

**Desc:**

根据用户Id列表删除用户


> REQUEST

**Query:**

| name | value | required | desc |
| ------------ | ------------ | ------------ | ------------ |
| ids |  | NO | 用户列表 |


> RESPONSE

**Body:**

| name | type | desc |
| ------------ | ------------ | ------------ |
| code | int | 状态码 （成功200，失败其他） |
| msg | string | 提示信息 |
| data | object | 返回数据<br>操作结果 |

**Response Demo:**

```json
{
  "code": 0,
  "msg": "",
  "data": null
}
```

---
### 根据用户Id分配角色

> BASIC

**Path:** /user/assignRoles

**Method:** PUT

**Desc:**

根据用户Id分配角色


> REQUEST

**Query:**

| name | value | required | desc |
| ------------ | ------------ | ------------ | ------------ |
| userId |  | YES | 用户Id |
| roleIds |  | NO | 角色Id列表 |


> RESPONSE

**Body:**

| name | type | desc |
| ------------ | ------------ | ------------ |
| code | int | 状态码 （成功200，失败其他） |
| msg | string | 提示信息 |
| data | object | 返回数据<br>操作结果 |

**Response Demo:**

```json
{
  "code": 0,
  "msg": "",
  "data": null
}
```
