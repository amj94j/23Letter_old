//
//  CommonConstantsDefine.h
//  XJ_Letter
//
//  Created by apple on 2017/11/22.
//  Copyright © 2017年 ZhangJ. All rights reserved.
//

#ifndef CommonConstantsDefine_h
#define CommonConstantsDefine_h

//1.    标注尺寸为苹果6尺寸，所标注数值均为2倍数值，需要除以2
//2.    标题的黑色色值为#333333，字号为32px，大标题为34px，分割线的颜色为#efefef
//3.    副标题文字为30px，颜色为#c5c5c5

#define kColor_MainTitleColor  @"#333333"
#define kFontSize_MainTitle  @32
#define kFontSize_MainBigTitle  @34

#define kColor_Subtitle  @"#c5c5c5"
#define kFontSize_Subtitle  @30

#define kColor_CuttingLine @"#efefef"

#define kRealmNameForAppStore               @"http://192.168.1.107:8080/letter"

#pragma mark -
#pragma mark - admin Action
// 添加区域
#define kAdminAddArea                  @"/admin/addArea"

#pragma mark -
#pragma mark - 信件相关
// 完成别人的需求
#define kLetterFinishDemand            @"/api/letter/finishDemand"

// 话题搜索
#define kLetterSearchTopic             @"/api/letter/searchTopic"

// 选择地区
#define kLetterSelectArea              @"/api/letter/selectArea"

// 选择收信人
#define kLetterSelectFriend            @"/api/letter/selectFriend"

// 选择咖啡店
#define kLetterSelectShop              @"/api/letter/selectShop"

// 选择话题
#define kLetterSelectTopic             @"/api/letter/selectTopic"

// 发布需求
#define kLetterSendDemand              @"/api/letter/sendDemand"

// 发送信件
#define kLetterSendLetter              @"/api/letter/sendLetter"

// 查看我的需求(1发起 2完成)
#define kLetterShowMyDemand            @"/api/letter/showMyDemand"

// 查看我的信件(1预约 2发出 3收到)
#define kLetterShowMyLetter            @"/api/letter/showMyLetter"

// 预约信件
#define kLetterSubscribeLetter         @"/api/letter/subscribeLetter"

#pragma mark -
#pragma mark - 发布信件相关
// 返回信件详情数据(查看按钮)
#define kReleaseletterGetDetailsLetter    @"/api/releaseletter/getDetailsLetter"

// 返回首页信件数据
#define kReleaseletterGetHomeLetter    @"/api/releaseletter/getHomeLetter"

// 发布信件(我要写的按钮)
#define kReleaseletterReleaseLetter    @"/api/releaseletter/releaseLetter"

#pragma mark -
#pragma mark - 咖啡店相关
// 扫描二维码后展示信息
#define kShopGetMessage                @"/api/shop/getMessage"

//地图页面数据
#define kShopOnMap                     @"/api/shop/shopOnMap"

// 商家在线/流通信件
#define kShopsLetter                   @"/api/shop/shopsLetter"

// 商家在线/流通信件数量
#define kShopsLetterCount              @"/api/shop/shopsLetterCount"

// 商家入户申请
#define kShopsLocated                  @"/api/shop/shopsLocated"

// 查看信件/需求倒计时
#define kShopShowCountdown             @"/api/shop/showCountdown"

// 店铺主页
#define kShopShowShopInfo              @"/api/shop/showShopInfo"

// 领取信件验证
#define kShopVerifyReceive             @"/api/shop/verifyReceive"

#pragma mark -
#pragma mark - 系统相关
// 反馈
#define kMSystemFeedback               @"/api/mSystem/feedback"

// 获取开关状态
#define kMSystemGetSwitchState         @"/api/mSystem/getSwitchState"

// 消息列表
#define kMSystemMessList               @"/api/mSystem/messList"

// 协议获取
#define kMSystemProtocol               @"/api/mSystem/protocol"

// 举报
#define kMSystemReportOthers           @"/api/mSystem/reportOthers"

// 分享统一接口（个人，店铺，信件）
#define kMSystemSharePage              @"/api/mSystem/sharePage"

// 系统搜索按钮
#define kMSystemSySearch               @"/api/mSystem/sySearch"

// 系统搜索页面
#define kMSystemSySearchPage           @"/api/mSystem/sySearchPage"

// 切换消息开关
#define kMSystemSysUpdateSwitch        @"/api/mSystem/sysUpdateSwitch"

// 版本更新
#define kMSystemUpdate                 @"/api/mSystem/update"

#pragma mark -
#pragma mark - 测试相关

#pragma mark -
#pragma mark - 图片上传相关
// 单张图片上传
#define kUploadPic                     @"/upload/api/uploadPic.do"

// 多张图片上传
#define kUploadPicMul                  @"/upload/api/uploadPicMul.do"

#pragma mark -
#pragma mark - 用户相关
// 关注和取消关注
#define kUserAttentionOrcancelAttention     @"/api/user/attentionOrcancelAttention"

// 绑定第三方账号
#define kUserBindingOtherAccount            @"/api/user/bindingOtherAccount"

// 通过原密码修改新密码
#define kUserChangePwd                      @"/api/user/changePwd"

// 解除第三方的绑定信息
#define kUserDeleteBindingAccount           @"/api/user/deleteBindingAccount"

// 更改昵称(userToken必传)
#define kUserEditNickName                   @"/api/user/editNickName"

// 编辑头像
#define kUserEditUserImg                    @"/api/user/editUserImg"

// 编辑性别
#define kUserEditUserSex                    @"/api/user/editUserSex"

// 找回密码
#define kUserFindPwdByPhone                 @"/api/user/findPwdByPhone"

// 通过第三方登录
#define kUserLoginByOther                   @"/api/user/loginByOther"

// 通过手机号和密码登录
#define kUserLoginByPassword                @"/api/user/loginByPassword"

// 手机号注册
#define kUserRegistByPhone                  @"/api/user/registByPhone"

// 发送验证码
#define kUserSendSMS                        @"/api/user/sendSMS"

// 查询我关注的用户/粉丝type(必填1--关注 2--粉丝 默认是关注)
#define kUserShowMyAttentionFans            @"/api/user/showMyAttentionFans"

// 查询我关注的用户/粉丝数量
#define kUserShowMyAttentionFansCount       @"/api/user/showMyAttentionFansCount"

// 展示第三方绑定信息
#define kUserShowOtherAccount               @"/api/user/showOtherAccount"

// 展示我的个人基本资料
#define kUserShowUserInfo                   @"/api/user/showUserInfo"

// 展示个人资料里的信件、需求
#define kUserShowUserInformation            @"/api/user/showUserInformation"

// 验证手机号是否可用
#define kUserVerifyPhone                    @"/api/user/verifyPhone"

#endif /* CommonConstantsDefine_h */
