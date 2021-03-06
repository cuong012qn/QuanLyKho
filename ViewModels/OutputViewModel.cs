﻿using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
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
        #region Private Properties
        private ObservableCollection<InputInfo> _listInputInfos;
        private ObservableCollection<Customer> _listCustomers;
        private ObservableCollection<Supplier> _listSuppliers;
        private ObservableCollection<OutputInfo> _listOutputInfos = new ObservableCollection<OutputInfo>();
        private ObservableCollection<Object> _listObject;
        private ObservableCollection<Output> _listOutput = new ObservableCollection<Output>();
        private double _sumOutput;
        private int _countOutput;
        private int _countInput;
        private double _outputPrice;
        private string _statusInputInfo;
        private DateTime? _dateTimeInput;
        private DateTime? _dateTimeOutput;
        private InputInfo _selectedInputInfo;
        private Customer _selectedCustomer;
        private Supplier _selectedSupplier;
        private Object _selectedObject;
        private OutputInfo _selectedOutputInfo;
        #endregion

        #region Command
        public ICommand ExportBillCommand { get; set; }
        public ICommand AddCommand { get; set; }
        public ICommand EditCommand { get; set; }
        public ICommand DeleteCommand { get; set; }
        public ICommand LoadedWindowCommand { get; set; }
        #endregion

        #region Public Properties
        public ObservableCollection<Customer> ListCustomers { get => _listCustomers; set { _listCustomers = value; OnPropertyChanged(); } }
        public ObservableCollection<InputInfo> ListInputInfos { get => _listInputInfos; set { _listInputInfos = value; OnPropertyChanged(); } }
        public ObservableCollection<Supplier> ListSuppliers { get => _listSuppliers; set { _listSuppliers = value; OnPropertyChanged(); } }
        public ObservableCollection<OutputInfo> ListOutputInfos { get => _listOutputInfos; set { _listOutputInfos = value; OnPropertyChanged(); } }
        public ObservableCollection<Object> ListObject
        {
            get
            {

                return _listObject;
            }
            set
            {
                _listObject = value; OnPropertyChanged();
            }
        }

        public ObservableCollection<Output> ListOutput { get => _listOutput; set { _listOutput = value; OnPropertyChanged(); } }
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
                        OutputPrice = inputInfo.OutputPrice.GetValueOrDefault();
                    }
                }
            }
        }
        public DateTime? DateTimeOutput { get => _dateTimeOutput; set { _dateTimeOutput = value; OnPropertyChanged(); } }
        public DateTime? DateTimeInput { get => _dateTimeInput; set { _dateTimeInput = value; OnPropertyChanged(); } }
        public int CountOutput
        {
            get => _countOutput;
            set
            {

                _countOutput = value;
                OnPropertyChanged();
            }
        }
        public int CountInput { get => _countInput; set { _countInput = value; OnPropertyChanged(); } }
        public double SumOutput { get => _sumOutput; set { _sumOutput = value; OnPropertyChanged(); } }
        public double OutputPrice { get => _outputPrice; set { _outputPrice = value; OnPropertyChanged(); } }
        public string StatusInputInfo { get => _statusInputInfo; set { _statusInputInfo = value; OnPropertyChanged(); } }
        public OutputInfo SelectedOutputInfo
        {
            get => _selectedOutputInfo;
            set
            {
                _selectedOutputInfo = value;
                OnPropertyChanged();
                if (SelectedOutputInfo != null)
                {
                    SelectedObject = SelectedOutputInfo.Object;
                    SelectedCustomer = SelectedOutputInfo.Customer;
                    CountOutput = SelectedOutputInfo.Count.GetValueOrDefault();
                    DateTimeOutput = ListOutput.Where(x => x.Id.Equals(SelectedOutputInfo.Id)).Select(x => x.DateOutput).FirstOrDefault();
                }
            }
        }
        #endregion

        public OutputViewModel()
        {
            LoadCommand();
        }

        #region CoreFunction
        void UpdatePriceBill()
        {
            foreach (OutputInfo outputInfo in ListOutputInfos)
            {
                SumOutput += (outputInfo.InputInfo.OutputPrice.GetValueOrDefault() * CountOutput);
            }
        }

        void LoadCommand()
        {
            ExportBillCommand = new RelayCommand<object>((p) => { return true; }, (p) =>
            {
                if (ListOutputInfos != null)
                {

                    foreach (Output output in ListOutput)
                    {
                        DataProvider.Instance.DB.Outputs.Add(output);
                    }

                    foreach (OutputInfo outputInfo in ListOutputInfos)
                    {
                        var count = DataProvider.Instance.DB.InputInfoes.Where(x => x.Id.Equals(outputInfo.IdInputInfo) && x.Count > outputInfo.Count).FirstOrDefault();
                        if (count != null)
                        {
                            DataProvider.Instance.DB.OutputInfoes.Add(outputInfo);
                            var item = DataProvider.Instance.DB.InputInfoes.Where(x => x.Id.Equals(outputInfo.IdInputInfo)).FirstOrDefault();
                            if (item != null)
                            {
                                item.Count -= outputInfo.Count;
                                if (item.Count.Equals(0)) item.Status = "Hết hàng";
                            }
                        }
                        DataProvider.Instance.DB.SaveChanges();
                        ExportBillView exportBillView = new ExportBillView();
                        exportBillView.ShowDialog();
                    }
                }
            });

            LoadedWindowCommand = new RelayCommand<Window>((p) => { return true; }, (p) =>
            {
                LoadList();
                SelectedCustomer = null;
                SelectedInputInfo = null;
                SelectedObject = null;
                SelectedSupplier = null;
                CountInput = 0;
                CountOutput = 0;
                OutputPrice = 0;
                StatusInputInfo = string.Empty;
                DateTimeOutput = null;
                DateTimeInput = null;
            });

            AddCommand = new RelayCommand<object>((p) => { return true; }, (p) =>
            {
                if (SelectedCustomer != null && SelectedObject != null)
                {
                    var item = ListOutputInfos.Where(x => x.IdObject.Equals(SelectedObject.Id)).FirstOrDefault();
                    if (item != null)
                    {
                        var output = ListOutputInfos.Where(x => x.IdObject.Equals(item.IdObject)).FirstOrDefault();
                        ListOutputInfos.Remove(item);
                        output.Count += CountOutput;
                        ListOutputInfos.Add(output);
                    }
                    else
                    {
                        if (StatusInputInfo.Equals("Hết hàng")) MessageBox.Show("Không thể thêm", "Thông báo", MessageBoxButton.OK, MessageBoxImage.Error);
                        else
                        {
                            Output output = new Output()
                            {
                                Id = Guid.NewGuid().ToString(),
                                DateOutput = DateTimeOutput.GetValueOrDefault()
                            };
                            ListOutput.Add(output);

                            OutputInfo outputInfo = new OutputInfo()
                            {
                                Id = output.Id,
                                IdObject = SelectedObject.Id,
                                IdInputInfo = ListInputInfos.Where(x => x.IdObject.Equals(SelectedObject.Id)).Select(x => x.Id).FirstOrDefault(),
                                IdCustomer = SelectedCustomer.Id,
                                Count = CountOutput,
                                Status = StatusInputInfo,
                                Object = ListObject.Where(x => x.Id.Equals(SelectedObject.Id)).SingleOrDefault(),
                                InputInfo = ListInputInfos.Where(x => x.IdObject.Equals(SelectedObject.Id)).SingleOrDefault()
                            };
                            ListOutputInfos.Add(outputInfo);
                        }
                    }
                    UpdatePriceBill();
                }
                else MessageBox.Show("Vui lòng nhập đủ thông tin", "Thông báo", MessageBoxButton.OK, MessageBoxImage.Error);
            });

            EditCommand = new RelayCommand<object>((p) => { return true; }, (p) =>
            {
                //if (SelectedOutputInfo != null)
                //{
                //    var item = ListOutputInfos.Where(x => x.Id.Equals(SelectedOutputInfo.Id)).FirstOrDefault();
                //    if (item != null)
                //    {

                //    }
                //}
            });

            DeleteCommand = new RelayCommand<object>((p) => { return true; }, (p) =>
            {
                if (SelectedOutputInfo != null)
                {
                    var result = MessageBox.Show("Bạn có chắc muốn xóa?", "Thông báo", MessageBoxButton.YesNo, MessageBoxImage.Warning);
                    if (result.Equals(MessageBoxResult.Yes))
                    {
                        var item = ListOutputInfos.Where(x => x.Id.Equals(SelectedOutputInfo.Id)).FirstOrDefault();
                        ListOutputInfos.Remove(item);
                    }
                }
            });
        }

        async void LoadList()
        {
            await Task.Run(() =>
            {
                ListObject = new ObservableCollection<Object>(DataProvider.Instance.DB.Objects.Where(x => x.InputInfoes.Count > 0));
                ListSuppliers = new ObservableCollection<Supplier>(DataProvider.Instance.DB.Suppliers);
                ListCustomers = new ObservableCollection<Customer>(DataProvider.Instance.DB.Customers);
                ListInputInfos = new ObservableCollection<InputInfo>(DataProvider.Instance.DB.InputInfoes);
            });
        }
        #endregion
    }
}
