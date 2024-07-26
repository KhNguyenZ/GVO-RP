const fetchAll = require('./modules/verify');

const user = 'Khoi_Nguyen';
GetAccountInfo(user, (info) => {
    if(info != null)
    {
        console.log(info['Password']);
    }
})