<?php
/**
 *  版权声明 :  地老天荒科技有限公司
 *  文件名称 :  PutforwardService.php
 *  创 建 者 :  Shi Guang Yu
 *  创建日期 :  2018/08/30 14:57
 *  文件描述 :  提现信息逻辑层
 *  历史记录 :  -----------------------
 */
namespace app\distributor_module\working_version\v1\service;
use app\distributor_module\working_version\v1\dao\PutforwardDao;
use app\distributor_module\working_version\v1\library\PutforwardLibrary;
use app\distributor_module\working_version\v1\validator\PutforwardValidate;

class PutforwardService
{
    /**
     * 名  称 : putforwardShow()
     * 功  能 : 提现信息操作逻辑
     * 变  量 : --------------------------------------
     * 输  入 : $get['UserToken'] => '用户UserToken身份标识';
     * 输  入 : $get['DataNumbE'] => '现已获取到的信息数量，没有输入0';
     * 输  出 : ['msg'=>'success','data'=>'返回数据']
     * 创  建 : 2018/08/30 15:08
     */
    public function putforwardShow($get)
    {
        // 实例化验证器代码
        $validate  = new PutforwardValidate();

        // 验证数据
        if (!$validate->scene('edit')->check($get)) {
            return ['msg'=>'error','data'=>$validate->getError()];
        }

        // 实例化Dao层数据类
        $putforwardDao = new PutforwardDao();

        // 执行Dao层逻辑
        $res = $putforwardDao->putforwardSelect($get);

        // 处理函数返回值
        return \RSD::wxReponse($res,'D');
    }
}
