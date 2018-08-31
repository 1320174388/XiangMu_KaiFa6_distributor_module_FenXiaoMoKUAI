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

~~~
[api]
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

~~~
[api]
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

~~~
[api]
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

~~~
[api]
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
### 订单信息操作接口
~~~
路由地址 : v1/distributor_module/order_route
传值方式 : GET
路由功能 : 订单信息操作接口
路由输入 : $get['UserToken'] => '用户UserToken身份标识';
路由输入 : $get['OrderType'] => 'OrderType = 0;  获取所有订单信息';
路由输入 : $get['OrderType'] => 'OrderType = 1;  获取以结算订单信息';
路由输入 : $get['OrderType'] => 'OrderType = 2;  获取未结算订单信息';
路由输入 : $get['OrderNumb'] => '现已获取到的订单数量，没有输入0';
路由输出 : {"errNum":0,"retMsg":"请求成功","retData":"请求数据"}
~~~
### 收益信息接口
~~~
路由地址 : v1/distributor_module/profit_route
传值方式 : GET
路由功能 : 收益信息操作接口
路由输入 : $get['UserToken'] => '用户UserToken身份标识';
路由输出 : {"errNum":0,"retMsg":"请求成功","retData":"请求数据"}
~~~
### 提现信息接口
~~~
路由地址 : v1/distributor_module/putforward_route
传值方式 : GET
路由功能 : 提现信息操作接口
路由输入 : $get['UserToken'] => '用户UserToken身份标识';
路由输入 : $get['DataNumbE'] => '现已获取到的信息数量，没有输入0';
路由输出 : {"errNum":0,"retMsg":"请求成功","retData":"请求数据"}
~~~
### 小程序二维码获取接口
~~~
路由地址 : v1/distributor_module/smallcode_route
传值方式 : POST
路由功能 : 小程序二维码获取
路由输入 : $post['scene']      => '发送携带的参数';
路由输入 : $post['page']       => '页面地址;
路由输入 : $post['width']      => '二维码尺寸;
路由输入 : $post['auto_color'] => '是否自动配置线条颜色 true / false;
路由输入 : $post['line_color'] => '使用 rgb 设置颜色：{"r":"0","g":"0","b":"0"}
路由输入 : $post['is_hyaline'] => '是否需要透明底色 true / false;
路由输出 : {"errNum":0,"retMsg":"提示信息","retData":true}
~~~
### 添加订单函数类
~~~
命名空间位置 ：
use app\distributor_module\working_version\v1\library\OrderLibrary;
函数名称: 
orderLibPost()
函数输入 : $post['OrderNumber'] => '订单OrderNumber编号';
函数输入 : $post['UserToken']   => '买家UserToken身份标识;
函数输入 : $post['JsonBuyer']   => '买家JSON数据，不需要则发送无用JSON格式数据;
函数输入 : $post['JsonSeller']  => '卖家JSON数据，不需要则发送无用JSON格式数据
函数输入 : $post['JsonOrder']   => '订单JSON数据，不需要则发送无用JSON格式数据
函数输入 : $post['ProfitPrice'] => '分销商ProfitPrice收益金额
函数输出 : ['msg'=>'success','data'=>'返回数据']
~~~
### 订单接口自定义函数
~~~
命名空间位置：app\distributor_module\working_version\v1\library\OrderLibrary
函数名称:

orderSettlement()
名  称：订单结算函数
输  入 : $order_number => '订单order_number编号';
输  出 : ['msg'=>'success','data'=>'提示信息']

~~~
### 修改收益函数类
~~~
命名空间位置 ：
use app\distributor_module\working_version\v1\library\ProfitLibrary;
函数名称: 
profitLibPut()
函数输入 : $put['UserToken']    => '提现人UserToken身份标识';
函数输入 : $put['ForwardName']  => 'ForwardName提现人名称;
函数输入 : $put['ForwardMoney'] => 'ForwardMoney提现金额;
函数输出 : ['msg'=>'success','data'=>'提示信息']
~~~