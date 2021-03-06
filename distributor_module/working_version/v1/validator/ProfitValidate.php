<?php
/**
 *  版权声明 :  地老天荒科技有限公司
 *  文件名称 :  ProfitValidator.php
 *  创 建 者 :  Shi Guang Yu
 *  创建日期 :  2018/08/30 13:28
 *  文件描述 :  收益信息验证器
 *  历史记录 :  -----------------------
 */
namespace app\distributor_module\working_version\v1\validator;
use think\Validate;

class ProfitValidate extends Validate
{
    /**
     * 名  称 : $rule
     * 功  能 : 验证规则
     * 输  入 : $get['UserToken'] => '用户UserToken身份标识';
     * 创  建 : 2018/08/30 13:31
     */
    protected $rule =   [
        'UserToken' => 'require|min:32|max:32',
    ];

    /**
     * 名  称 : $message()
     * 功  能 : 设置验证信息
     * 创  建 : 2018/08/30 13:31
     */
    protected $message  =   [
        'UserToken.require' => '请正确发送用户身份标识',
        'UserToken.min'     => '请正确发送用户身份标识',
        'UserToken.max'     => '请正确发送用户身份标识',
    ];
}
