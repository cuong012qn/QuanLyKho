using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Input;
using QuanLyKho_MVVM.Models;
using QuanLyKho_MVVM.Views;
using Object = QuanLyKho_MVVM.Models.Object;

namespace QuanLyKho_MVVM.ViewModels
{
    class OutputViewModel : BaseViewModel
    {
        private ObservableCollection<InputInfo> _listInputInfos;
        private ObservableCollection<Customer> _listCustomers;
        private ObservableCollection<Supplier> _listSuppliers;
        private ObservableCollection<OutputInfo> _listOutputInfos;
        private ObservableCollection<Object> _listObject;
        private int _sumOutput;
        private int _countOutput;
        private int _countInput;
        private double _outputPrice;
        private string _statusInputInfo;
        private DateTime _dateTimeInput;
        private DateTime? _dateTimeOutput;
        private InputInfo _selectedInputInfo;
        private Customer _selectedCustomer;
        private Supplier _selectedSupplier;
        private Object _selectedObject;

        public ICommand ExportBillCommand { get; set; }
        public ICommand AddCommand { get; set; }
        public ICommand EditCommand { get; set; }
        public ICommand DeleteCommand { get; set; }
        public ICommand LoadedWindowCommand { get; set; }

        public ObservableCollection<Customer> ListCustomers { get => _listCustomers; set { _listCustomers = value; OnPropertyChanged(); } }
        public ObservableCollection<InputInfo> ListInputInfos { get => _listInputInfos; set { _listInputInfos = value; OnPropertyChanged(); } }
        public ObservableCollection<Supplier> ListSuppliers { get => _listSuppliers; set { _listSuppliers = value; OnPropertyChanged(); } }
        public ObservableCollection<OutputInfo> ListOutputInfos { get => _listOutputInfos; set { _listOutputInfos = value; OnPropertyChanged(); } }
        public ObservableCollection<Object> ListObject { get => _listObject; set { _listObject = value; OnPropertyChanged(); } }


        public InputInfo SelectedInputInfo { get => _selectedInputInfo; set { _selectedInputInfo = value; OnPropertyChanged(); } }
        public Customer SelectedCustomer { get => _selectedCustomer; set { _selectedCustomer = value; OnPropertyChanged(); } }
        public Supplier SelectedSupplier { get => _selectedSupplier; set { _selectedSupplier = value; OnPropertyChanged(); } }
        public Object SelectedObject
        {
            get => _selectedObject; set
            {
                _selectedObject = value; OnPropertyChanged();
                if (SelectedObject != null)
                {
                    var inputInfo = ListInputInfos.Where(x => x.IdObject.Equals(SelectedObject.Id)).SingleOrDefault();
                    if (inputInfo != null)
                    {
                        CountInput = inputInfo.Count.GetValueOrDefault();
                        StatusInputInfo = inputInfo.Status;
                        DateTimeInput = inputInfo.Input.DateInput.GetValueOrDefault();
                    }
                }
            }
        }
        public int SumOutput { get => _sumOutput; set { _sumOutput = value; OnPropertyChanged(); } }
        public DateTime? DateTimeOutput { get => _dateTimeOutput; set { _dateTimeOutput = value; OnPropertyChanged(); } }
        public int CountOutput { get => _countOutput; set { _countOutput = value; OnPropertyChanged(); } }
        public int CountInput { get => _countInput; set { _countInput = value; OnPropertyChanged(); } }
        public double OutputPrice { get => _outputPrice; set { _outputPrice = value; OnPropertyChanged(); } }
        public string StatusInputInfo { get => _statusInputInfo; set { _statusInputInfo = value; OnPropertyChanged(); } }
        public DateTime DateTimeInput { get => _dateTimeInput; set { _dateTimeInput = value; OnPropertyChanged(); } }

        public OutputViewModel()
        {
            ExportBillCommand = new RelayCommand<object>((p) => { return true; }, (p) => { ExportBillView exportBillView = new ExportBillView(); exportBillView.ShowDialog(); });
            LoadedWindowCommand = new RelayCommand<Window>((p) => { return true; }, (p) =>
            {
                LoadList();
            });

            AddCommand = new RelayCommand<object>((p) => { return true; }, (p) =>
            {
                if (SelectedSupplier != null && SelectedCustomer != null)
                {
                    Output output = new Output()
                    {
                        Id = Guid.NewGuid().ToString(),
                        DateOutput = DateTimeOutput.GetValueOrDefault()
                    };

                    OutputInfo outputInfo = new OutputInfo()
                    {
                        Id = output.Id,
                        IdObject = ListObject.Where(x => x.IdSuplier.Equals(SelectedSupplier.Id)).Select(x => x.Id).FirstOrDefault(),
                        IdCustomer = SelectedCustomer.Id,
                        Count = CountOutput,
                        Status = StatusInputInfo
                    };

                    ListOutputInfos.Add(outputInfo);
                }
                else MessageBox.Show("Vui lòng nhập đủ thông tin", "Thông báo", MessageBoxButton.OK, MessageBoxImage.Error);
            });
            EditCommand = new RelayCommand<object>((p) => { return true; }, (p) => { });
            DeleteCommand = new RelayCommand<object>((p) => { return true; }, (p) => { });

        }

        async void LoadList()
        {
            await Task.Run(() =>
            {
                ListObject = new ObservableCollection<Object>(DataProvider.Instance.DB.Objects);
                ListSuppliers = new ObservableCollection<Supplier>(DataProvider.Instance.DB.Suppliers);
                ListCustomers = new ObservableCollection<Customer>(DataProvider.Instance.DB.Customers);
                ListInputInfos = new ObservableCollection<InputInfo>(DataProvider.Instance.DB.InputInfoes);
            });
        }
    }
}
