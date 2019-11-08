using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Input;
using QuanLyKho_MVVM.Views;
using QuanLyKho_MVVM.Models;

namespace QuanLyKho_MVVM.ViewModels
{
    class MainViewModel : BaseViewModel
    {
        private string displayName;
        private string userName;
        private int IdRole;

        public bool IsLoaded = false;
        public ICommand LoadedWindowCommand { get; set; }
        public ICommand InputCommand { get; set; }
        public ICommand CommandChangeInfoUser { get; set; }
        public ICommand CustomerCommand { get; set; }
        public ICommand UnitCommand { get; set; }
        public ICommand SuplierCommand { get; set; }
        public ICommand ObjectCommand { get; set; }
        public string DisplayName
        {
            get => displayName;
            set
            {
                displayName = value;
                OnPropertyChanged();
            }
        }

        public MainViewModel()
        {
            LoadedWindowCommand = new RelayCommand<Window>((p) => { return true; }, (p) =>
            {
                p.Hide();
                IsLoaded = true;
                LoginView lView = new LoginView();
                lView.ShowDialog();

                var loginVM = lView.DataContext as LoginViewModel;
                if (loginVM.IsLogin)
                {
                    p.Show();
                    DisplayName = loginVM.DisplayName;
                    userName = loginVM.Username;
                    IdRole = loginVM.idRole;
                }
                else
                {
                    p.Close();
                }
            });

            CommandChangeInfoUser = new RelayCommand<object>((p) => { return true; }, (p) =>
            {
                if (IdRole.Equals(2))
                {
                    ChangeInfoNUserView changeinfo = new ChangeInfoNUserView();
                    var changeInfoVM = changeinfo.DataContext as DefaultUserViewModel;
                    changeInfoVM.DisplayName = displayName;
                    changeInfoVM.UserName = userName;
                    changeinfo.ShowDialog();
                }
                else if (IdRole.Equals(1))
                {
                    ChangeInfoAdminUserView changeinfo = new ChangeInfoAdminUserView();
                    changeinfo.ShowDialog();
                }
            });

            InputCommand = new RelayCommand<object>((p) => { return true; }, (p) => { InputView input = new InputView(); input.ShowDialog(); });

            CustomerCommand = new RelayCommand<object>((p) => { return true; }, (p) => { CustomerView customer = new CustomerView(); customer.ShowDialog(); });

            UnitCommand = new RelayCommand<object>((p) => { return true; }, (p) => { UnitView unit = new UnitView(); unit.ShowDialog(); });

            SuplierCommand = new RelayCommand<object>((p) => { return true; }, (p) => { SupplierView suplier = new SupplierView(); suplier.ShowDialog(); });

            ObjectCommand = new RelayCommand<object>((p) => { return true; }, (p) => { ObjectView objectView = new ObjectView(); objectView.ShowDialog(); });
        }
    }
}
