using QuanLyKho_MVVM.Models;
using System;
using System.Collections.ObjectModel;
using System.Linq;
using System.Windows;
using System.Windows.Input;
using System.Threading.Tasks;

namespace QuanLyKho_MVVM.ViewModels
{
    class CustomerViewModel : BaseViewModel
    {
        #region Properties
        private ObservableCollection<Customer> _listCustomers;
        private string _displayName = string.Empty;
        private string _address = string.Empty;
        private string _phone = string.Empty;
        private string _email = string.Empty;
        private string _moreInfo = string.Empty;
        private DateTime? _contractDate = null;
        private Customer _selectedCustomer;

        public ObservableCollection<Customer> ListCustomers { get => _listCustomers; set { _listCustomers = value; OnPropertyChanged(); } }
        public Customer SelectedCustomer
        {
            get => _selectedCustomer; set
            {
                _selectedCustomer = value;
                OnPropertyChanged();

                if (SelectedCustomer != null)
                {
                    DisplayName = SelectedCustomer.DisplayName;
                    Address = SelectedCustomer.Address;
                    Phone = SelectedCustomer.Phone;
                    Email = SelectedCustomer.Email;
                    MoreInfo = SelectedCustomer.MoreInfo;
                    ContractDate = SelectedCustomer.ContractDate;
                }
            }
        }
        public string DisplayName { get => _displayName; set { _displayName = value; OnPropertyChanged(); } }
        public string Address { get => _address; set { _address = value; OnPropertyChanged(); } }
        public string Phone { get => _phone; set { _phone = value; OnPropertyChanged(); } }
        public string Email { get => _email; set { _email = value; OnPropertyChanged(); } }
        public string MoreInfo { get => _moreInfo; set { _moreInfo = value; OnPropertyChanged(); } }
        public DateTime? ContractDate { get => _contractDate; set { _contractDate = value; OnPropertyChanged(); } }
        #endregion

        #region Command
        public ICommand AddCommand { get; set; }
        public ICommand EditCommand { get; set; }
        public ICommand DeleteCommand { get; set; }
        public ICommand DeleteTextCommand { get; set; }
        public ICommand LoadedCommand { get; set; }
        public ICommand MouseWheelCommand { get; set; }
        #endregion

        async void LoadList()
        {
            await Task.Run(() => { ListCustomers = new ObservableCollection<Customer>(DataProvider.Instance.DB.Customers); });
        }

        public CustomerViewModel()
        {


            EditCommand = new RelayCommand<object>((p) =>
            {
                if (SelectedCustomer != null) return true;
                return false;
            }, (p) =>
            {
                if (SelectedCustomer != null)
                {
                    var item = DataProvider.Instance.DB.Customers.Where(x => x.Id.Equals(SelectedCustomer.Id)).SingleOrDefault();
                    item.DisplayName = DisplayName;
                    item.Address = Address;
                    item.Phone = Phone;
                    item.Email = Email;
                    item.MoreInfo = MoreInfo;
                    item.ContractDate = ContractDate;
                    DataProvider.Instance.DB.SaveChanges();

                }
            });

            AddCommand = new RelayCommand<object>((p) =>
            {
                return true;
            }, (p) =>
            {
                Customer customer = new Customer()
                {
                    DisplayName = DisplayName,
                    Address = Address,
                    Phone = Phone,
                    Email = Email,
                    MoreInfo = MoreInfo,
                    ContractDate = ContractDate
                };
                var item = DataProvider.Instance.DB.Customers.Where(x => x.Phone.Equals(customer.Phone) || x.Email.Equals(customer.Email));
                if (item.Count() == 0)
                {
                    DataProvider.Instance.DB.Customers.Add(customer);
                    DataProvider.Instance.DB.SaveChanges();
                    ListCustomers.Add(customer);
                }
                else
                    MessageBox.Show("Số điện thoại hoặc email đã bị trùng", "Thông báo", MessageBoxButton.OK, MessageBoxImage.Error);
            });

            DeleteCommand = new RelayCommand<object>((p) =>
            {
                //if (SelectedCustomer == null) return false;
                //var item = DataProvider.Instance.DB.Customers.Where(x => x.Id.Equals(SelectedCustomer.Id));
                //if (item.Count() > 0) return true;
                //return false;
                if (SelectedCustomer != null) return true;
                return false;

            }, (p) =>
            {
                var msg = MessageBox.Show("Bạn có chắc muốn xóa?", "Thông báo", MessageBoxButton.YesNo, MessageBoxImage.Question);
                if (msg == MessageBoxResult.Yes)
                {
                    var item = DataProvider.Instance.DB.Customers.Where(x => x.Id.Equals(SelectedCustomer.Id)).SingleOrDefault();
                    if (item != null)
                    {
                        DataProvider.Instance.DB.Customers.Remove(item);
                        DataProvider.Instance.DB.SaveChanges();

                        ListCustomers.Remove(item);
                    }
                    else return;
                }
            });

            LoadedCommand = new RelayCommand<Window>((p) => { return true; }, (p) =>
            {
                SelectedCustomer = null;
                DisplayName = null;
                Address = null;
                Phone = null;
                Email = null;
                MoreInfo = null;
                ContractDate = null;
            });
        }
    }
}
