using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Input;
using QuanLyKho_MVVM.Models;

namespace QuanLyKho_MVVM.ViewModels
{
    class SupplierViewModel : BaseViewModel
    {
        #region Properties
        private ObservableCollection<Supplier> _listSuppliers;
        private string _displayName = string.Empty;
        private string _address = string.Empty;
        private string _phone = string.Empty;
        private string _email = string.Empty;
        private string _moreInfo = string.Empty;
        private DateTime? _contractDate = null;
        private Supplier _selectedSupplier;

        public ObservableCollection<Supplier> ListSuppliers { get => _listSuppliers; set { _listSuppliers = value; OnPropertyChanged(); } }
        public Supplier SelectedSupplier
        {
            get => _selectedSupplier; set
            {
                _selectedSupplier = value;
                OnPropertyChanged();

                if (SelectedSupplier != null)
                {
                    DisplayName = SelectedSupplier.DisplayName;
                    Address = SelectedSupplier.Address;
                    Phone = SelectedSupplier.Phone;
                    Email = SelectedSupplier.Email;
                    MoreInfo = SelectedSupplier.MoreInfo;
                    ContractDate = SelectedSupplier.ContractDate;
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
        public ICommand LoadedWindowCommand { get; set; }
        public ICommand MouseWheelCommand { get; set; }
        #endregion

        public SupplierViewModel()
        {
            EditCommand = new RelayCommand<object>((p) =>
            {
                if (SelectedSupplier != null) return true;
                return false;
            }, (p) =>
            {
                if (SelectedSupplier != null)
                {
                    var item = DataProvider.Instance.DB.Suppliers.Where(x => x.Id.Equals(SelectedSupplier.Id)).SingleOrDefault();
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
                Supplier supplier = new Supplier()
                {
                    DisplayName = DisplayName,
                    Address = Address,
                    Phone = Phone,
                    Email = Email,
                    MoreInfo = MoreInfo,
                    ContractDate = ContractDate
                };
                var item = DataProvider.Instance.DB.Suppliers.Where(x => x.Phone.Equals(supplier.Phone) || x.Email.Equals(supplier.Email));
                if (item.Count() == 0)
                {
                    DataProvider.Instance.DB.Suppliers.Add(supplier);
                    DataProvider.Instance.DB.SaveChanges();
                    ListSuppliers.Add(supplier);
                }
                else
                    MessageBox.Show("Số điện thoại hoặc email đã bị trùng", "Thông báo", MessageBoxButton.OK, MessageBoxImage.Error);
            });

            DeleteCommand = new RelayCommand<object>((p) =>
            {
                if (SelectedSupplier != null) return true;
                return false;

            }, (p) =>
            {
                var msg = MessageBox.Show("Bạn có chắc muốn xóa?", "Thông báo", MessageBoxButton.YesNo, MessageBoxImage.Question);
                if (msg == MessageBoxResult.Yes)
                {
                    var item = DataProvider.Instance.DB.Suppliers.Where(x => x.Id.Equals(SelectedSupplier.Id)).SingleOrDefault();
                    if (item != null)
                    {
                        DataProvider.Instance.DB.Suppliers.Remove(item);
                        DataProvider.Instance.DB.SaveChanges();

                        ListSuppliers.Remove(item);
                    }
                    else return;
                }
            });

            LoadedWindowCommand = new RelayCommand<Window>((p) => { return true; }, (p) =>
            {
                ListSuppliers = new ObservableCollection<Supplier>(DataProvider.Instance.DB.Suppliers);
                SelectedSupplier = null;
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
