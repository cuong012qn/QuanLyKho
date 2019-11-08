using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyKho_MVVM.Models
{
    public class DataProvider
    {
        //private readonly string CONNSTR = "Data Source=DESKTOP-7UOK1F3;Initial Catalog=QuanLyKho;Integrated Security=True";
        private static DataProvider _instance;
        public QuanLyKhoEntities DB { get; set; }

        private DataProvider()
        {
            DB = new QuanLyKhoEntities();
        }

        public static DataProvider Instance
        {
            get
            {
                if (_instance == null)
                    _instance = new DataProvider();
                return _instance;
            }
            private set => _instance = value;
        }
    }
}
