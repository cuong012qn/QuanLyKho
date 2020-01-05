using MaterialDesignThemes.Wpf;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Controls;
using QuanLyKho_MVVM.Views;
using System.Windows.Input;
using QuanLyKho_MVVM.Models;
using QuanLyKho_MVVM.UC;
using System.Windows;

namespace QuanLyKho_MVVM.ViewModels
{
    class MainWindowViewModel : BaseViewModel
    {
        public ICommand LoadedWindowCommand { get; set; }
        public string DisplayNameUserRole { get => displayNameUserRole; set { displayNameUserRole = value; OnPropertyChanged(); } }

        private bool isLoaded;
        private string displayNameUserRole;

        public MainWindowViewModel()
        {
            LoadedWindowCommand = new RelayCommand<Window>((p) => { return true; }, (p) =>
            {
                if (!isLoaded)
                {
                    p.Hide();
                    var login = new LoginView();
                    login.ShowDialog();
                    var temp = login.DataContext as LoginViewModel;
                    if (temp.IsLogin)
                    {
                        isLoaded = true;
                        DisplayNameUserRole = DataProvider.Instance.DB.UserRoles.Where(x => x.Id.Equals(temp.idRole)).Select(x => x.DisplayName).FirstOrDefault();
                        p.Show();
                    }
                    else p.Close();
                }
            });
        }
    }
}
