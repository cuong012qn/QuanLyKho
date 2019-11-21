using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using QuanLyKho_MVVM.ViewModels;
using QuanLyKho_MVVM.Models;
using System.Windows.Input;

namespace QuanLyKho_MVVM.ViewModels
{
    class LoadingViewModel : BaseViewModel
    {
        public ICommand CloseCommand { get; set; }

        public LoadingViewModel()
        {
            
        }
    }
}
