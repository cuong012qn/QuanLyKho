using MaterialDesignThemes.Wpf;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Controls;
using QuanLyKho_MVVM.Views;
using System.Windows.Input;
using System.Windows;

namespace QuanLyKho_MVVM.ViewModels
{
    class MainWindowBetaViewModel : BaseViewModel
    {
        public ICommand LoadedWindowCommand { get; set; }

        private bool isLoaded;

        public MainWindowBetaViewModel()
        {
            LoadedWindowCommand = new RelayCommand<Window>((p) => { return true; }, (p) =>
             {
                 if (!isLoaded)
                 {
                     isLoaded = true;

                 }
             });
        }
    }
}
