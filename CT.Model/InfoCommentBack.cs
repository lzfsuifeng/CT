//------------------------------------------------------------------------------
// <auto-generated>
//    此代码是根据模板生成的。
//
//    手动更改此文件可能会导致应用程序中发生异常行为。
//    如果重新生成代码，则将覆盖对此文件的手动更改。
// </auto-generated>
//------------------------------------------------------------------------------

namespace CT.Model
{
    using System;
    using System.Collections.Generic;
    
    public partial class InfoCommentBack
    {
        public int ICB_ID { get; set; }
        public string ICB_Content { get; set; }
        public System.DateTime ICB_Time { get; set; }
        public int UserInfo_ID { get; set; }
        public Nullable<int> IC_ID { get; set; }
    
        public virtual InfoComment InfoComment { get; set; }
        public virtual UserInfo UserInfo { get; set; }
    }
}
