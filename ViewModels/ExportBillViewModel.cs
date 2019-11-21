using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using QuanLyKho_MVVM.Views;

namespace QuanLyKho_MVVM.ViewModels
{
    class ExportBillViewModel : BaseViewModel
    {
        private string _id;
        public ExportBillViewModel()
        {
            MessageBox.Show(Id);
        }

        public string Id { get => _id; set => _id = value; }
    }
}
