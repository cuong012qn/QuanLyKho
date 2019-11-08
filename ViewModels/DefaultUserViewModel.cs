using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;
using QuanLyKho_MVVM.Models;


namespace QuanLyKho_MVVM.ViewModels
{
    class DefaultUserViewModel : BaseViewModel
    {
        public User User { get; set; }
        private string _displayName = string.Empty;
        private string _userName = string.Empty;
        private string _oldPassword = string.Empty;
        private string _newPassword = string.Empty;


        public DefaultUserViewModel()
        {
            OldPasswordCommand = new RelayCommand<PasswordBox>((p) => { return true; }, (p) => { OldPassword = p.Password; });
            NewPasswordCommand = new RelayCommand<PasswordBox>((p) => { return true; }, (p) => { NewPassword = p.Password; });
            ExitCommand = new RelayCommand<Window>((p) => { return true; }, (p) => { p.Close(); });
            EditCommand = new RelayCommand<object>((p) => { return true; }, (p) =>
            {
                if (!string.IsNullOrEmpty(DisplayName) && !string.IsNullOrEmpty(OldPassword) &&
                !string.IsNullOrEmpty(NewPassword))
                {
                    User user = DataProvider.Instance.DB.Users.Where(x => x.UserName.Equals(UserName) && x.Password.Equals(OldPassword)).SingleOrDefault();
                    if (user != null)
                    {
                        user.DisplayName = DisplayName;
                        user.Password = NewPassword;
                        DataProvider.Instance.DB.SaveChanges();
                        MessageBox.Show("Thay đổi thành công", "Thông báo", MessageBoxButton.OK);
                    }
                    else
                    {
                        MessageBox.Show("Không thể thay đổi", "Thông báo", MessageBoxButton.OK, MessageBoxImage.Error);
                    }
                }
            });
            //User = DataProvider.Instance.DB.Users.FirstOrDefault();
            //DisplayName = User.DisplayName;
            //UserName = User.UserName;
            //Password = User.Password;
        }

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
        public string OldPassword
        {
            get => _oldPassword;
            set
            {
                _oldPassword = value;
                OnPropertyChanged();
            }
        }
        public string NewPassword
        {
            get => _newPassword;
            set
            {
                _newPassword = value;
                OnPropertyChanged();
            }
        }
        public ICommand EditCommand { get; set; }
        public ICommand ExitCommand { get; set; }
        public ICommand NewPasswordCommand { get; set; }
        public ICommand OldPasswordCommand { get; set; }
    }
}
