   M S B A M L   `   `   `  ���� I  EQuanLyKho_MVVM, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null;"clr-namespace:QuanLyKho_MVVM.ViewsQuanLyKho_MVVM.Views  5clr-namespace:QuanLyKho_MVVM.UCQuanLyKho_MVVM.UC  %    QuanLyKho_MVVM.Views.OutputView   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     4local"clr-namespace:QuanLyKho_MVVM.Views     c _System.Windows.Interactivity, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35Bi:http://schemas.microsoft.com/expression/2010/interactivity  U QMaterialDesignThemes.Wpf, Version=2.6.0.325, Culture=neutral, PublicKeyToken=nullFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  (ucclr-namespace:QuanLyKho_MVVM.UC  -   $��
outputView��   OutputVM  � DataContext#  [  $��20(� � WindowState$ 	Maximized=� � WindowStartupLocation$ CenterScreen=� � 
ResizeMode$ NoResize=� � WindowStyle$
 None=� � Title$ Phiếu xuất hàng hóa��$	��700��$	��800�� J� InputBindings �� 
 �� Key$ F5�� �� Command �� *
AddCommand+�� $ F7�� �� *EditCommand+�� $ F6�� �� *DeleteCommand+�� $ F8�� �� *ExportBillCommand+.  (System.Windows.Interactivity.Interaction	   Triggers	 /  )System.Windows.Interactivity.EventTrigger  
   	EventName$
 Loaded��.  (System.Windows.Interactivity.TriggerBase   Actions. 6  0System.Windows.Interactivity.InvokeCommandAction     Command �� *LoadedWindowCommand+   CommandParameter ��  �� ElementName$ 
outputView��.��]� .+�   QuanLyKho_MVVM.UC.UCBar  $	��Top=�
 � Tag �� *Title+$ 
outputView��]� .+�#  MaterialDesignThemes.Wpf.Card  $��0��$��Stretch=�$��5q�$��1��$	��Top=�.���� $��Phiếu nhập��$��5q�.  (MaterialDesignThemes.Wpf.ColorZoneAssist   Mode$ Light=�.���  � ColumnDefinitions �� �� ��  � RowDefinitions �� �� �� �� �� .+��� )  #MaterialDesignThemes.Wpf.HintAssist   Hint$ Tên khách hàng��$��1��$��0��$��5q�$��2�� �� 
IsEditable .  & "MaterialDesignFloatingHintComboBox#��[  �� DisplayMemberPath$ DisplayName������ *ListCustomers+ �� SelectedItem �� *SelectedCustomer+�� $ Số điện thoại��{�.  $��0��$��0��$��5q� % !MaterialDesignFloatingHintTextBox#��[ ���� *SelectedCustomer.Phone+�� $ Nhà cung cấp��$��0��$��1��$��5q�{�.  #��[ ���� *%#SelectedObject.Supplier.DisplayName+�� $ Tên mặt hàng��$��1��$��1��$��5q� . #��[ $��2��$ DisplayName������ *
ListObject+ �� *SelectedObject+(	  "System.Windows.Controls.DatePicker	  $ Ngày nhập��$��0��$��3��$��5q� ( $MaterialDesignFloatingHintDatePicker#��[ {�.   	  SelectedDate �� *DateTimeInput+	  $ Ngày xuất��$��1��$��3��$��5q�#��[  �� *DateTimeOutput+ �� UpdateSourceTrigger$ PropertyChanged=��� $ Trạng thái��$��2��$��3��$��5q�
���  ��$��DemiBold"�#��[ {�.  ���� *StatusInputInfo+�� $
 Giá��$��2��$��2��$��5q�#��[ {�.  ���� *OutputPrice+�� $ 	Tồn kho��$��0��$��2��$��5q�{�.  #��[ ���� *
CountInput+�� $ Số lượng xuất��$��1��$��2��$��0,5,10,5q�#��[ ���� *CountOutput+.���� $��0��$��4��$��3�� �� Orientation$ 
Horizontal=�$��Right=�$��0 10 0 0q�.+��� $��50��$	��115��$��2q����	#FF49AEE8
����������� *
AddCommand+.���� $ 
Horizontal=�.+�'
  !MaterialDesignThemes.Wpf.PackIcon
  �  �ControlzEx.PackIconBase`1[[MaterialDesignThemes.Wpf.PackIconKind, MaterialDesignThemes.Wpf, Version=2.6.0.325, Culture=neutral, PublicKeyToken=null]]   Kind$	 Add=�$��Stretch=��� 
Thêm (F5)�� $��50��$	��115��$��2q����	#FF49AEE8
����������� *DeleteCommand+.���� $ 
Horizontal=�.+�
  $ Delete=�$��Stretch=��� $��	Xóa (F6)���� $��50��$	��115��$��2q����	#FF49AEE8
����������� *EditCommand+.���� $ 
Horizontal=�.+�
  $ ModeEditOutline=�$��Stretch=��� $��
Sửa (F7)��  $��Stretch=�$	��Top=�$��5q�.���� $ Tìm kiếm hàng��$��5q����� *Search+$ PropertyChanged=�  $��Stretch=�$��5q�$��Bottom=�.���  �� �� �� ��  �� �� .+��� $ Tổng tiền��{�.  $��3��$��5q�
���  ��$��DemiBold"����� *	SumOutput+�� $��50��$	��135��$��2q����	#FF49AEE8
�������$��1��$��2��$��2��$��Right=����� *EditCommand+.���� $ 
Horizontal=�.+�
  $ ModeEditOutline=�$��Stretch=��� $��Tính tiền (F8)��  $��1��$��2��$��Stretch=�$��5q�$	��Top=�.���� $��
Hóa đơn��$��5q�$ Light=�.��]� .+��� $
��Auto=�$
��Auto=�$	��Top=�.���� ���� *ListOutputInfos+ �� Mode$ TwoWay=� �� *SelectedOutputInfo+$ OneWayToSource=� �� View �� .P��� $��Tên hàng hóa�� �� DisplayMemberBinding �� *Object.DisplayName+�� $��Số lượng�� �� *Count+�� $��Giá tiền�� �� *InputInfo.OutputPrice+