﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CT.Model;
namespace CT.IDAL
{
    public interface IUserInfo:IBase<UserInfo>
    {
        UserInfo GetUserInfoModel(string userName, string userPwd);
        //int AddUser(UserInfo userInfo);
    }
}
