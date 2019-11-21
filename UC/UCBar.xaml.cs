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
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace QuanLyKho_MVVM.UC
{
    /// <summary>
    /// Interaction logic for UCBar.xaml
    /// </summary>
    public partial class UCBar : UserControl
    {
        public UCBar()
        {
            InitializeComponent();
        }

        private Window GetWindow()
        {
            return this.GetWindow();
        }

        FrameworkElement GetwindowParent(UserControl p)
        {
            FrameworkElement parent = p;
            while (parent.Parent != null)
            {
                parent = parent.Parent as FrameworkElement;
            }
            return parent;
        }

        private void Button_MouseEnter(object sender, MouseEventArgs e)
        {
            btnClose.Background = Brushes.Red;
            btnClose.BorderBrush = Brushes.Red;
        }

        private void btnClose_MouseLeave(object sender, MouseEventArgs e)
        {
            btnClose.Background = Brushes.White;
            btnClose.BorderBrush = Brushes.White;
        }

        private void btnClose_Click(object sender, RoutedEventArgs e)
        {
            FrameworkElement element = GetwindowParent(this);
            var window = element as Window;
            window.Close();
        }

        private void UserControl_MouseDown(object sender, MouseButtonEventArgs e)
        {
            FrameworkElement element = GetwindowParent(this);
            var window = element as Window;
            window.DragMove();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            FrameworkElement element = GetwindowParent(this);
            var window = element as Window;
            if (window.WindowState == WindowState.Maximized) window.WindowState = WindowState.Normal;
            else window.WindowState = WindowState.Maximized;
        }

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            FrameworkElement element = GetwindowParent(this);
            var window = element as Window;
            window.WindowState = WindowState.Minimized;
        }
    }
}
