using QuanLyKho_MVVM.Models;
using System.Collections.ObjectModel;
using System.Linq;
using System.Windows;
using System.Windows.Input;

namespace QuanLyKho_MVVM.ViewModels
{
    class UserAdminViewModel : BaseViewModel
    {
        #region Properties
        private ObservableCollection<User> _listUser = null;
        private ObservableCollection<UserRole> _listUserRole = null;
        private string _displayName = string.Empty;
        private string _userName = string.Empty;
        private string _password = string.Empty;
        private User _selectedItem;
        private UserRole _selectedUserRole;

        public string DisplayName
        {
            get => _displayName;
            set
            {
                _displayName = value;
                OnPropertyChanged();
            }
        }
        public string UserName
        {
            get => _userName;
            set
            {
                _userName = value;
                OnPropertyChanged();
            }
        }
        public string Password
        {
            get => _password;
            set
            {
                _password = value;
                OnPropertyChanged();
            }
        }
        public UserRole SelectedUserRole
        {
            get => _selectedUserRole;
            set
            {
                _selectedUserRole = value;
                OnPropertyChanged();
            }
        }
        public User SelectedItem
        {
            get => _selectedItem;
            set
            {
                _selectedItem = value;
                OnPropertyChanged();
                if (SelectedItem != null)
                {
                    DisplayName = SelectedItem.DisplayName;
                    UserName = SelectedItem.UserName;
                    Password = SelectedItem.Password;
                    SelectedUserRole = SelectedItem.UserRole;


                }
            }
        }
        public ObservableCollection<User> ListUser
        {
            get => _listUser;
            set
            {
                _listUser = value;
                OnPropertyChanged();
            }
        }
        public ObservableCollection<UserRole> ListUserRole
        {
            get => _listUserRole;
            set
            {
                _listUserRole = value;
                OnPropertyChanged();
            }
        }
        #endregion

        #region Command
        public ICommand AddCommand { get; set; }
        public ICommand EditCommand { get; set; }
        public ICommand DeleteCommand { get; set; }
        public ICommand LoadedCommand { get; set; }
        public ICommand DeleteTextCommand { get; set; }
        #endregion

        public UserAdminViewModel()
        {
            EditCommand = new RelayCommand<object>((p) =>
            {
                if (SelectedItem != null) return true;
                return false;
            }, (p) =>
            {
                var item = DataProvider.Instance.DB.Users
                            .Where(x => x.Id == SelectedItem.Id).SingleOrDefault();
                if (item != null)
                {
                    item.DisplayName = DisplayName;
                    item.Password = Password;
                    item.UserName = UserName;
                    item.IdRole = SelectedUserRole.Id;
                    DataProvider.Instance.DB.SaveChanges();
                    ResetText();
                }
            });

            DeleteCommand = new RelayCommand<object>((p) =>
            {
                if (SelectedItem != null) return true;
                return false;
            }, (p) =>
            {
                var item = DataProvider.Instance.DB.Users.Where(x => x.Id == SelectedItem.Id).SingleOrDefault();
                if (item != null)
                {
                    DataProvider.Instance.DB.Users.Remove(item);
                    DataProvider.Instance.DB.SaveChanges();
                    ListUser.Remove(item);
                    ResetText();
                }
            });

            AddCommand = new RelayCommand<object>((p) =>
            {
                return true;
            }, (p) =>
            {
                if (!string.IsNullOrEmpty(DisplayName) && !string.IsNullOrEmpty(UserName) &&
                !string.IsNullOrEmpty(Password) && SelectedUserRole.Id != 0)
                {
                    var item = DataProvider.Instance.DB.Users
                            .Where(x => x.UserName.Equals(UserName));
                    if (item.Count() > 0)
                    {
                        MessageBox.Show("Username đã tồn tại", "Thông báo", MessageBoxButton.OK, MessageBoxImage.Error);
                    }
                    else
                    {
                        User user = new User()
                        {
                            DisplayName = DisplayName,
                            UserName = UserName,
                            Password = Password,
                            IdRole = SelectedUserRole.Id
                        };
                        DataProvider.Instance.DB.Users.Add(user);
                        DataProvider.Instance.DB.SaveChanges();

                        ListUser.Add(user);
                        ResetText();
                    }
                }
                else MessageBox.Show("Vui lòng nhập đủ thông tin", "Thông báo", MessageBoxButton.OK, MessageBoxImage.Error);

            });

            DeleteTextCommand = new RelayCommand<object>((p) =>
            {
                return true;
            }, (p) =>
            {
                DisplayName = string.Empty;
                Password = string.Empty;
                UserName = string.Empty;
                SelectedItem = null;
            });

            LoadedCommand = new RelayCommand<Window>((p) =>
            {
                return true;
            }, (p) =>
            {
                ListUser = new ObservableCollection<User>(DataProvider.Instance.DB.Users);
                ListUserRole = new ObservableCollection<UserRole>(DataProvider.Instance.DB.UserRoles);
                DisplayName = string.Empty;
                Password = string.Empty;
                UserName = string.Empty;
            });
        }

        void ResetText()
        {
            DisplayName = string.Empty;
            Password = string.Empty;
            UserName = string.Empty;
            SelectedItem = null;
        }
    }
}
