using QuanLyKho_MVVM.Models;
using System;
using System.Collections.ObjectModel;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Input;
using System.Windows;
using Object = QuanLyKho_MVVM.Models.Object;
using QuanLyKho_MVVM.Views;
using MaterialDesignThemes.Wpf;
using System.Windows.Controls;

namespace QuanLyKho_MVVM.ViewModels
{
    class UCOutputViewModel : BaseViewModel
    {
        private ObservableCollection<InputInfo> _listInputInfoes;
        private ObservableCollection<OutputInfo> _listOuputInfoes;
        private ObservableCollection<Object> _listObjects;
        private ObservableCollection<Customer> _listCustomers;

        private double _TotalPrice;
        private int _CountOutput;
        private DateTime _DateTimeOutput = DateTime.Now;

        private Customer _selectedCustomer;
        private Object _selectedObject;
        private InputInfo _selectedInputInfo;
        private OutputInfo _selectedOutputInfo;

        public ICommand AddCommand { get; set; }
        public ICommand DeleteCommand { get; set; }
        public ICommand LoadedWindowCommand { get; set; }
        public ICommand ExportBill { get; set; }
        public ICommand ScanBarcodeCommand { get; set; }

        public ObservableCollection<InputInfo> ListInputInfoes { get => _listInputInfoes; set { _listInputInfoes = value; OnPropertyChanged(); } }
        public ObservableCollection<OutputInfo> ListOuputInfoes { get => _listOuputInfoes; set { _listOuputInfoes = value; OnPropertyChanged(); } }
        public ObservableCollection<Object> ListObjects { get => _listObjects; set { _listObjects = value; OnPropertyChanged(); } }
        public ObservableCollection<Customer> ListCustomers { get => _listCustomers; set { _listCustomers = value; OnPropertyChanged(); } }

        public Customer SelectedCustomer { get => _selectedCustomer; set { _selectedCustomer = value; OnPropertyChanged(); } }
        public Object SelectedObject
        {
            get => _selectedObject; set
            {
                _selectedObject = value; OnPropertyChanged();
                if (SelectedObject != null) SelectedInputInfo = SelectedObject.InputInfoes.First();
            }
        }
        public InputInfo SelectedInputInfo { get => _selectedInputInfo; set { _selectedInputInfo = value; OnPropertyChanged(); } }
        public OutputInfo SelectedOutputInfo { get => _selectedOutputInfo; set { _selectedOutputInfo = value; OnPropertyChanged(); } }

        public int CountOutput
        {
            get => _CountOutput;
            set
            {
                _CountOutput = value;
                OnPropertyChanged();
            }
        }
        public DateTime DateTimeOutput { get => _DateTimeOutput; set { _DateTimeOutput = value; OnPropertyChanged(); } }
        public double TotalPrice { get => _TotalPrice; set { _TotalPrice = value; OnPropertyChanged(); } }

        public UCOutputViewModel()
        {
            LoadCommand();
        }

        private void LoadCommand()
        {
            LoadedWindowCommand = new RelayCommand<UserControl>((p) => { return true; }, (p) => { LoadList(); });

            AddCommand = new RelayCommand<object>((p) => { return true; }, (p) =>
            {
                if (SelectedObject != null && SelectedCustomer != null
                && SelectedInputInfo.Status.Equals("Còn hàng") && DateTimeOutput != null)
                {
                    Output output = new Output() { Id = Guid.NewGuid().ToString(), DateOutput = DateTimeOutput };

                    OutputInfo outputInfo = new OutputInfo()
                    {
                        Customer = SelectedCustomer,
                        Object = SelectedObject,
                        InputInfo = SelectedInputInfo,
                        Id = output.Id,
                        IdObject = SelectedObject.Id,
                        IdInputInfo = SelectedInputInfo.Id,
                        IdCustomer = SelectedCustomer.Id,
                        Count = CountOutput,
                        Status = null
                    };
                    ListOuputInfoes.Add(outputInfo);
                    TotalPrice += (CountOutput * SelectedInputInfo.OutputPrice.GetValueOrDefault());
                    ResetObject();
                }
            });

            DeleteCommand = new RelayCommand<object>((p) => { return true; }, (p) =>
            {
                if (SelectedOutputInfo != null)
                {
                    ListOuputInfoes.Remove(SelectedOutputInfo);
                }
            });

            ScanBarcodeCommand = new RelayCommand<string>((p) => { return true; }, (p) =>
            {
                var result = ListObjects.Where(x => x.BarCode.Equals(p));
            });

            ExportBill = new RelayCommand<object>((p) => { return true; }, (p) =>
            {
                if (ListOuputInfoes.Count.Equals(0)) MessageBox.Show("Không thể xuất vì không có dữ liệu", "Thông báo", MessageBoxButton.OK, MessageBoxImage.Error);
                else
                {
                    var GetResult = MessageBox.Show("Bạn có muốn xuất hóa đơn?\nKhông thể hoàn tác", "Thông báo", MessageBoxButton.YesNo, MessageBoxImage.Question);
                    if (GetResult == MessageBoxResult.Yes)
                    {
                        Output output = new Output() { Id = ListOuputInfoes.First().Id, DateOutput = DateTimeOutput };
                        DataProvider.Instance.DB.Outputs.Add(output);

                        foreach (OutputInfo info in ListOuputInfoes)
                        {
                            DataProvider.Instance.DB.OutputInfoes.Add(info);
                        }
                        DataProvider.Instance.DB.SaveChanges();
                        ResetObject();
                    }
                }
            });
        }

        private void ResetObject()
        {
            SelectedInputInfo = null;
            SelectedCustomer = null;
            SelectedObject = null;
            SelectedOutputInfo = null;
            DateTimeOutput = DateTime.Now;
        }

        private async void LoadList()
        {
            LoadingView loading = new LoadingView();
            var temp = DialogHost.Show(loading, "RootMainWindow");

            Task task = Task.Run(() =>
            {
                ListOuputInfoes = new ObservableCollection<OutputInfo>();
                ListInputInfoes = new ObservableCollection<InputInfo>(DataProvider.Instance.DB.InputInfoes);
                //ListOuputInfoes = new ObservableCollection<OutputInfo>(DataProvider.Instance.DB.OutputInfoes);
                ListObjects = new ObservableCollection<Object>(DataProvider.Instance.DB.Objects);
                ListCustomers = new ObservableCollection<Customer>(DataProvider.Instance.DB.Customers);
            });

            await task;
            if (task.IsCompleted) DialogHost.CloseDialogCommand.Execute(null, null);
        }

    }
}
