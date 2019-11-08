using QuanLyKho_MVVM.Models;
using System;
using System.Collections.ObjectModel;
using Object = QuanLyKho_MVVM.Models.Object;

namespace QuanLyKho_MVVM.ViewModels
{
    class InputViewModel : BaseViewModel
    {
        private ObservableCollection<Object> _listObject;
        private ObservableCollection<InputInfo> _listInputInfos;

        public ObservableCollection<Object> ListObject { get => _listObject; set { _listObject = value; OnPropertyChanged(); } }

        public ObservableCollection<InputInfo> ListInputInfos { get => _listInputInfos; set { _listInputInfos = value; OnPropertyChanged(); } }

        public InputViewModel()
        {
            ListInputInfos = new ObservableCollection<InputInfo>(DataProvider.Instance.DB.InputInfoes);
            ListObject = new ObservableCollection<Object>(DataProvider.Instance.DB.Objects);
        }
    }
}
