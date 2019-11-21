using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Input;
using QuanLyKho_MVVM.Models;
using QuanLyKho_MVVM.ViewModels;

namespace QuanLyKho_MVVM.ViewModels
{
    class OutputBetaViewModel : BaseViewModel
    {
        private ObservableCollection<InputInfo> inputInfos;

        public ObservableCollection<InputInfo> InputInfos { get => inputInfos; set { inputInfos = value; OnPropertyChanged(); } }

        public ICommand LoadedWindowCommand { get; set; }

        public OutputBetaViewModel()
        {
            LoadedWindowCommand = new RelayCommand<Window>((p) => { return true; }, (p) =>
            {
                LoadList();
                //InputInfos = new ObservableCollection<InputInfo>(DataProvider.Instance.DB.InputInfoes);
            });
        }

        async void LoadList()
        {
            await Task.Run(() => { InputInfos = new ObservableCollection<InputInfo>(DataProvider.Instance.DB.InputInfoes); });
        }
    }
}
