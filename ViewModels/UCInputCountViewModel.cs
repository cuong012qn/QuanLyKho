using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Controls;
using System.Windows.Input;
using MaterialDesignThemes.Wpf;
using QuanLyKho_MVVM.Models;
using QuanLyKho_MVVM.Views;

namespace QuanLyKho_MVVM.ViewModels
{
    class UCInputCountViewModel : BaseViewModel
    {
        private LoadingView loadingview;
        private ObservableCollection<InputInfo> _listInputInfo;

        public ICommand LoadedWindowCommand { get; set; }

        public UCInputCountViewModel()
        {
            LoadedWindowCommand = new RelayCommand<UserControl>((p) => { return true; }, (p) => { LoadList(); });
        }

        async void LoadList()
        {
            loadingview = new LoadingView();
            var temp = DialogHost.Show(loadingview, "RootMainWindow");
            Task task = Task.Run(() => { ListInputInfo = new ObservableCollection<InputInfo>(DataProvider.Instance.DB.InputInfoes); });
            await task;
            if (task.IsCompleted)
            {
                DialogHost.CloseDialogCommand.Execute(null, null);
            }
        }

        public ObservableCollection<InputInfo> ListInputInfo { get => _listInputInfo; set { _listInputInfo = value; OnPropertyChanged(); } }
    }
}
