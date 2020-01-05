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
using Object = QuanLyKho_MVVM.Models.Object;

namespace QuanLyKho_MVVM.ViewModels
{
    class UCInputCountViewModel : BaseViewModel
    {
        private ObservableCollection<InputInfo> _listInputInfoes;
        private ObservableCollection<OutputInfo> _listOuputInfoes;
        private ObservableCollection<Object> _listObjects;
        private ObservableCollection<TonKho> _listTonKho;

        public ICommand LoadedWindowCommand { get; set; }

        public UCInputCountViewModel()
        {
            LoadedWindowCommand = new RelayCommand<UserControl>((p) => { return true; }, (p) =>
            {
                ListTonKho = new ObservableCollection<TonKho>();
                LoadList();
                
            });
        }

        async void LoadList()
        {
            Task task = Task.Run(() =>
            {
                ListInputInfoes = new ObservableCollection<InputInfo>(DataProvider.Instance.DB.InputInfoes);
                ListOuputInfoes = new ObservableCollection<OutputInfo>(DataProvider.Instance.DB.OutputInfoes);
                ListObjects = new ObservableCollection<Object>(DataProvider.Instance.DB.Objects);
            });
            await task;

            for (int i = 0; i < ListObjects.Count; i++)
            {
                int SumInput = 0, SumOutput = 0;
                TonKho tonkho = new TonKho();
                var getListOutput = ListOuputInfoes.Where(x => x.IdObject.Equals(ListObjects[i].Id));
                var getListInput = ListInputInfoes.Where(x => x.IdObject.Equals(ListObjects[i].Id));

                if (getListInput != null) SumInput = getListInput.Sum(x => x.Count).GetValueOrDefault(0);
                if (getListOutput != null) SumOutput = getListOutput.Sum(x => x.Count).GetValueOrDefault(0);

                tonkho.Object = ListObjects[i];
                tonkho.STT = i + 1;
                tonkho.Count = SumInput - SumOutput;
                ListTonKho.Add(tonkho);
            }
            //CalcInventory();
        }

        public ObservableCollection<InputInfo> ListInputInfoes { get => _listInputInfoes; set { _listInputInfoes = value; OnPropertyChanged(); } }
        public ObservableCollection<OutputInfo> ListOuputInfoes { get => _listOuputInfoes; set { _listOuputInfoes = value; OnPropertyChanged(); } }
        public ObservableCollection<Object> ListObjects { get => _listObjects; set { _listObjects = value; OnPropertyChanged(); } }
        public ObservableCollection<TonKho> ListTonKho { get => _listTonKho; set { _listTonKho = value; OnPropertyChanged(); } }
    }

    class TonKho
    {
        public Object Object { get; set; }
        public int STT { get; set; }
        public int Count { get; set; }
    }
}
