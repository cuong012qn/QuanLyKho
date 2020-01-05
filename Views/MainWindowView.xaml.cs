using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using MaterialDesignThemes.Wpf;
using QuanLyKho_MVVM.ViewModels;
using QuanLyKho_MVVM.UC;

namespace QuanLyKho_MVVM.Views
{
    /// <summary>
    /// Interaction logic for MainWindowBetaView.xaml
    /// </summary>
    public partial class MainWindowBetaView : Window
    {
        public MainWindowBetaView()
        {
            InitializeComponent();
            UCSpace.Content = null;
            var item = new UCInputCount();
            UCSpace.Content = item;
        }

        private void UnitCommand(object sender, RoutedEventArgs e)
        {
            ExMain.IsExpanded = false;
            UCSpace.Content = null;
            var item = new UnitUCView();
            UCSpace.Content = item;
            //if ((item.DataContext as UnitUCViewModel).IsLoaded) DialogHost.CloseDialogCommand.Execute(null, null);
        }

        private void ObjectCommand(object sender, RoutedEventArgs e)
        {
            ExMain.IsExpanded = false;
            UCSpace.Content = null;
            var item = new ObjectUCView();
            UCSpace.Content = item;
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
  
        }

        private void MainCommand(object sender, RoutedEventArgs e)
        {
            ExMain.IsExpanded = false;
            UCSpace.Content = null;
            var item = new UCInputCount();
            UCSpace.Content = item;
        }

        private void InputCommand(object sender, RoutedEventArgs e)
        {
            if (TbDisplayNameUserRole.Text.Equals("Admin"))
            {
                ExMain.IsExpanded = false;
                UCSpace.Content = null;
                var item = new InputUCView();
                UCSpace.Content = item;
            }
            else
            {
                ExMain.IsExpanded = false;
                UCSpace.Content = null;
                var item = new InputUCStaffView();
                UCSpace.Content = item;
            }
        }

        private void OutputCommand(object sender, RoutedEventArgs e)
        {
            ExMain.IsExpanded = false;
            UCSpace.Content = null;
            var item = new OutputUCView();
            UCSpace.Content = item;
        }

        private void CustomerCommand(object sender, RoutedEventArgs e)
        {
            ExMain.IsExpanded = false;
            UCSpace.Content = null;
            var item = new CustomerUCView();
            UCSpace.Content = item;
        }

        private void SupplierCommand(object sender, RoutedEventArgs e)
        {
            ExMain.IsExpanded = false;
            UCSpace.Content = null;
            var item = new SupplierUCView();
            UCSpace.Content = item;
        }
    }
}
