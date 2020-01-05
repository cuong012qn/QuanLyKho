using QuanLyKho_MVVM.Models;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;
using QuanLyKho_MVVM.Views;
using System.ComponentModel;
using MaterialDesignThemes.Wpf;

namespace QuanLyKho_MVVM.ViewModels
{
    class UCUnitViewModel : BaseViewModel
    {
        private LoadingView loadingview;
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

        public UCUnitViewModel()
        {
            LoadCommand();
        }

        private void BgWk_DoWork(object sender, DoWorkEventArgs e)
        {
            if (loadingview.Equals(null))
            {
                loadingview = new LoadingView();
                DialogHost.Show(loadingview, "RootMainWindow");

            }
        }

        async void LoadList()
        {
            //bgWk = new BackgroundWorker();
            //bgWk.RunWorkerAsync();
            loadingview = new LoadingView();
            var temp = DialogHost.Show(loadingview, "RootMainWindow");
            Task task = Task.Run(() => { ListUnit = new ObservableCollection<Unit>(DataProvider.Instance.DB.Units); });
            await task;
            if (task.IsCompleted)
            {
                DialogHost.CloseDialogCommand.Execute(null, null);
            }
        }

        void LoadCommand()
        {
            EditCommand = new RelayCommand<object>((p) =>
            {
                return true;
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
                return true;

            }, (p) =>
            {
                if (SelectedUnit != null)
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
                }
            });

            LoadedWindowCommand = new RelayCommand<UserControl>((p) => { return true; }, (p) =>
            {
                LoadList();
                SelectedUnit = null;
                DisplayName = string.Empty;
            });
        }
    }
}
