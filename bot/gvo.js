const { GetAccountInfo } = require('./modules/verify');

const user = 'Khoi_Nguyen';
GetAccountInfo(user, (error, info) => {
    if (error) {
        console.error('Lỗi:', error);
    } else if (info != null) {
        console.log("Password:"+info);
    } else {
        console.log('Không tìm thấy thông tin tài khoản.');
    }
});