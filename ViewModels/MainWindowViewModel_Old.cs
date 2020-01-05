using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Input;
using QuanLyKho_MVVM.Views;
using QuanLyKho_MVVM.Models;
using System.Collections.ObjectModel;
using MaterialDesignThemes.Wpf;
using System.ComponentModel;

namespace QuanLyKho_MVVM.ViewModels
{
    class MainWindowViewModel_Old : BaseViewModel
    {
        #region Private Properties
        private string displayName;
        private string userName;
        private int IdRole;
        private ObservableCollection<InputInfo> _listInputInfos;
        #endregion

        #region Command
        public ICommand LoadedWindowCommand { get; set; }
        public ICommand InputCommand { get; set; }
        public ICommand CommandChangeInfoUser { get; set; }
        public ICommand CustomerCommand { get; set; }
        public ICommand UnitCommand { get; set; }
        public ICommand SuplierCommand { get; set; }
        public ICommand ObjectCommand { get; set; }
        public ICommand OutputCommand { get; set; }
        #endregion

        #region Public Properties
        public bool IsLoaded = false;
        public string DisplayName
        {
            get => displayName;
            set
            {
                displayName = value;
                OnPropertyChanged();
            }
        }
        public ObservableCollection<InputInfo> ListInputInfos { get => _listInputInfos; set { _listInputInfos = value; OnPropertyChanged(); } }
        #endregion

        public MainWindowViewModel_Old()
        {
            LoadCommand();
        }

        #region CoreFunction
        async void LoadList()
        {
            await Task.Run(() => { ListInputInfos = new ObservableCollection<InputInfo>(DataProvider.Instance.DB.InputInfoes); });
        }

        void LoadCommand()
        {
            LoadedWindowCommand = new RelayCommand<Window>((p) => { return true; }, (p) =>
            {
                if (!IsLoaded)
                {
                    p.Hide();
                    LoginView lView = new LoginView();
                    lView.ShowDialog();
                    var loginVM = lView.DataContext as LoginViewModel;
                    if (loginVM.IsLogin)
                    {
                        p.Show();
                        DisplayName = loginVM.DisplayName;
                        userName = loginVM.Username;
                        IdRole = loginVM.idRole;
                        IsLoaded = true;
                        LoadObject();

                        //OutputBetaView beta = new OutputBetaView();
                        //beta.ShowDialog();
                    }
                    else
                    {
                        p.Close();
                    }
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

            InputCommand = new RelayCommand<object>((p) => { return IsLoaded; }, async (p) => { InputUCView inputUC = new InputUCView(); await DialogHost.Show(inputUC); });

            CustomerCommand = new RelayCommand<object>((p) => { return IsLoaded; }, async (p) => { CustomerUCView customerUC = new CustomerUCView(); await DialogHost.Show(customerUC); });

            UnitCommand = new RelayCommand<object>((p) => { return IsLoaded; }, async (p) => { UnitUCView unitUc = new UnitUCView(); await DialogHost.Show(unitUc); });

            SuplierCommand = new RelayCommand<object>((p) => { return IsLoaded; }, async (p) => { SupplierUCView supplierUC = new SupplierUCView(); await DialogHost.Show(supplierUC); });

            ObjectCommand = new RelayCommand<object>((p) => { return IsLoaded; }, async (p) => { ObjectUCView objectuc = new ObjectUCView(); await DialogHost.Show(objectuc); });

            OutputCommand = new RelayCommand<object>((p) => { return IsLoaded; }, async (p) => { OutputUCView outputUC = new OutputUCView(); await DialogHost.Show(outputUC); });
        }

        private void ExtendedClosingEventHandler(object sender, DialogClosingEventArgs eventArgs)
        {
            if ((bool)eventArgs.Parameter == false) return;

            //OK, lets cancel the close...
            eventArgs.Cancel();
        }

        void LoadObject()
        {
            var listInputInfo = DataProvider.Instance.DB.InputInfoes;
            foreach (InputInfo item in listInputInfo)
            {
                if (item.Count <= 0)
                {
                    item.Status = "Hết hàng";
                }
            }
            DataProvider.Instance.DB.SaveChanges();
            LoadList();
        }
        #endregion
    }
}
