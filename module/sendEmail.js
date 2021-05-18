

const nodemailer = require('nodemailer')

let transporter = nodemailer.createTransport({
    host: 'smtp.qq.com',
    secure: true,
    auth: {
        user: '2064889594@qq.com',
        pass: 'qlpyhyjvroqzcech' 
    }
});

module.exports = async function fn(email, code){
    let status = null
    await new Promise((resolve, reject) => {
        transporter.sendMail({
            from: '2064889594@qq.com',
            to: email, 
            subject: 'daixu系统',
            html: `<div id="content" class="netease_mail_readhtml"><style>.netease_mail_readhtml .open_email{background:url(http://pic.sc.chinaz.com/files/pic/pic9/201601/apic18482.jpg) no-repeat 0 -35px;width:760px;padding:10px;font-family:Tahoma,"宋体";margin:0 auto;margin-bottom:20px;text-align:left}.netease_mail_readhtml .genEmailNicker{text-align:left;padding:10px;font-family:Tahoma,"宋体";font-weight:700;margin:0 auto;margin-bottom:40px}.netease_mail_readhtml .genEmailContent{padding:10px;padding-left:40px;font-family:Tahoma,"宋体";margin:0 auto;margin-bottom:40px;text-align:center}.netease_mail_readhtml .genEmailTail{float:right;margin:auto 0 auto auto;padding:10px;text-align:right;font-family:Tahoma,"宋体";margin-right:0;margin-bottom:40px}</style><div align="center"><div class="open_email" style="margin-left:8px;margin-top:8px;margin-bottom:8px;margin-right:8px"><div><span class="genEmailNicker"></span><br><span class="genEmailContent"><div id="cTMail-Wrap" style="box-sizing:border-box;text-align:center;min-width:320px;max-width:660px;border:1px solid #f6f6f6;background-color:#f7f8fa;margin:auto;padding:20px 0 30px;font-family:'helvetica neue',PingFangSC-Light,arial,'hiragino sans gb','microsoft yahei ui','microsoft yahei',simsun,sans-serif"><div class="main-content"><table style="width:100%;font-weight:300;margin-bottom:10px;border-collapse:collapse"><tbody><tr style="font-weight:300"><td style="width:3%;max-width:30px"></td><td style="max-width:600px"><div id="cTMail-logo" style="width:92px;height:25px"><img src="https://s3.ax1x.com/2020/12/22/rrLFIg.png" style="width:200px;display:block"></div><p style="height:2px;background-color:#00a4ff;border:0;font-size:0;padding:0;width:100%;margin-top:50px"></p><div id="cTMail-inner" style="background-color:#fff;padding:23px 0 20px;box-shadow:0 1px 1px 0 rgba(122,55,55,.2);text-align:left"><table style="width:100%;font-weight:300;margin-bottom:10px;border-collapse:collapse;text-align:left"><tbody><tr style="font-weight:300"><td style="width:3.2%;max-width:30px"><br></td><td style="max-width:480px;text-align:left"><p class="cTMail-content" style="font-size:14px;color:#333;line-height:24px;margin:6px 0 0 0;word-wrap:break-word;word-break:break-all">验证码：`+ code +`，该验证码5分钟内有效。为了保障您的账户安全，请勿向他人泄漏验证码信息。</p><br><dl style="font-size:14px;color:#333;line-height:18px"></dl><p id="cTMail-sender" style="color:#333;font-size:14px;line-height:26px;word-wrap:break-word;word-break:break-all;margin-top:32px">此致<br><strong>daixu</strong></p></td><td style="width:3.2%;max-width:30px"></td></tr></tbody></table></div><div id="cTMail-copy" style="text-align:center;font-size:12px;line-height:18px;color:#999"><table style="width:100%;font-weight:300;margin-top:50px;border-collapse:collapse"><tbody><tr style="font-weight:300"><td style="width:3.2%;max-width:30px"></td><td style="max-width:540px"><p style="text-align:center;margin:0 auto 4px"><img src="https://s3.ax1x.com/2020/12/22/rrLAiQ.png" style="width:64px;height:64px;margin:0 auto"></p><p style="text-align:center;margin:20px auto 14px auto;font-size:12px;color:#999">此为系统邮件，请勿回复</p><p id="cTMail-rights" style="max-width:100%;margin:auto;font-size:12px;color:#999;text-align:center;line-height:22px">添加QQ客服,为您排忧解难!<br></p></td><td style="width:3.2%;max-width:30px"></td></tr></tbody></table></div></td><td style="width:3%;max-width:30px"></td></tr></tbody></table></div></div></span><br><span class="genEmailTail"></span></div></div></div><div style="position:absolute;left:-99999px;display:none"><img src="http://mail.qq.com/cgi-bin/api_img?tid=418&amp;sid=22035&amp;domain=wjw_daixu@163.com&amp;mid=newapiserver7t1608289385t56720"></div></div>`
        }, function (err, info) {
            if (err) {
                status = 0
                reject()
            } else {
                status = 1
                resolve()
            }
        });
    })
    return status


}
