using QuanLyKho_MVVM.Models;
using System;
using System.Collections.ObjectModel;
using System.Windows;
using System.Windows.Input;
using System.Linq;
using Object = QuanLyKho_MVVM.Models.Object;
using System.Globalization;

namespace QuanLyKho_MVVM.ViewModels
{
    class InputViewModel : BaseViewModel
    {
        private ObservableCollection<Object> _listObject;
        private ObservableCollection<InputInfo> _listInputInfos;
        private InputInfo _selectedInputInfo;
        private Object _selectedObject;
        private int _sumCount;
        private double _sumInputPrice;
        private int? _count;
        private double? _inputPrice;
        private double? _outputPrice;
        private string _status;
        private DateTime? _dateInput;
        private string _search;

        public ObservableCollection<Object> ListObject { get => _listObject; set { _listObject = value; OnPropertyChanged(); } }
        public ObservableCollection<InputInfo> ListInputInfos { get => _listInputInfos; set { _listInputInfos = value; OnPropertyChanged(); } }
        public ICommand AddCommand { get; set; }
        public ICommand EditCommand { get; set; }
        public ICommand DeleteCommand { get; set; }
        public ICommand LoadedWindowCommand { get; set; }
        public InputInfo SelectedInputInfo
        {
            get => _selectedInputInfo;
            set
            {
                _selectedInputInfo = value;
                OnPropertyChanged();
                if (SelectedInputInfo != null)
                {
                    Count = SelectedInputInfo.Count;
                    InputPrice = SelectedInputInfo.InputPrice;
                    OutputPrice = SelectedInputInfo.OutputPrice;
                    Status = SelectedInputInfo.Status;
                    DateInput = SelectedInputInfo.Input.DateInput;
                    SelectedObject = SelectedInputInfo.Object;
                }
            }
        }

        public int? Count { get => _count; set { _count = value; OnPropertyChanged(); } }
        public double? InputPrice { get => _inputPrice; set { _inputPrice = value; OnPropertyChanged(); } }
        public double? OutputPrice { get => _outputPrice; set { _outputPrice = value; OnPropertyChanged(); } }
        public string Status { get => _status; set { _status = value; OnPropertyChanged(); } }
        public DateTime? DateInput { get => _dateInput; set { _dateInput = value; OnPropertyChanged(); } }
        public Object SelectedObject
        {
            get => _selectedObject; set
            {
                _selectedObject = value; OnPropertyChanged();
            }
        }

        public string Search { get => _search; set { _search = value; OnPropertyChanged(); SearchObject(); } }
        public int SumCount { get => _sumCount; set { _sumCount = value; OnPropertyChanged(); } }

        public double SumInputPrice { get => _sumInputPrice; set { _sumInputPrice = value; OnPropertyChanged(); } }

        public InputViewModel()
        {
            LoadedWindowCommand = new RelayCommand<Window>((p) => { return true; }, (p) =>
            {
                ListInputInfos = new ObservableCollection<InputInfo>(DataProvider.Instance.DB.InputInfoes);
                ListObject = new ObservableCollection<Object>(DataProvider.Instance.DB.Objects);
                UpdateSumInputInfo();
            });

            AddCommand = new RelayCommand<object>((p) => { return true; }, (p) =>
            {
                if (SelectedObject != null && Count > 0 && InputPrice > 0 && OutputPrice > 0 && DateInput != null)
                {
                    Input input = new Input() { DateInput = DateInput, Id = Guid.NewGuid().ToString() };
                    DataProvider.Instance.DB.Inputs.Add(input);

                    InputInfo inputinfo = new InputInfo()
                    {
                        Id = Guid.NewGuid().ToString(),
                        IdObject = SelectedObject.Id,
                        IdInput = input.Id,
                        Count = Count,
                        InputPrice = InputPrice,
                        OutputPrice = OutputPrice,
                        Status = Status,
                    };
                    DataProvider.Instance.DB.InputInfoes.Add(inputinfo);
                    DataProvider.Instance.DB.SaveChanges();
                    ListInputInfos.Add(inputinfo);
                    SumInputPrice += inputinfo.InputPrice.GetValueOrDefault();
                    SumCount += inputinfo.Count.GetValueOrDefault();
                }
                else MessageBox.Show("Vui lòng nhập đủ dữ liệu", "Thông báo", MessageBoxButton.OK, MessageBoxImage.Error);
            });

            EditCommand = new RelayCommand<object>((p) => { return true; }, (p) =>
            {
                if (SelectedInputInfo != null)
                {
                    var item = DataProvider.Instance.DB.InputInfoes.Where(x => x.Id.Equals(SelectedInputInfo.Id)).SingleOrDefault();
                    if (item != null)
                    {
                        item.Count = Count;
                        item.InputPrice = InputPrice;
                        item.OutputPrice = OutputPrice;
                        item.Status = Status;
                        item.Input.DateInput = DateInput;
                        UpdateSumInputInfo();
                        DataProvider.Instance.DB.SaveChanges();
                        MessageBox.Show("Sửa thành công", "Thông báo", MessageBoxButton.OK);
                    }
                }
            });

            DeleteCommand = new RelayCommand<object>((p) => { return true; }, (p) =>
            {
                var dialog = MessageBox.Show("Bạn có chắc muốn xóa?", "Thông báo", MessageBoxButton.YesNo, MessageBoxImage.Question);
                if (dialog.Equals(MessageBoxResult.Yes))
                {
                    if (SelectedInputInfo != null)
                    {
                        var item = DataProvider.Instance.DB.InputInfoes.Where(x => x.Id.Equals(SelectedInputInfo.Id)).SingleOrDefault();
                        if (item != null)
                        {
                            DataProvider.Instance.DB.InputInfoes.Remove(item);
                            DataProvider.Instance.DB.SaveChanges();
                            SumCount -= item.Count.GetValueOrDefault();
                            SumInputPrice -= item.InputPrice.GetValueOrDefault();
                            ListInputInfos.Remove(item);
                            MessageBox.Show("Đã xóa thành công", "Thông báo", MessageBoxButton.OK);
                        }
                    }
                }
            });
        }

        void UpdateSumInputInfo()
        {
            foreach (InputInfo inputInfo in ListInputInfos)
            {
                SumCount += inputInfo.Count.GetValueOrDefault();
                SumInputPrice += inputInfo.InputPrice.GetValueOrDefault();
            }
        }

        void SearchObject()
        {
            if (string.IsNullOrEmpty(Search))
            {

            }
        }
    }
}
