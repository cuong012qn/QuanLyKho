using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
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

namespace QuanLyKho_MVVM.Views
{
    /// <summary>
    /// Interaction logic for OutputUCView.xaml
    /// </summary>
    public partial class OutputUCView : UserControl
    {
        public OutputUCView()
        {
            InitializeComponent();
        }

        private void TextBox_TextChanged(object sender, TextChangedEventArgs e)
        {

            if (Regex.IsMatch((sender as TextBox).Text, "^[0-9]*$")) e.Handled = true;
        }

        private void TextBox_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            if (Regex.IsMatch((sender as TextBox).Text, "^[0-9]*$")) e.Handled = true;
        }
    }
}
