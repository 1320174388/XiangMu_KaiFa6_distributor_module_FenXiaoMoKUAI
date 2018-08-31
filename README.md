Distrbutor_Module : 小程序秒杀功能模块
===============

> 模块基于ThinkPHP5.1目录开发，以项目开发基础目录为标准

## 说明：

### DLTH_XM_KAIFA_CHESHI_DATABASE.sql 数据库SQL语句
### distributor_module_route.php 路由文件
### v1_tableName.php  模板需要的数据库表配置文件，可以修改到全局配置中
### v1_config.php  模板需要的配置信息文件，可以修改到全局配置中

## 接口：


### 创建分销员接口

~~~[api]
post:/v1/distributor_module/distributor_post
*user_token        用户token
*parent_token      上级token标识
*member_user       用户昵称
*member_image      用户头像图片路径
<<<
success
{"errNum":0,"retMsg":"成功","retData":true}
<<<
error
{"errNum":1,"retMsg":"失败","retData":"提示信息"}
~~~
### 注册推客员接口

~~~[api]
post:/v1/distributor_module/promoter_post
*user_token        用户token
*member_name       用户真实姓名
*member_phone      用户手机号
<<<
success
{"errNum":0,"retMsg":"成功","retData":true}
<<<
error
{"errNum":1,"retMsg":"失败","retData":"提示信息"}
~~~
### 修改推客员信息接口

~~~[api]
post:/v1/distributor_module/promoter_put
*user_token        用户token
*member_name       用户真实姓名 【可选】
*member_phone      用户手机号 【可选】
<<<
success
{"errNum":0,"retMsg":"成功","retData":true}
<<<
error
{"errNum":1,"retMsg":"失败","retData":"提示信息"}
~~~
### 获取分销商数据接口

~~~[api]
post:/v1/distributor_module/distributor_get
*user_token        用户token
*type              获取分销商类型
                                all 获取所有分销商信息 
                                son 获取佣金下级分销商信息
                                push获取推客下级分销商信息
*num=0             分页页码  默认=0 第二页为 1 以此类推..
<<<
success
{"errNum":0,"retMsg":"成功","retData":true}
<<<
error
{"errNum":1,"retMsg":"失败","retData":"提示信息"}
~~~ 
###订单接口自定义函数
~~~
命名空间位置：app\distributor_module\working_version\v1\library\OrderLibrary
函数名称:

orderSettlement()
名  称：订单结算函数
输  入 : $order_number => '订单order_number编号';
输  出 : ['msg'=>'success','data'=>'提示信息']

~~~