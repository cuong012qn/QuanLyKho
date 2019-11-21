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
    class UnitViewModel : BaseViewModel
    {
        private int _id;
        private string _displayName;
        private ObservableCollection<Unit> _listUnit;
        private Unit _selectedUnit;

        public int Id { get => _id; set { _id = value; OnPropertyChanged(); } }
        public string DisplayName { get => _displayName; set { _displayName = value; OnPropertyChanged("DisplayName"); } }
        public ObservableCollection<Unit> ListUnit { get => _listUnit; set { _listUnit = value; OnPropertyChanged(); } }
        public Unit SelectedUnit
        {
            get => _selectedUnit; set
            {
                _selectedUnit = value;
                OnPropertyChanged();
                if (SelectedUnit != null) DisplayName = SelectedUnit.DisplayName;

            }
        }

        #region Command
        public ICommand EditCommand { get; set; }
        public ICommand DeleteCommand { get; set; }
        public ICommand AddCommand { get; set; }
        public ICommand LoadedWindowCommand { get; set; }
        #endregion

        public UnitViewModel()
        {
            LoadCommand();
        }

        async void LoadList()
        {
            await Task.Run(() => { ListUnit = new ObservableCollection<Unit>(DataProvider.Instance.DB.Units); });
        }

        void LoadCommand()
        {

            EditCommand = new RelayCommand<object>((p) =>
            {
                //if (SelectedUnit == null) return false;
                //var item = DataProvider.Instance.DB.Customers.Where(x => x.Id.Equals(SelectedUnit.Id));
                //if (item != null && item.Count() > 0) return true;
                //return false;
                if (SelectedUnit != null) return true;
                return false;
            }, (p) =>
            {
                if (SelectedUnit != null)
                {
                    var item = DataProvider.Instance.DB.Units.Where(x => x.Id.Equals(SelectedUnit.Id)).FirstOrDefault();
                    if (item != null)
                    {
                        item.DisplayName = DisplayName;
                        DataProvider.Instance.DB.SaveChanges();
                    }
                }
            });

            AddCommand = new RelayCommand<object>((p) =>
            {
                return true;
            }, (p) =>
            {
                if (!string.IsNullOrEmpty(DisplayName))
                {
                    Unit unit = new Unit();
                    unit.DisplayName = DisplayName;
                    var item = DataProvider.Instance.DB.Units.Where(x => x.DisplayName.Equals(unit.DisplayName));
                    if (item.Count() == 0)
                    {
                        DataProvider.Instance.DB.Units.Add(unit);
                        DataProvider.Instance.DB.SaveChanges();
                        ListUnit.Add(unit);
                    }
                    else
                        MessageBox.Show("Đơn vị đã bị trùng", "Thông báo", MessageBoxButton.OK, MessageBoxImage.Error);

                }
            });

            DeleteCommand = new RelayCommand<object>((p) =>
            {
                //if (SelectedUnit == null) return false;
                //var item = DataProvider.Instance.DB.Customers.Where(x => x.Id.Equals(SelectedUnit.Id));
                //if (item.Count() > 0) return true;
                //return false;
                if (SelectedUnit != null) return true;
                return false;

            }, (p) =>
            {
                var msg = MessageBox.Show("Bạn có chắc muốn xóa?", "Thông báo", MessageBoxButton.YesNo, MessageBoxImage.Question);
                if (msg == MessageBoxResult.Yes)
                {
                    var check = DataProvider.Instance.DB.Objects.Where(x => x.IdUnit.Equals(SelectedUnit.Id)).SingleOrDefault();
                    if (check == null)
                    {
                        var item = DataProvider.Instance.DB.Units.Where(x => x.Id.Equals(SelectedUnit.Id)).SingleOrDefault();
                        if (item != null)
                        {
                            DataProvider.Instance.DB.Units.Remove(item);
                            DataProvider.Instance.DB.SaveChanges();
                            ListUnit.Remove(item);
                        }
                        else return;
                    }
                    else MessageBox.Show("Không thể xóa dữ liệu này", "Thông báo", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            });

            LoadedWindowCommand = new RelayCommand<Window>((p) => { return true; }, (p) =>
            {
                LoadList();
                SelectedUnit = null;
            });
        }
    }
}
