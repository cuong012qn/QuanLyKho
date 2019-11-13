using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Input;
using QuanLyKho_MVVM.Models;
using Object = QuanLyKho_MVVM.Models.Object;

namespace QuanLyKho_MVVM.ViewModels
{
    class ObjectViewModel : BaseViewModel
    {
        private ObservableCollection<Unit> _listUnit;
        private ObservableCollection<Supplier> _listSupplier;
        private ObservableCollection<Object> _listObject;
        private Object _selectedObject;
        private Unit _selectedUnit;
        private Supplier _selectedSupplier;
        private string _displayName;
        private string _qrCode;
        private string _barCode;

        public ICommand EditCommand { get; set; }
        public ICommand AddCommand { get; set; }
        public ICommand DeleteCommand { get; set; }
        public ICommand LoadedCommand { get; set; }

        public Object SelectedObject
        {
            get => _selectedObject;
            set
            {
                _selectedObject = value;
                OnPropertyChanged();
                if (SelectedObject != null)
                {
                    DisplayName = SelectedObject.DisplayName;
                    QrCode = SelectedObject.QRCode;
                    BarCode = SelectedObject.BarCode;
                    SelectedUnit = SelectedObject.Unit;
                    SelectedSupplier = SelectedObject.Supplier;
                }
            }
        }

        public Unit SelectedUnit { get => _selectedUnit; set { _selectedUnit = value; OnPropertyChanged(); } }
        public Supplier SelectedSupplier { get => _selectedSupplier; set { _selectedSupplier = value; OnPropertyChanged(); } }

        public ObservableCollection<Unit> ListUnit { get => _listUnit; set { _listUnit = value; OnPropertyChanged(); } }
        public ObservableCollection<Supplier> ListSupplier { get => _listSupplier; set { _listSupplier = value; OnPropertyChanged(); } }
        public ObservableCollection<Object> ListObject { get => _listObject; set { _listObject = value; OnPropertyChanged(); } }

        public string DisplayName { get => _displayName; set { _displayName = value; OnPropertyChanged(); } }
        public string QrCode { get => _qrCode; set { _qrCode = value; OnPropertyChanged(); } }
        public string BarCode { get => _barCode; set { _barCode = value; OnPropertyChanged(); } }

        public ObjectViewModel()
        {
            LoadedCommand = new RelayCommand<Window>((p) => { return true; }, (p) =>
            {
                ListObject = new ObservableCollection<Object>(DataProvider.Instance.DB.Objects);
                ListUnit = new ObservableCollection<Unit>(DataProvider.Instance.DB.Units);
                ListSupplier = new ObservableCollection<Supplier>(DataProvider.Instance.DB.Suppliers);
            });

            EditCommand = new RelayCommand<object>((p) =>
            {
                if (SelectedObject != null) return true;
                return false;
            }, (p) =>
            {
                if (SelectedObject != null)
                {
                    var item = DataProvider.Instance.DB.Objects.Where(x => x.Id.Equals(SelectedObject.Id)).SingleOrDefault();
                    if (item != null)
                    {
                        item.DisplayName = DisplayName;
                        item.QRCode = QrCode;
                        item.BarCode = BarCode;
                        item.IdUnit = SelectedUnit.Id;
                        item.IdSuplier = SelectedSupplier.Id;
                        DataProvider.Instance.DB.SaveChanges();
                    }
                }
            });

            AddCommand = new RelayCommand<object>((p) =>
            {
                return true;
            }, (p) =>
            {
                if (!string.IsNullOrEmpty(DisplayName) && SelectedUnit != null && SelectedSupplier != null)
                {
                    Object obj = new Object()
                    {
                        Id = Guid.NewGuid().ToString(),
                        DisplayName = DisplayName,
                        BarCode = BarCode,
                        QRCode = QrCode,
                        IdUnit = SelectedUnit.Id,
                        IdSuplier = SelectedSupplier.Id
                    };
                    DataProvider.Instance.DB.Objects.Add(obj);
                    DataProvider.Instance.DB.SaveChanges();
                    ListObject.Add(obj);
                }
                else MessageBox.Show("Vui lòng nhập đủ thông tin!", "Thông báo", MessageBoxButton.OK, MessageBoxImage.Error);
            });

            DeleteCommand = new RelayCommand<object>((p) =>
            {
                return true;
            }, (p) =>
            {
                if (SelectedObject != null)
                {
                    var item = DataProvider.Instance.DB.Objects.Where(x => x.Id.Equals(SelectedObject.Id)).SingleOrDefault();
                    if (item != null)
                    {
                        DataProvider.Instance.DB.Objects.Remove(item);
                        DataProvider.Instance.DB.SaveChanges();
                        ListObject.Remove(item);
                    }
                }
                else MessageBox.Show("Không thể xóa dữ liệu", "Thông báo", MessageBoxButton.OK, MessageBoxImage.Error);
            });
        }
    }
}
